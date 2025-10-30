<?php
date_default_timezone_set("Asia/Bangkok");
defined('BASEPATH') or exit('No direct script access allowed');
class Ap_schedules extends CI_Controller
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
            $this->load->view('finance/ap_schedules');
        } else {
            redirect('error_access');
        }
    }

    function readExchangeRate($currency, $payment_date)
    {
        $search_date = date("d", strtotime($payment_date));
        if($search_date == "31"){
          $payment_date = date("Y-m-d", strtotime('-10 days', strtotime($payment_date)));
        }
        
        $monthBf = date('Y-m-01', strtotime('-1 month', strtotime($payment_date)));
        $exchange = $this->crud->read('exchange_rates', [], ["start_date" => $monthBf, "currency_from" => $currency, "currency_to" => "INR"]);

        if ($exchange) {
            $amount = $exchange->middle;
        } else {
            $amount = 1;
        }

        return $amount;
    }

    public function exchangeRates($trans_date, $currency_from, $currency_to, $amount = 0){
        $query_exchange = $this->db->query("SELECT * FROM exchange_rates WHERE start_date <= '$trans_date' and end_date >= '$trans_date' and currency_from = '$currency_to' and currency_to = '$currency_from'");
        $row_exchange = $query_exchange->row();

        if($currency_to == "INR"){
            return $amount;
        }else{
            if($row_exchange){
                $total = ($amount / $row_exchange->middle);
            }else{
                $total = $amount;
            }
    
            return $total;
        }
    }

    public function begin_balance($supplier_id, $filter_from, $filter_to, $filter_currency, $filter_status = "", $balance_local){
        if($filter_currency == "INR" || $filter_currency == ""){
            $filter_currency = "";
            $currency = "INR";
        }else{
            $filter_currency = $filter_currency;
            $currency = $filter_currency;
        }

        $query = $this->db->query("SELECT number, trans_date, currency, document_no, account_number,
                (CASE WHEN '$currency' = 'INR' THEN SUM(local_debit) ELSE SUM(original_debit) END) as local_debit,
                (CASE WHEN '$currency' = 'INR' THEN SUM(local_credit) ELSE SUM(original_credit) END) as local_credit
            FROM journal_postings
            WHERE company_id = '$supplier_id' and modul NOT IN ('CLEARING','BANK STATEMENT') and journal_date < '$filter_from'
            AND account_number IN ('16000001','16000002','16000003','16000004','16000005','16000006','16000007','16000008')
            GROUP BY number, document_no, account_number");
        $purchase_invoices = $query->result_array();

        $local_debit = 0;
        $local_credit = 0;
        foreach ($purchase_invoices as $purchase_invoice) {
            if($currency != "INR"){
                $ex_local_debit = $this->exchangeRates($purchase_invoice['trans_date'], $purchase_invoice['currency'], $currency, $purchase_invoice['local_debit']);
                $ex_local_credit = $this->exchangeRates($purchase_invoice['trans_date'], $purchase_invoice['currency'], $currency, $purchase_invoice['local_credit']);
            }else{
                $ex_local_debit = $purchase_invoice['local_debit'];
                $ex_local_credit = $purchase_invoice['local_credit'];
            }

            $local_debit += $ex_local_debit;
            $local_credit += $ex_local_credit;
        }

        // die($balance_local ." + ". $local_credit . " - " . $local_debit);
        $begin_balance = ($balance_local + $local_credit - $local_debit);
        return $begin_balance;
    }

    public function formatNo($amount){
        if ($amount >= 0) {
            return number_format(@$amount, 2);
        } else {
            return "<span style='color:red;'>(" . number_format(abs($amount), 2) . ")</span>";
        }
    }

    public function print($option = "")
    {
        if ($option == "excel") {
            $format  = date("Ymd");
            header("Content-type: application/vnd-ms-excel");
            header("Content-Disposition: attachment; filename=ap_aging_schedules_$format.xls");
        }
        $filter_from = base64_decode($this->input->get("filter_from"));
        $filter_to = base64_decode($this->input->get("filter_to"));
        $filter_supplier = $this->input->get("filter_supplier");
        $filter_currency = $this->input->get("filter_currency");
        $period = date("Ym", strtotime($filter_to));

        if($filter_currency == "INR"){
            $filter_currency = "";
            $currency = "INR";
        }else{
            $filter_currency = $filter_currency;
            $currency = $filter_currency;
        }

        //Config
        $this->db->select('*');
        $this->db->from('config');
        $config = $this->db->get()->row();

        $this->db->select("a.*, b.account_number, c.account_name, (CASE WHEN '$currency' = 'INR' THEN b.balance_local ELSE b.balance END) as balance_local");
        $this->db->from('suppliers a');
        $this->db->join('account_balance_suppliers b', 'a.id = b.supplier_id', 'left');
        $this->db->join('account_coa c', 'b.account_number = c.account_number', 'left');
        $this->db->like("a.id", $filter_supplier);
        $this->db->group_by('a.id');
        $this->db->order_by('a.name', 'asc');
        $suppliers = $this->db->get()->result_array();

        $html = '<html><head><title>Print Data</title></head><style>body {font-family: Arial, Helvetica, sans-serif;}#customers {border-collapse: collapse;width: 100%;font-size: 12px;}#customers td, #customers th {border: 1px solid #ddd;padding: 2px;}#customers tr:nth-child(even){background-color: #f2f2f2;}#customers tr:hover {background-color: #ddd;}#customers th {padding-top: 2px;padding-bottom: 2px;text-align: center;color: black;}</style><body>
            <center>
                <div style="float: left; font-size: 12px; text-align: left;">
                    <table style="width: 100%;">
                        <tr>
                            <td width="50" style="font-size: 12px; vertical-align: top; text-align: center; vertical-align:jus margin-right:10px;">
                                <img src="' . $config->favicon . '" width="30">
                            </td>
                            <td style="font-size: 14px; text-align: left; margin:2px;">
                                <b>' . $config->name . '</b><br>
                                <small>REPORT ACCOUNT PAYABLE AGING</small><br>
                                <small>PERIOD : <b>' . $filter_from . '</b> To <b>' . $filter_to . '</b></small>
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
            
            <table id="customers" border="1">
            <tr>
                <th rowspan="2" width="20">No</th>
                <th rowspan="2">Supplier Name</th>
                <th rowspan="2">Currency</th>
                <th rowspan="2">Current</th>
                <th colspan="9">Amount Due</th>
                <th rowspan="2">Grand Total</th>
            </tr>
            <tr>
                <th>1-30 Days</th>
                <th>31-45 Days</th>
                <th>46-60 Days</th>
                <th>61-75 Days</th>
                <th>76-90 Days</th>
                <th>91-120 Days</th>
                <th>121-180 Days</th>
                <th>181-365 Days</th>
                <th>Over 365 Days</th>
            </tr>';

        $no = 1;
        $grand_total_begin = 0;
        $grand_total_current = 0;
        $grand_total_week_1 = 0;
        $grand_total_week_2 = 0;
        $grand_total_week_3 = 0;
        $grand_total_week_4 = 0;
        $grand_total_week_5 = 0;
        $grand_total_week_6 = 0;
        $grand_total_week_7 = 0;
        $grand_total_week_8 = 0;
        $grand_total_week_9 = 0;
        $grand_total_all = 0;
        $header = "";

        foreach ($suppliers as $supplier) {
            $supplier_id = $supplier['id'];
            $supplier_name = $supplier['name'];

            //Purchase invoicing
            $query_1 = $this->db->query("SELECT 
                (CASE 
                    WHEN a.modul = 'PURCHASE INVOICING' THEN 'PI'
                    WHEN a.modul = 'AP PAYMENT' THEN 'AP'
                    WHEN a.modul = 'ADJUSTMENT' THEN 'AD'
                    WHEN a.modul = 'CLEARING' THEN 'CL'
                    ELSE 'NA' END
                ) AS source,
                a.document_no,
                a.invoice_no,
                a.trans_date,
                a.journal_date AS posting_date,
                a.number AS voucher_no,
                a.account_number,
                b.number AS cl_no,
                b.journal_date AS cl_date,
                a.currency,
                a.original_debit,
                a.original_credit,
                a.local_debit,
                a.local_credit,
                a.status
                FROM (SELECT number, modul, document_no, invoice_no, journal_date, account_number, currency, company_id, description, status, trans_date,
                        SUM(original_debit) AS original_debit,
                        SUM(original_credit) AS original_credit,
                        SUM(local_debit) AS local_debit,
                        SUM(local_credit) AS local_credit 
                    FROM journal_postings
                    WHERE account_number IN ('16000001','16000002','16000003','16000004','16000005','16000006','16000007','16000008') 
                    AND company_id = '$supplier_id'
                    AND journal_date BETWEEN '$filter_from' and '$filter_to'
                    GROUP BY number, document_no, account_number, modul
                    ) a
                LEFT JOIN (SELECT * FROM journal_clearings GROUP BY document_no, company_id, description) b ON a.document_no = b.document_no AND a.company_id = b.company_id AND a.description = b.description
                WHERE a.modul NOT IN ('CLEARING','BANK STATEMENT')
                GROUP BY a.number, a.document_no, a.account_number
                ORDER BY a.journal_date ASC");
            $purchase_invoices = $query_1->result_array();

            if($supplier['currency'] == $filter_currency || $filter_currency == ""){
                $begin_balance_local = $this->begin_balance($supplier_id, $filter_from, $filter_to, $filter_currency, "", @$supplier['balance_local']);
            }else{
                $begin_balance_local = $this->begin_balance($supplier_id, $filter_from, $filter_to, $filter_currency, "", 0);
            }
            
            $current = @$begin_balance_local;
            $week_1 = 0;
            $week_2 = 0;
            $week_3 = 0;
            $week_4 = 0;
            $week_5 = 0;
            $week_6 = 0;
            $week_7 = 0;
            $week_8 = 0;
            $week_9 = 0;
            $arr = [];

            foreach ($purchase_invoices as $purchase_invoice) {
                $document_no = $purchase_invoice['document_no'];

                $cl_no = $purchase_invoice['cl_no'];
                $cl_date = $purchase_invoice['cl_date'];
                $invoice_date = $purchase_invoice['trans_date'];
                $payment_due = $purchase_invoice['trans_date'];
                $total_payment = 0;
                $cl_no_array = array();
                $cl_date_array = array();
                if($purchase_invoice['source'] == "PI"){
                    $payments = $this->db->query("SELECT payment_no, payment_date, payment, account_type FROM ap_payments WHERE purchase_invoice = '$document_no'")->result_array();
                    $purchase = $this->db->query("SELECT * FROM purchase_invoices WHERE number = '$document_no'")->row_array();

                    $invoice_date = $purchase['invoice_date'];
                    $payment_due = $purchase['due_date'];

                    if($cl_no != ""){
                        $cl_no_array[] = $cl_no;
                        $cl_date_array[] = $cl_date;
                    }
                    
                    foreach ($payments as $payment) {
                        $cl_no_array[] = $payment['payment_no'];
                        $cl_date_array[] = $payment['payment_date'];

                        if($cl_no == ""){
                            if($payment['account_type'] == "DEBIT"){
                                $total_payment += $payment['payment'];
                            }else{
                                $total_payment -= $payment['payment'];
                            }
                        }
                    }
                    
                    $cl_no = implode(", ", $cl_no_array);
                    $cl_date = implode(", ", $cl_date_array);
                }elseif($purchase_invoice['source'] == "AP"){
                    $qpayment = $this->db->query("SELECT * FROM ap_payments WHERE payment_no = '$document_no' and purchase_invoice IN (SELECT DISTINCT number FROM purchase_invoices)")->result_array();

                    if($cl_no != ""){
                        $cl_no_array[] = $cl_no;
                        $cl_date_array[] = $cl_date;
                    }

                    foreach ($qpayment as $payment) {
                        $cl_no_array[] = $payment['payment_no'];
                        $cl_date_array[] = $payment['payment_date'];

                        if($payment['account_type'] == "DEBIT"){
                            $total_payment -= $payment['payment'];
                        }else{
                            $total_payment += $payment['payment'];
                        }
                    }

                    $cl_no = implode(", ", array_unique($cl_no_array));
                    $cl_date = implode(", ", array_unique($cl_date_array));
                }

                if($currency != "INR"){
                    $ex_local_debit = $this->exchangeRates($purchase_invoice['trans_date'], $purchase_invoice['currency'], $currency, $purchase_invoice['original_debit']);
                    $ex_local_credit = $this->exchangeRates($purchase_invoice['trans_date'], $purchase_invoice['currency'], $currency, $purchase_invoice['original_credit']);
                }else{
                    $ex_local_debit = $purchase_invoice['local_debit'];
                    $ex_local_credit = $purchase_invoice['local_credit'];
                }

                // if($cl_no == ""){
                //     $balance = ($purchase_invoice['original_credit'] - $purchase_invoice['original_debit']);
                // }elseif($total_payment != 0){
                //     $balance = ($purchase_invoice['original_credit'] - $purchase_invoice['original_debit'] - $total_payment);
                // }else{
                //     $balance = 0;
                // }
                
                // if ($cl_no == "" || round($balance, 2) != 0) {
                    $balance_local = ($ex_local_credit - $ex_local_debit);
                // } else {
                //     $balance_local = 0;
                // }

                $date1 = new DateTime($payment_due);
                $date2 = new DateTime($filter_to);
                $diviation = $date1->diff($date2);

                if($diviation->days <= 0){
                    $current += $balance_local;
                } elseif ($diviation->days >= 1 && $diviation->days <= 30) {
                    $week_1 += $balance_local;
                } elseif ($diviation->days >= 31 && $diviation->days <= 45) {
                    $week_2 += $balance_local;
                } elseif ($diviation->days >= 46 && $diviation->days <= 60) {
                    $week_3 += $balance_local;
                } elseif ($diviation->days >= 61 && $diviation->days <= 75) {
                    $week_4 += $balance_local;
                } elseif ($diviation->days >= 76 && $diviation->days <= 90) {
                    $week_5 += $balance_local;
                } elseif ($diviation->days >= 91 && $diviation->days <= 120) {
                    $week_6 += $balance_local;
                } elseif ($diviation->days >= 121 && $diviation->days <= 180) {
                    $week_7 += $balance_local;
                } elseif ($diviation->days >= 181 && $diviation->days <= 365) {
                    $week_8 += $balance_local;  
                } else {
                    $week_9 += $balance_local;
                }

                $arr[] = array(
                    "document_no" => @$purchase_invoice['document_no'],
                    "trans_date" => @$purchase_invoice['trans_date'],
                    "due_date" => @$purchase_invoice['due_date'],
                    "difference" => $diviation->days,
                    "total" => @$balance_local,
                );

            }
            
            // die(json_encode($arr));

            if(abs($current + $week_1 + $week_2 + $week_3 + $week_4 + $week_5 + $week_6 + $week_7 + $week_8 + $week_9) > 0){
                $header .= '  <tr>
                                <td style="text-align:center">' . $no . '</td>
                                <td>' . $supplier['name'] . '</td>
                                <td style="text-align:center;">INR</td>
                                <td style="text-align:right;">' . $this->formatNo($current) . '</td>
                                <td style="text-align:right;">' . $this->formatNo($week_1) . '</td>
                                <td style="text-align:right;">' . $this->formatNo($week_2) . '</td>
                                <td style="text-align:right;">' . $this->formatNo($week_3) . '</td>
                                <td style="text-align:right;">' . $this->formatNo($week_4) . '</td>
                                <td style="text-align:right;">' . $this->formatNo($week_5) . '</td>
                                <td style="text-align:right;">' . $this->formatNo($week_6) . '</td>
                                <td style="text-align:right;">' . $this->formatNo($week_7) . '</td>
                                <td style="text-align:right;">' . $this->formatNo($week_8) . '</td>
                                <td style="text-align:right;">' . $this->formatNo($week_9) . '</td>
                                <td style="text-align:right;">' . $this->formatNo(($current + $week_1 + $week_2 + $week_3 + $week_4 + $week_5 + $week_6 + $week_7 + $week_8 + $week_9)) . '</td>
                            </tr>';
                $no++;
            }

            $grand_total_current += $current;
            $grand_total_week_1 += $week_1;
            $grand_total_week_2 += $week_2;
            $grand_total_week_3 += $week_3;
            $grand_total_week_4 += $week_4;
            $grand_total_week_5 += $week_5;
            $grand_total_week_6 += $week_6;
            $grand_total_week_7 += $week_7;
            $grand_total_week_8 += $week_8;
            $grand_total_week_9 += $week_9;
            $grand_total_all += ($current + $week_1 + $week_2 + $week_3 + $week_4 + $week_5 + $week_6 + $week_7 + $week_8 + $week_9);
        }

        $header .= '  <tr>
                        <td style="text-align:right;" colspan="3"><b>GRAND TOTAL</b></td>
                        <td style="text-align:right;">' . $this->formatNo($grand_total_current) . '</td>
                        <td style="text-align:right;">' . $this->formatNo($grand_total_week_1) . '</td>
                        <td style="text-align:right;">' . $this->formatNo($grand_total_week_2) . '</td>
                        <td style="text-align:right;">' . $this->formatNo($grand_total_week_3) . '</td>
                        <td style="text-align:right;">' . $this->formatNo($grand_total_week_4) . '</td>
                        <td style="text-align:right;">' . $this->formatNo($grand_total_week_5) . '</td>
                        <td style="text-align:right;">' . $this->formatNo($grand_total_week_6) . '</td>
                        <td style="text-align:right;">' . $this->formatNo($grand_total_week_7) . '</td>
                        <td style="text-align:right;">' . $this->formatNo($grand_total_week_8) . '</td>
                        <td style="text-align:right;">' . $this->formatNo($grand_total_week_9) . '</td>
                        <td style="text-align:right;">' . $this->formatNo($grand_total_all) . '</td>
                    </tr>';

        $htmlend = '</table></body></html>';
        echo $html . $header . $htmlend;
    }
}
