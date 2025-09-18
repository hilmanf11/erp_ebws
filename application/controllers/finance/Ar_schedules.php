<?php
date_default_timezone_set("Asia/Bangkok");
defined('BASEPATH') or exit('No direct script access allowed');
class Ar_schedules extends CI_Controller
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
            $this->load->view('finance/ar_schedules');
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

    public function print($option = "")
    {
        if ($option == "excel") {
            $format  = date("Ymd");
            header("Content-type: application/vnd-ms-excel");
            header("Content-Disposition: attachment; filename=ap_aging_schedules_$format.xls");
        }
        $filter_from = base64_decode($this->input->get("filter_from"));
        $filter_to = base64_decode($this->input->get("filter_to"));
        $filter_customer = $this->input->get("filter_customers");
        $period = date("Ym", strtotime($filter_to));

        $start  = new DateTime($filter_from);
        $end = new DateTime($filter_to);
        $diff  = $start->diff($end);

        //Config
        $this->db->select('*');
        $this->db->from('config');
        $config = $this->db->get()->row();

        $this->db->select('a.*, b.plant, (COALESCE(b.balance_local, 0)) as balance_local, (COALESCE(b.balance, 0)) as balance');
        $this->db->from('customers a');
        $this->db->join('account_balance_customers b', 'a.id = b.customer_id', 'left');
        if($filter_customer != ""){
            $this->db->where("a.id", $filter_customer);
        }
        $this->db->group_by('a.id');
        $this->db->group_by('b.plant');
        $this->db->order_by('a.name', 'asc');
        $customers = $this->db->get()->result_array();

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
                                <small>REPORT ACCOUNT RECEIVABLE AGING</small><br>
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
                <th rowspan="2">Customer Name</th>
                <th rowspan="2">Plant</th>
                <th rowspan="2">Currency</th>
                <th rowspan="2">Current</th>
                <th colspan="7">Amount Due</th>
                <th rowspan="2">Grand Total</th>
            </tr>
            <tr>
                <th>1-30 Days</th>
                <th>31-60 Days</th>
                <th>61-90 Days</th>
                <th>91-120 Days</th>
                <th>121-180 Days</th>
                <th>181-365 Days</th>
                <th>Over 365 Days</th>
            </tr>';

        $no = 1;
        $grand_total_current = 0;
        $grand_total_week_1 = 0;
        $grand_total_week_2 = 0;
        $grand_total_week_3 = 0;
        $grand_total_week_4 = 0;
        $grand_total_week_5 = 0;
        $grand_total_week_6 = 0;
        $grand_total_week_7 = 0;
        $grand_total_all = 0;
        $header = "";

        foreach ($customers as $customer) {
            $customer_id = $customer['id'];
            $customer_name = $customer['name'];
            $plant = $customer['plant'];
            $company_name = "(".$plant.") ".$customer_name;
            $company_name2 = $customer_name . " | " . $plant;

            $query = $this->db->query("SELECT a.*
                FROM (
                    (SELECT datediff('$filter_to', a.due_date) as difference, 'PI' as `status`, a.trans_date, a.due_date, a.number as document_no, a.so_number as sales_invoice, c.account_number, c.number as voucher_no, a.currency, c.original_debit, c.original_credit, c.local_debit, c.local_credit, c.rates
                    FROM sales_invoices a
                    JOIN (SELECT number, document_no, account_number, rates, SUM(local_debit) as local_debit, SUM(local_credit) as local_credit, SUM(original_debit) as original_debit, SUM(original_credit) as original_credit FROM 
                        journal_postings WHERE account_number IN ('27000001') GROUP BY number, document_no, account_number) c ON a.number = c.document_no
                    WHERE a.trans_date between '$filter_from' and '$filter_to' and a.customer_id = '$customer_id' and a.plant = '$plant'
                    ) 
                UNION 
                    (SELECT '' as difference, 'AP' as `status`, a.receipt_date as trans_date, '-' as due_date, a.sales_invoice, a.receipt_no as document_no, c.account_number, c.number as voucher_no, a.currency, c.original_debit, c.original_credit, c.local_debit, c.local_credit, c.rates
                    FROM ar_receipts a
                    JOIN (SELECT number, document_no, account_number, rates, SUM(local_debit) as local_debit, SUM(local_credit) as local_credit, SUM(original_debit) as original_debit, SUM(original_credit) as original_credit FROM 
                        journal_postings WHERE account_number IN ('27000001') GROUP BY number, document_no, account_number) c ON a.receipt_no = c.document_no
                    WHERE a.receipt_date between '$filter_from' and '$filter_to' and a.customer_id = '$customer_id' and a.plant = '$plant' GROUP BY a.receipt_no
                    )
                UNION 
                    (SELECT '' as difference, 'CR' as `status`, a.journal_date as trans_date, '-' as due_date, a.invoice_no as sales_invoice, a.document_no, a.account_number, a.number as voucher_no, a.currency, a.original_debit, a.original_credit, a.local_debit, a.local_credit, a.rates
                    FROM journal_postings a
                    WHERE a.journal_date between '$filter_from' and '$filter_to' and a.company_id = '$customer_id' and a.company_name like '%$company_name%' and a.modul in ('CURRENCY REVALUATION','ADJUSTMENT') and a.account_number IN ('27000001')
                    )
                ) a GROUP BY a.voucher_no, a.document_no ORDER BY a.trans_date ASC");
            $sales_invoices = $query->result_array();

            $this->db->select('COALESCE(SUM(local_debit) + SUM(local_credit), 0) as local_pi, COALESCE(SUM(original_debit) + SUM(original_credit), 0) as original_pi');
            $this->db->from('(SELECT DISTINCT customer_id, plant, number, trans_date FROM sales_invoices) a');
            $this->db->join("journal_postings b", "a.number = b.document_no and b.account_number IN ('27000001')");
            $this->db->where('a.customer_id', $customer_id);
            $this->db->where('a.plant', $plant);
            $this->db->where('a.trans_date <', $filter_from);
            $pi_begin = $this->db->get()->row();

            $this->db->select('COALESCE(SUM(a.local_credit) - SUM(a.local_debit), 0) as local_re, COALESCE(SUM(a.original_credit) - SUM(a.original_debit), 0) as original_re');
            $this->db->from('journal_postings a');
            $this->db->where("a.journal_date <", $filter_from);
            $this->db->where_in("a.modul", array('CURRENCY REVALUATION'));
            $this->db->where_in("a.account_number", array('27000001'));
            $this->db->where("a.company_id", $customer_id);
            $this->db->like("a.company_name", $company_name);
            $revaluation_begin = $this->db->get()->row();
            
            $this->db->select('COALESCE(SUM(local_debit) + SUM(local_credit), 0) as local_ap, COALESCE(SUM(original_debit) + SUM(original_credit), 0) as original_ap');
            $this->db->from('(SELECT DISTINCT customer_id, plant, receipt_no, receipt_date FROM ar_receipts) a');
            $this->db->join("journal_postings b", "a.receipt_no = b.document_no and b.account_number IN ('27000001')");
            $this->db->where('a.customer_id', $customer_id);
            $this->db->where('a.plant', $plant);
            $this->db->where('a.receipt_date <', $filter_from);
            $ap_begin = $this->db->get()->row();

            if(@$customer['balance'] > 0 || $pi_begin->local_pi > 0 || $ap_begin->local_ap > 0 || $revaluation_begin->local_re > 0){
                $begin_balance_local = (@$customer['balance_local'] + ($pi_begin->local_pi - $revaluation_begin->local_re - abs($ap_begin->local_ap)));
            }else{
                $begin_balance_local = 0;
            }

            $current = @$begin_balance_local;
            $week_1 = 0;
            $week_2 = 0;
            $week_3 = 0;
            $week_4 = 0;
            $week_5 = 0;
            $week_6 = 0;
            $week_7 = 0;
            $arr = [];

            $total_pi = 0;
            $total_cr = 0;
            $total_ap = 0;

            foreach ($sales_invoices as $sales_invoice) {
                $this->db->select("a.sales_invoice, a.receipt_no as document_no, a.account_number, a.currency, COALESCE(b.local_debit, 0) as local_debit, COALESCE(b.local_credit, 0) as local_credit");
                $this->db->from('ar_receipts a');
                $this->db->join('ar_receipt_journals b', "a.receipt_no = b.receipt_no and b.account_number in ('27000001')");
                $this->db->where_in('a.account_number', ['27000001']);
                $this->db->where('a.sales_invoice', $sales_invoice['document_no']);
                $this->db->where('a.customer_id', $customer_id);
                $this->db->where('a.plant', $plant);
                $this->db->where("a.receipt_date BETWEEN '$filter_from' and '$filter_to'");
                $ap = $this->db->get()->row();

                if($sales_invoice['status'] == "PI"){
                    $total_pi = ($sales_invoice['local_debit'] - $sales_invoice['local_credit']);
                }else{
                    $total_pi = 0;
                }

                if($sales_invoice['status'] == "AP"){
                    $total_ap = ($sales_invoice['local_credit'] - $sales_invoice['local_debit']);
                }else{
                    $total_ap = 0;
                }

                if($sales_invoice['status'] == "CR"){
                    $total_cr = ($sales_invoice['local_debit'] - $sales_invoice['local_credit']);
                }else{
                    $total_cr = 0;
                }

                $total_pi_ap = (($total_pi + $total_cr) - $total_ap);

                if(empty(@$ap->document_no)){
                    if(@$sales_invoice['difference'] <= 0){
                        $current += $total_pi_ap;
                    } elseif (@$sales_invoice['difference'] >= 1 && @$sales_invoice['difference'] <= 30) {
                        $week_1 += $total_pi_ap;
                    } elseif (@$sales_invoice['difference'] >= 31 && @$sales_invoice['difference'] <= 60) {
                        $week_2 += $total_pi_ap;
                    } elseif (@$sales_invoice['difference'] >= 61 && @$sales_invoice['difference'] <= 90) {
                        $week_3 += $total_pi_ap;
                    } elseif (@$sales_invoice['difference'] >= 91 && @$sales_invoice['difference'] <= 120) {
                        $week_4 += $total_pi_ap;
                    } elseif (@$sales_invoice['difference'] >= 121 && @$sales_invoice['difference'] <= 180) {
                        $week_5 += $total_pi_ap;
                    } elseif (@$sales_invoice['difference'] >= 181 && @$sales_invoice['difference'] <= 365) {
                        $week_6 += $total_pi_ap;  
                    } else {
                        $week_7 += $total_pi_ap;
                    }
                }else{
                    $current += $total_pi_ap;
                }

                $arr[] = array(
                    "document_no" => @$sales_invoice['document_no'],
                    "trans_date" => @$sales_invoice['trans_date'],
                    "due_date" => @$sales_invoice['due_date'],
                    "difference" => @$sales_invoice['difference'],
                    "total" => @$total_pi_ap,
                );
            }

            // die(json_encode(number_format($total_ap)));

            if($current >= 0){
                $t_current = number_format(abs($current), 2);
            }else{
                $t_current = "<span style='color:red;'>(".number_format(abs($current), 2).")</span>";
            }

            if($week_1 >= 0){
                $t_week_1 = number_format(abs($week_1), 2);
            }else{
                $t_week_1 = "<span style='color:red;'>(".number_format(abs($week_1), 2).")</span>";
            }

            if($week_2 >= 0){
                $t_week_2 = number_format(abs($week_2), 2);
            }else{
                $t_week_2 = "<span style='color:red;'>(".number_format(abs($week_2), 2).")</span>";
            }

            if($week_3 >= 0){
                $t_week_3 = number_format(abs($week_3), 2);
            }else{
                $t_week_3 = "<span style='color:red;'>(".number_format(abs($week_3), 2).")</span>";
            }

            if($week_4 >= 0){
                $t_week_4 = number_format(abs($week_4), 2);
            }else{
                $t_week_4 = "<span style='color:red;'>(".number_format(abs($week_4), 2).")</span>";
            }

            if($week_5 >= 0){
                $t_week_5 = number_format(abs($week_5), 2);
            }else{
                $t_week_5 = "<span style='color:red;'>(".number_format(abs($week_5), 2).")</span>";
            }

            if($week_6 >= 0){
                $t_week_6 = number_format(abs($week_6), 2);
            }else{
                $t_week_6 = "<span style='color:red;'>(".number_format(abs($week_6), 2).")</span>";
            }

            if($week_7 >= 0){
                $t_week_7 = number_format(abs($week_7), 2);
            }else{
                $t_week_7 = "<span style='color:red;'>(".number_format(abs($week_7), 2).")</span>";
            }

            if(abs($current + $week_1 + $week_2 + $week_3 + $week_4 + $week_5 + $week_6 + $week_7) > 0){
                $header .= '  <tr>
                                <td style="text-align:center">' . $no . '</td>
                                <td>' . $customer['name'] . '</td>
                                <td>' . $customer['plant'] . '</td>
                                <td style="text-align:center;">INR</td>
                                <td style="text-align:right;">' . $t_current . '</td>
                                <td style="text-align:right;">' . $t_week_1 . '</td>
                                <td style="text-align:right;">' . $t_week_2 . '</td>
                                <td style="text-align:right;">' . $t_week_3 . '</td>
                                <td style="text-align:right;">' . $t_week_4 . '</td>
                                <td style="text-align:right;">' . $t_week_5 . '</td>
                                <td style="text-align:right;">' . $t_week_6 . '</td>
                                <td style="text-align:right;">' . $t_week_7 . '</td>
                                <td style="text-align:right;">' . number_format(($current + $week_1 + $week_2 + $week_3 + $week_4 + $week_5 + $week_6 + $week_7), 2) . '</td>
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
            $grand_total_all += ($current + $week_1 + $week_2 + $week_3 + $week_4 + $week_5 + $week_6 + $week_7);
        }

        $header .= '  <tr>
                        <td style="text-align:right;" colspan="4"><b>GRAND TOTAL</b></td>
                        <td style="text-align:right;">' . number_format($grand_total_current, 2) . '</td>
                        <td style="text-align:right;">' . number_format($grand_total_week_1, 2) . '</td>
                        <td style="text-align:right;">' . number_format($grand_total_week_2, 2) . '</td>
                        <td style="text-align:right;">' . number_format($grand_total_week_3, 2) . '</td>
                        <td style="text-align:right;">' . number_format($grand_total_week_4, 2) . '</td>
                        <td style="text-align:right;">' . number_format($grand_total_week_5, 2) . '</td>
                        <td style="text-align:right;">' . number_format($grand_total_week_6, 2) . '</td>
                        <td style="text-align:right;">' . number_format($grand_total_week_7, 2) . '</td>
                        <td style="text-align:right;">' . number_format($grand_total_all, 2) . '</td>
                    </tr>';

        $htmlend = '</table></body></html>';
        echo $html . $header . $htmlend;
    }
}
