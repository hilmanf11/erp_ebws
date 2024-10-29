<?php
date_default_timezone_set("Asia/Bangkok");
defined('BASEPATH') or exit('No direct script access allowed');
class Report_ar extends CI_Controller
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
            $this->load->view('finance/report_ar');
        } else {
            redirect('error_access');
        }
    }

    public function print($option = "")
    {
        if ($option == "excel") {
            $format  = date("Ymd");
            header("Content-type: application/vnd-ms-excel");
            header("Content-Disposition: attachment; filename=report_ar$format.xls");
        }

        $filter_from = base64_decode($this->input->get("filter_from"));
        $filter_to = base64_decode($this->input->get("filter_to"));
        $filter_customer = $this->input->get("filter_customer");
        $filter_currency = $this->input->get("filter_currency");
        $filter_payment = $this->input->get("filter_payment");

        //Config
        $this->db->select('*');
        $this->db->from('config');
        $config = $this->db->get()->row();

        $this->db->select('c.name as customer_name, a.number, a.trans_date, a.due_date, 
            a.currency, a.total_grand, b.total_receipt, b.receipt_no, b.receipt_date, a.status');
        $this->db->from('sales_invoices a');
        $this->db->join('ar_receipts b', 'a.number = b.sales_invoice', 'left');
        $this->db->join('customers c', 'a.customer_id = c.id');
        $this->db->where("a.trans_date between '$filter_from' and '$filter_to'");
        $this->db->like("a.customer_id", $filter_customer);
        $this->db->like("a.currency", $filter_currency);
        $this->db->like("a.status", $filter_payment);
        $this->db->group_by('a.number');
        $this->db->order_by('c.name', 'asc');
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
                <h3 style="margin:0;">ACCOUNT RECEIVALBLE REPORT <i>(Details)</i></h3>
                <small>PERIOD : <b>' . $filter_from . '</b> To <b>' . $filter_to . '</b></small>
            </center>
            <br><br>
            
            <table id="customers" border="1">
            <tr>
                <th width="20">No</th>
                <th>Supplier Name</th>
                <th>Sales<br>Invoice No</th>
                <th>Invoice<br>Date</th>
                <th>Payment<br>Due</th>
                <th>Currency</th>
                <th>Sales<br>Amount</th>
                <th>Amount<br>Receipt</th>
                <th>Receipt<br>Balance</th>
                <th>Receipt No</th>
                <th>Receipt<br>Date</th>
                <th>Receipt<br>Status</th>
            </tr>';

        $no = 1;
        $grand_total_inv = 0;
        $grand_total_pay = 0;
        $grand_total_bal = 0;
        foreach ($invoices as $invoice) {
            if ($invoice['currency'] == "IDR") {
                $decimal = 0;
            } else {
                $decimal = 2;
            }

            if (($invoice['total_receipt'] - $invoice['total_grand']) >= 0) {
                $style = "color: black;";
            } else {
                $style = "color: red;";
            }

            if ($invoice['status'] == "0") {
                $status = "OPEN";
            } else {
                $status = "CLOSE";
            }

            $html .= '  <tr>
                            <td style="text-align:center">' . $no . '</td>
                            <td>' . $invoice['customer_name'] . '</td>
                            <td>' . $invoice['number'] . '</td>
                            <td>' . $invoice['trans_date'] . '</td>
                            <td>' . $invoice['due_date'] . '</td>
                            <td style="text-align:center;">' . $invoice['currency'] . '</td>
                            <td style="text-align:right;">' . number_format($invoice['total_grand'], $decimal) . '</td>
                            <td style="text-align:right;">' . number_format($invoice['total_receipt'], $decimal) . '</td>
                            <td style="text-align:right;' . $style . '">' . number_format(($invoice['total_receipt'] - $invoice['total_grand']), $decimal) . '</td>
                            <td>' . $invoice['receipt_no'] . '</td>
                            <td>' . $invoice['receipt_date'] . '</td>
                            <td>' . $status . '</td>
                        </tr>';

            $grand_total_inv += $invoice['total_grand'];
            $grand_total_pay += $invoice['total_receipt'];
            $grand_total_bal += ($invoice['total_receipt'] - $invoice['total_grand']);
            $no++;
        }

        if (($grand_total_bal) >= 0) {
            $style2 = "color: black;";
        } else {
            $style2 = "color: red;";
        }

        $html .= '  <tr>
                        <th style="text-align:right;" colspan="6"><b>GRAND TOTAL</b></th>
                        <th style="text-align:right;">' . number_format($grand_total_inv, 2) . '</th>
                        <th style="text-align:right;">' . number_format($grand_total_pay, 2) . '</th>
                        <th style="text-align:right;' . $style2 . '">' . number_format($grand_total_bal, 2) . '</th>
                        <th colspan="3"></th>
                    </tr>';

        $html .= '</table></body></html>';
        echo $html;
    }
}
