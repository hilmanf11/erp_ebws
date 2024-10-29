<?php
date_default_timezone_set("Asia/Bangkok");
defined('BASEPATH') or exit('No direct script access allowed');
class Report_ap extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->helper('url');
        $this->load->helper(array('form', 'url'));
        $this->load->library('form_validation');
        $this->load->library('session');
        $this->load->model('crud');
        //Validasi Form
        $this->form_validation->set_rules('item_id', 'Product No', 'required|min_length[1]|max_length[50]');
    }

    public function index()
    {
        if (empty($this->session->username)) {
            redirect('error_session');
        } elseif ($this->checkuserAccess($this->id_menu()) > 0) {
            $data['button'] = $this->getbutton($this->id_menu());
            $this->load->view('template/header', $data);
            $this->load->view('finance/report_ap');
        } else {
            redirect('error_access');
        }
    }

    public function print($option = "")
    {
        if ($option == "excel") {
            $format  = date("Ymd");
            header("Content-type: application/vnd-ms-excel");
            header("Content-Disposition: attachment; filename=report_ap_$format.xls");
        }

        $filter_from = base64_decode($this->input->get("filter_from"));
        $filter_to = base64_decode($this->input->get("filter_to"));
        $filter_supplier = $this->input->get("filter_supplier");
        $filter_currency = $this->input->get("filter_currency");
        $filter_payment = $this->input->get("filter_payment");

        //Config
        $this->db->select('*');
        $this->db->from('config');
        $config = $this->db->get()->row();

        $this->db->select('c.name as supplier_name, a.balance, a.purchase_invoice, a.supplier_invoice, b.trans_date, b.due_date, a.currency, a.amount, a.payment, a.payment_no, a.payment_date, b.status');
        $this->db->from('ap_payments a');
        $this->db->join('purchase_invoices b', 'a.purchase_invoice = b.number');
        $this->db->join('suppliers c', 'a.supplier_id = c.id');
        $this->db->where("b.trans_date between '$filter_from' and '$filter_to'");
        $this->db->like("a.supplier_id", $filter_supplier);
        $this->db->like("a.currency", $filter_currency);
        $this->db->like("a.status", $filter_payment);
        $this->db->group_by('a.purchase_invoice');
        $this->db->order_by('a.payment_no', 'asc');
        $invoices = $this->db->get()->result_array();

        $html = '<html><head><title>Print Data</title></head><style>body {font-family: Arial, Helvetica, sans-serif;}#customers {border-collapse: collapse;width: 100%;font-size: 12px;}#customers td, #customers th {border: 1px solid #ddd;padding: 2px;}#customers tr:nth-child(even){background-color: #f2f2f2;}#customers tr:hover {background-color: #ddd;}#customers th {padding-top: 2px;padding-bottom: 2px;text-align: center;color: black;}</style><body>
            <center>
                <div style="float: left; font-size: 12px; text-align: left;">
                    <table style="width: 100%;">
                        <tr>
                            <td width="50" style="font-size: 12px; vertical-align: top; text-align: center; vertical-align:jus margin-right:10px;">
                                <img src="' . $config->favicon . '" width="30">
                            </td>
                            <td style="font-size: 14px; text-align: left; margin:2px;">
                                <b style="font-size:14px;">' . $config->name . '</b><br>
                                <span style="font-size:10px;">' . $config->address . '</span><br>
                            </td>
                        </tr>
                    </table>
                </div>
                <div style="float: right; font-size: 12px; text-align: right;">
                    Print Date ' . date("d M Y H:i:s") . ' <br>
                    Print By ' . $this->session->username . '  
                </div>
            </center>
            <br><br><br><br>
            <center>
                <h3 style="margin:0;">ACCOUNT PAYABLE REPORT <i>(Details)</i></h3>
                <small>PERIOD : <b>' . $filter_from . '</b> To <b>' . $filter_to . '</b></small>
            </center>
            <br><br>
            
            <table id="customers" border="1">
            <tr>
                <th width="20">No</th>
                <th>Supplier Name</th>
                <th>Purchase<br>Invoice No</th>
                <th>Invoice<br>Date</th>
                <th>Payment<br>Due</th>
                <th>Currency</th>
                <th>Purchase<br>Amount</th>
                <th>Amount<br>Balance</th>
                <th>Payment No</th>
                <th>Description</th>
                <th>Amount<br>Payment</th>
                <th>Payment<br>Balance</th>
                <th>Payment<br>Date</th>
                <th>Payment<br>Status</th>
            </tr>';

        $no = 1;
        $grand_total_inv = 0;
        $grand_total_pay = 0;
        $grand_total_bal = 0;
        $grand_total_pay2 = 0;
        foreach ($invoices as $invoice) {
            if ($invoice['currency'] == "IDR") {
                $decimal = 0;
            } else {
                $decimal = 2;
            }

            if ($invoice['status'] == "0") {
                $status = "OPEN";
            } else {
                $status = "CLOSE";
            }

            $this->db->select('*');
            $this->db->from('ap_payments');
            $this->db->where("purchase_invoice", $invoice['payment_no']);
            $this->db->order_by('payment_no', 'asc');
            $subinvoices = $this->db->get()->result_array();

            $html .= '  <tr>
                            <td style="text-align:center">' . $no . '</td>
                            <td>' . $invoice['supplier_name'] . '</td>
                            <td>' . $invoice['purchase_invoice'] . '</td>
                            <td>' . $invoice['trans_date'] . '</td>
                            <td>' . $invoice['due_date'] . '</td>
                            <td style="text-align:center;">' . $invoice['currency'] . '</td>
                            <td style="text-align:right;">' . number_format($invoice['amount'], $decimal) . '</td>
                            <td style="text-align:right;">' . number_format($invoice['balance'], $decimal) . '</td>
                            <td>' . $invoice['payment_no'] . '</td>
                            <td>' . $invoice['supplier_invoice'] . '</td>
                            <td style="text-align:right;">' . number_format($invoice['payment'], $decimal) . '</td>
                            <td style="text-align:right;">' . number_format(($invoice['amount'] - $invoice['payment']), $decimal) . '</td>
                            <td>' . $invoice['payment_date'] . '</td>
                            <td>' . $status . '</td>
                        </tr>';

            $payment = $invoice['payment'];
            $subpayment = 0;
            $subtotalpayment = 0;
            foreach ($subinvoices as $subinvoice) {
                $subtotalpayment = ($payment - $subinvoice['payment']);

                $html .= '  <tr>
                            <td style="text-align:center"></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td style="text-align:center;">-</td>
                            <td style="text-align:right;">-</td>
                            <td style="text-align:right;">-</td>
                            <td>' . $subinvoice['payment_no'] . '</td>
                            <td>' . $subinvoice['supplier_invoice'] . '</td>
                            <td style="text-align:right;">' . number_format($subinvoice['payment'], $decimal) . '</td>
                            <td style="text-align:right;">' . number_format($subtotalpayment, $decimal) . '</td>
                            <td>' . $subinvoice['payment_date'] . '</td>
                            <td>' . $status . '</td>
                        </tr>';

                $subpayment += $subinvoice['payment'];
            }

            $grand_total_inv += $invoice['amount'];
            $grand_total_pay += $invoice['balance'];
            $grand_total_pay2 += ($invoice['payment'] + $subpayment);
            $grand_total_bal += (($invoice['amount'] - $invoice['payment']) + $subtotalpayment);
            $no++;
        }

        $html .= '  <tr>
                        <th style="text-align:right;" colspan="6"><b>GRAND TOTAL</b></th>
                        <th style="text-align:right;">' . number_format($grand_total_inv) . '</th>
                        <th style="text-align:right;">' . number_format($grand_total_pay) . '</th>
                        <th colspan="2"></th>
                        <th style="text-align:right;">' . number_format($grand_total_pay2) . '</th>
                        <th style="text-align:right;">' . number_format($grand_total_bal) . '</th>
                        <th colspan="2"></th>
                    </tr>';

        $html .= '</table></body></html>';
        echo $html;
    }
}
