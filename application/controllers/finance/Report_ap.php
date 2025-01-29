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

    public function readPi($supplier_id)
    {
        $query = $this->crud->query("SELECT DISTINCT `number` FROM purchase_invoices WHERE supplier_id = '$supplier_id' ORDER BY `number` ASC");
        die(json_encode($query));
    }

    function readExchangeRate($currency, $payment_date)
    {
        $search_date = date("d", strtotime($payment_date));
        if ($search_date == "31") {
            $payment_date = date("Y-m-d", strtotime('-10 days', strtotime($payment_date)));
        }

        $monthBf = date('Y-m-01', strtotime($payment_date));
        $exchange = $this->crud->read('exchange_rates', [], ["start_date" => $monthBf, "currency_from" => $currency, "currency_to" => "INR"]);

        if ($exchange) {
            $amount = $exchange->middle;
        } else {
            $amount = 1;
        }

        return $amount;
    }

    public function begin_balance($supplier_id, $filter_from, $filter_status = "", $balance_local){
        $query = $this->db->query("SELECT 
                'PI' AS source,
                a.invoice_date AS trans_date,
                a.due_date,
                a.number AS document_no,
                a.invoice_no AS invoice_no,
                b.description,
                b.trans_date AS voucher_date,
                b.number AS voucher_no,
                b.account_number,
                a.currency,
                b.local_debit,
                b.local_credit,
                a.status
            FROM purchase_invoices a
            JOIN (SELECT trans_date, number, document_no, account_number, description, SUM(local_debit) AS local_debit, SUM(local_credit) AS local_credit 
                FROM journal_postings 
                WHERE account_number IN ('16000001','16000002','16000003','16000004','16000005','16000006','16000007','16000008') 
                GROUP BY number, document_no, account_number) b ON a.number = b.document_no
            WHERE a.supplier_id = '$supplier_id' and a.trans_date < '$filter_from' and a.status like '%$filter_status%'
            GROUP BY a.number
            UNION
            SELECT
                'AP' AS source,
                a.payment_date AS trans_date,
                '-' AS due_date,
                a.payment_no AS document_no,
                a.supplier_invoice AS invoice_no,
                a.remarks AS description,
                b.trans_date AS voucher_date,
                b.number AS voucher_no,
                b.account_number,
                a.currency,
                b.local_debit,
                b.local_credit,
                '1' as status
            FROM ap_payments a
            LEFT JOIN (SELECT trans_date, number, document_no, account_number, SUM(local_debit) AS local_debit, SUM(local_credit) AS local_credit 
                FROM journal_postings 
                WHERE account_number IN ('16000001','16000002','16000003','16000004','16000005','16000006','16000007','16000008') 
                GROUP BY number, document_no, account_number) b ON a.payment_no = b.document_no
            WHERE a.supplier_id = '$supplier_id' AND a.purchase_invoice NOT IN (SELECT DISTINCT number FROM purchase_invoices) and a.payment_date < '$filter_from'
            GROUP BY a.payment_no
            UNION
            SELECT
                'AD' AS source,
                a.journal_date AS trans_date,
                '-' AS due_date,
                a.document_no,
                a.invoice_no,
                a.description,
                a.trans_date AS voucher_date,
                a.number AS voucher_no,
                a.account_number,
                a.currency,
                SUM(a.local_debit) AS local_debit,
                SUM(a.local_credit) AS local_credit,
                (CASE WHEN SUM(a.local_debit) > 0 THEN 0 ELSE 1 END) as status
            FROM journal_postings a
            WHERE a.company_id = '$supplier_id' 
            AND a.modul IN ('CURRENCY REVALUATION','ADJUSTMENT') 
            AND a.account_number IN ('16000001','16000002','16000003','16000004','16000005','16000006','16000007','16000008','28000003','28000006')
            AND a.trans_date < '$filter_from'
            GROUP BY a.number
            ORDER BY trans_date ASC");
        $purchase_invoices = $query->result_array();

        $local_debit = 0;
        $local_credit = 0;
        foreach ($purchase_invoices as $purchase_invoice) {
            $document_no = $purchase_invoice['document_no'];
            $payments = $this->db->query("SELECT a.*, b.number as voucher_no, b.trans_date as voucher_date, a.account_number, (CASE WHEN b.local_debit IS NULL THEN 0 ELSE a.payment END) AS local_debit, 0 AS local_credit
                FROM ap_payments a
                LEFT JOIN journal_postings b ON a.payment_no = b.document_no
                WHERE a.purchase_invoice = '$document_no'
                GROUP BY a.payment_no")->result_array();

            foreach ($payments as $payment) {
                $local_debit += $payment['local_debit'];
                $local_credit += $payment['local_credit'];
            }

            $local_debit += $purchase_invoice['local_debit'];
            $local_credit += $purchase_invoice['local_credit'];
        }

        $begin_balance = ($balance_local + $local_credit - $local_debit);
        return $begin_balance;
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
        $filter_display = $this->input->get("filter_display");
        $filter_purchase_invoice = base64_decode($this->input->get("filter_purchase_invoice"));
        $filter_status = $this->input->get("filter_status");
        $period = date("Ym", strtotime($filter_to));

        if($filter_status == "0"){
            $ap_status = "1";
        }elseif($filter_status == "1"){
            $ap_status = "0";
        }else{
            $ap_status = "";
        }

        //Config
        $this->db->select('*');
        $this->db->from('config');
        $config = $this->db->get()->row();

        $this->db->select('a.*, (COALESCE(b.balance_local, 0)) as balance_local, (COALESCE(b.balance, 0)) as balance');
        $this->db->from('suppliers a');
        $this->db->join('account_balance_suppliers b', 'a.id = b.supplier_id', 'left');
        $this->db->like("a.id", $filter_supplier);
        $this->db->group_by('a.id');
        $this->db->order_by('a.name', 'asc');
        $suppliers = $this->db->get()->result_array();

        $html = '<html><head><title>Print Data</title></head><style>body {font-family: Arial, Helvetica, sans-serif;}#customers {border-collapse: collapse;width: 100%;font-size: 12px;}#customers td, #customers th {border: 1px solid #ddd;padding: 2px;}#customers tr:hover {background-color: #ddd;}#customers th {padding-top: 2px;padding-bottom: 2px;text-align: center;color: black;}</style><body>
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
                <h3 style="margin:0;">ACCOUNT PAYABLE REPORT <i>(' . $filter_display . ')</i></h3>
                <small>PERIOD : <b>' . $filter_from . '</b> To <b>' . $filter_to . '</b></small>
            </center>
            <br><br>';

        $summary = '<table id="customers" border="1">
                            <tr>
                                <th width="20">No</th>
                                <th>Supplier ID</th>
                                <th>Supplier Name</th>
                                <th>Currency</th>
                                <th>Amount</th>
                            </tr>';

        $invoice = '<table id="customers" border="1">
                        <tr>
                            <th rowspan="2" width="20">No</th>
                            <th rowspan="2" width="50">Status</th>
                            <th rowspan="2">Source</th>
                            <th rowspan="2">Invoice Date</th>
                            <th rowspan="2">Payment Due</th>
                            <th rowspan="2">Document No</th>
                            <th rowspan="2">Invoice No</th>
                            <th rowspan="2">Descripstion</th>
                            <th rowspan="2">Posting Date</th>
                            <th rowspan="2">Posting No</th>
                            <th rowspan="2">Account No</th>
                            <th rowspan="2">Currency</th>
                            <th colspan="3">LOCAL CURRENCY</th>
                        </tr>
                        <tr>
                            <th>Invoice</th>
                            <th>Payment</th>
                            <th>Remain</th>
                        </tr>';

        $detail = '<table id="customers" border="1">
                        <tr>
                            <th rowspan="2" width="20">No</th>
                            <th rowspan="2" width="50">Status</th>
                            <th rowspan="2">Source</th>
                            <th rowspan="2">Invoice Date</th>
                            <th rowspan="2">Payment Due</th>
                            <th rowspan="2">Document No</th>
                            <th rowspan="2">Invoice No</th>
                            <th rowspan="2">Descripstion</th>
                            <th rowspan="2">Posting Date</th>
                            <th rowspan="2">Posting No</th>
                            <th rowspan="2">Account No</th>
                            <th rowspan="2">Currency</th>
                            <th colspan="3">LOCAL CURRENCY</th>
                        </tr>
                        <tr>
                            <th>Debit</th>
                            <th>Credit</th>
                            <th>Balance</th>
                        </tr>';
        $no = 1;
        $noid = 1;
        $grand_local_debit = 0;
        $grand_local_credit = 0;
        $grand_local_balance = 0;
        foreach ($suppliers as $supplier) {
            $supplier_id = $supplier['id'];

<<<<<<< Updated upstream
            $query = $this->db->query("SELECT a.*
                    FROM (
                        (SELECT a.invoice_date as trans_date, a.due_date, a.invoice_no, a.invoice_no as document_no, c.account_number, a.number as voucher_no, a.currency, c.original_debit, c.original_credit, c.local_debit, c.local_credit, c.rates, c.description,c.voucher_date,a.status as status_purchase, a.por_no, d.receipt_date
                        FROM purchase_invoices a
                        JOIN (SELECT number, document_no, account_number, rates, SUM(local_debit) as local_debit, SUM(local_credit) as local_credit, SUM(original_debit) as original_debit, SUM(original_credit) as original_credit, description,trans_date as voucher_date FROM 
                            journal_postings WHERE account_number IN ('16000001','16000002','16000003','16000004','16000005','16000006','16000007','16000008') GROUP BY number, document_no, account_number) c ON a.number = c.document_no
                        LEFT JOIN (
                            select receipt_date, receipt_no from purchase_order_receipts group by receipt_no, receipt_date
                            union 
                            select receipt_date, receipt_no from purchase_order_receipt_others group by receipt_no, receipt_date
                        ) d on a.por_no = d.receipt_no
                        WHERE a.trans_date between '$filter_from' and '$filter_to' and a.supplier_id = '$supplier_id'
                        ) 
                    UNION 
                        (SELECT a.payment_date as trans_date, '-' as due_date, CONCAT(a.purchase_invoice, ' | ', a.supplier_invoice) as invoice_no, a.payment_no as document_no, c.account_number, c.number as voucher_no, a.currency, c.original_debit, c.original_credit, c.local_debit, c.local_credit, c.rates, a.note as description,c.voucher_date,'-' as status_purchase, '-' as por_no, '-' as receipt_date
                        FROM ap_payments a
                        JOIN (SELECT number, document_no, account_number, rates, SUM(local_debit) as local_debit, SUM(local_credit) as local_credit, SUM(original_debit) as original_debit, SUM(original_credit) as original_credit,trans_date as voucher_date  FROM 
                            journal_postings WHERE account_number IN ('16000001','16000002','16000003','16000004','16000005','16000006','16000007','16000008') GROUP BY number, document_no, account_number) c ON a.payment_no = c.document_no
                        WHERE a.payment_date between '$filter_from' and '$filter_to' and a.supplier_id = '$supplier_id' GROUP BY a.payment_no
                        )
                    UNION 
                        (SELECT a.trans_date as trans_date, '-' as due_date, a.invoice_no, a.document_no, a.account_number, a.number as voucher_no, a.currency, SUM(a.original_debit) as original_debit, SUM(a.original_credit) as original_credit, SUM(a.local_debit) as local_debit, SUM(a.local_credit) as local_credit, a.rates, a.description,a.journal_date as voucher_date, 
                            (CASE WHEN b.number is not null THEN 1 ELSE 0 END) as status_purchase, '-' as por_no, '-' as receipt_date
                        FROM journal_postings a
                        LEFT JOIN (SELECT `number`, invoice_no FROM journal_postings WHERE journal_date between '$filter_from' and '$filter_to' and company_id = '$supplier_id' and modul = 'ADJUSTMENT' and local_debit > 0) b ON a.invoice_no LIKE CONCAT('%', b.invoice_no, '%')
                        WHERE a.journal_date between '$filter_from' and '$filter_to' and (a.company_id = '$supplier_id') and a.modul in ('CURRENCY REVALUATION','ADJUSTMENT') and a.account_number IN ('16000001','16000002','16000003','16000004','16000005','16000006','16000007','16000008','28000003','28000006')
                        GROUP BY a.number, a.account_number, a.document_no)
                    ) a 
                    WHERE a.status_purchase like '%$filter_status%'
                    GROUP BY a.voucher_no, a.document_no ORDER BY a.trans_date ASC");
=======
            $query = $this->db->query("SELECT 
                    'PI' AS source,
                    a.invoice_date as trans_date,
                    a.due_date,
                    a.number AS document_no,
                    a.invoice_no AS invoice_no,
                    b.description,
                    b.trans_date AS voucher_date,
                    b.number AS voucher_no,
                    b.account_number,
                    a.currency,
                    b.local_debit,
                    b.local_credit,
                    a.status
                FROM purchase_invoices a
                JOIN (SELECT trans_date, number, document_no, account_number, description, SUM(local_debit) AS local_debit, SUM(local_credit) AS local_credit 
                    FROM journal_postings 
                    WHERE account_number IN ('16000001','16000002','16000003','16000004','16000005','16000006','16000007','16000008') 
                    GROUP BY number, document_no, account_number) b ON a.number = b.document_no
                WHERE a.supplier_id = '$supplier_id' and a.trans_date BETWEEN '$filter_from' and '$filter_to' and a.status like '%$filter_status%'
                GROUP BY a.number
                UNION
                SELECT
                    'AP' AS source,
                    a.payment_date AS trans_date,
                    '-' AS due_date,
                    a.payment_no AS document_no,
                    a.supplier_invoice AS invoice_no,
                    a.remarks AS description,
                    b.trans_date AS voucher_date,
                    b.number AS voucher_no,
                    b.account_number,
                    a.currency,
                    b.local_debit,
                    b.local_credit,
                    '1' as status
                FROM ap_payments a
                LEFT JOIN (SELECT trans_date, number, document_no, account_number, SUM(local_debit) AS local_debit, SUM(local_credit) AS local_credit 
                    FROM journal_postings 
                    WHERE account_number IN ('16000001','16000002','16000003','16000004','16000005','16000006','16000007','16000008') 
                    GROUP BY number, document_no, account_number) b ON a.payment_no = b.document_no
                WHERE a.supplier_id = '$supplier_id' AND a.purchase_invoice NOT IN (SELECT DISTINCT number FROM purchase_invoices) and a.payment_date BETWEEN '$filter_from' and '$filter_to' and a.status like '%$ap_status%'
                GROUP BY a.payment_no
                UNION
                SELECT
                    'AD' AS source,
                    a.journal_date AS trans_date,
                    '-' AS due_date,
                    a.document_no,
                    a.invoice_no,
                    a.description,
                    a.trans_date AS voucher_date,
                    a.number AS voucher_no,
                    a.account_number,
                    a.currency,
                    SUM(a.local_debit) AS local_debit,
                    SUM(a.local_credit) AS local_credit,
                    (CASE WHEN SUM(a.local_debit) > 0 THEN 1 ELSE 0 END) as status
                FROM journal_postings a
                WHERE a.company_id = '$supplier_id' 
                AND a.modul IN ('CURRENCY REVALUATION','ADJUSTMENT') 
                AND a.account_number IN ('16000001','16000002','16000003','16000004','16000005','16000006','16000007','16000008','28000003','28000006')
                AND a.trans_date BETWEEN '$filter_from' and '$filter_to'
                GROUP BY a.number
                ORDER BY trans_date ASC");
>>>>>>> Stashed changes
            $purchase_invoices = $query->result_array();
            // die($this->db->last_query());

            $local_debit = 0;
            $local_credit = 0;

            $begin_balance_local = $this->begin_balance($supplier_id, $filter_from, $filter_status, @$supplier['balance_local']);

            if (count($purchase_invoices) > 0) {
                $detail .= '  <tr style="background: #DEE2FF; font-weight:bold;">
                                    <td colspan="11">BEGINING BALANCE</td>
                                    <td colspan="3"></td>
                                    <td style="text-align:right;">' . number_format(@$begin_balance_local, 2) . '</td>
                                </tr>';

                $invoice .= '    <tr style="background: #DEE2FF; font-weight:bold;">
                                    <td colspan="11">BEGINING BALANCE</td>
                                    <td colspan="3"></td>
                                    <td style="text-align:right;">' . number_format(@$begin_balance_local, 2) . '</td>
                                </tr>';
            }

            foreach ($purchase_invoices as $purchase_invoice) {
                $document_no = $purchase_invoice['document_no'];
                $payments = $this->db->query("SELECT a.*, b.number as voucher_no, b.trans_date as voucher_date, a.account_number, (CASE WHEN b.local_debit IS NULL THEN 0 ELSE a.payment END) AS local_debit, 0 AS local_credit
                    FROM ap_payments a
                    LEFT JOIN journal_postings b ON a.payment_no = b.document_no
                    WHERE a.purchase_invoice = '$document_no'
                    GROUP BY a.payment_no")->result_array();

                // if($purchase_invoice['source'] == "PI"){
                //     if (count($payments) == '0') {
                //         $status_purchase = "OPEN";
                //         $style_status_purchase = "background-color:#C8FFCC;";
                //     } else if (count($payments) > 0) {
                //         $status_purchase = "CLOSE";
                //         $style_status_purchase = "background-color:#FFC8C8;";
                //     } else {
                //         $status_purchase = "-";
                //         $style_status_purchase = "";
                //     }
                // }else{
                //     $status_purchase = "CLOSE";
                //     $style_status_purchase = "background-color:#FFC8C8;";
                // }

                if ($purchase_invoice['status'] == '0') {
                    $status_purchase = "OPEN";
                    $style_status_purchase = "background-color:#C8FFCC;";
                } else if ($purchase_invoice['status'] == '1') {
                    $status_purchase = "CLOSE";
                    $style_status_purchase = "background-color:#FFC8C8;";
                } else {
                    $status_purchase = "-";
                    $style_status_purchase = "";
                }
                
                
                $balance_local = ($purchase_invoice['local_credit'] - $purchase_invoice['local_debit']);
                if ($balance_local >= 0) {
                    $balance_local_output = number_format(@$balance_local, 2);
                } else {
                    $balance_local_output = "<span style='color:red;'>(" . number_format(abs($balance_local), 2) . ")</span>";
                }

                $detail .= '  <tr>
                                    <td rowspan='.(count($payments) + 1).'>' . $no . '</td>
                                    <td rowspan='.(count($payments) + 1).' style="text-align:center;' . $style_status_purchase . '">' . $status_purchase . '</td>
                                    <td>' . $purchase_invoice['source'] . '</td>
                                    <td>' . $purchase_invoice['trans_date'] . '</td>
                                    <td>' . $purchase_invoice['due_date'] . '</td>
                                    <td>' . $purchase_invoice['document_no'] . '</td>
                                    <td>' . $purchase_invoice['invoice_no'] . '</td>
                                    <td>' . $purchase_invoice['description'] . '</td>
                                    <td>' . $purchase_invoice['voucher_date'] . '</td>
                                    <td>' . $purchase_invoice['voucher_no'] . '</td>
                                    <td>' . $purchase_invoice['account_number'] . '</td>
                                    <td>INR</td>
                                    <td style="text-align:right;">' . number_format($purchase_invoice['local_debit'], 2) . '</td>
                                    <td style="text-align:right;">' . number_format($purchase_invoice['local_credit'], 2) . '</td>
                                    <td style="text-align:right;">' . $balance_local_output . '</td>
                                </tr>';

                $payment_total = 0;
                foreach ($payments as $payment) {
                    $balance_local += ($payment['local_credit'] - $payment['local_debit']);
                    if ($balance_local >= 0) {
                        $balance_local_output = number_format(@$balance_local, 2);
                    } else {
                        $balance_local_output = "<span style='color:red;'>(" . number_format(abs($balance_local), 2) . ")</span>";
                    }
                    $detail .= '  <tr>
                                    <td>AP</td>
                                    <td>' . $payment['payment_date'] . '</td>
                                    <td>-</td>
                                    <td>' . $payment['payment_no'] . '</td>
                                    <td>' . $payment['supplier_invoice'] . '</td>
                                    <td>' . $payment['purchase_invoice'] . ' | ' . $payment['payment_by'] . '</td>
                                    <td>' . $payment['voucher_date'] . '</td>
                                    <td>' . $payment['voucher_no'] . '</td>
                                    <td>' . $payment['account_number'] . '</td>
                                    <td>INR</td>
                                    <td style="text-align:right;">' . number_format($payment['local_debit'], 2) . '</td>
                                    <td style="text-align:right;">' . number_format($payment['local_credit'], 2) . '</td>
                                    <td style="text-align:right;">' . $balance_local_output . '</td>
                                </tr>';

                    $payment_total += $payment['local_debit'];
                    $local_debit += $payment['local_debit'];
                    $local_credit += $payment['local_credit'];
                }

                if($purchase_invoice['local_debit'] > 0){
                    $payment_total = $purchase_invoice['local_debit'];
                }

                if (($purchase_invoice['local_credit'] - $payment_total) >= 0) {
                    $balance_invoice = number_format(($purchase_invoice['local_credit'] - $payment_total), 2);
                } else {
                    $balance_invoice = "<span style='color:red;'>(" . number_format(abs(($purchase_invoice['local_credit'] - $payment_total)), 2) . ")</span>";
                }

                $invoice .= '  <tr>
                                <td>' . $no . '</td>
                                <td style="text-align:center;' . $style_status_purchase . '">' . $status_purchase . '</td>
                                <td>' . $purchase_invoice['source'] . '</td>
                                <td>' . $purchase_invoice['trans_date'] . '</td>
                                <td>' . $purchase_invoice['due_date'] . '</td>
                                <td>' . $purchase_invoice['document_no'] . '</td>
                                <td>' . $purchase_invoice['invoice_no'] . '</td>
                                <td>' . $purchase_invoice['description'] . '</td>
                                <td>' . $purchase_invoice['voucher_date'] . '</td>
                                <td>' . $purchase_invoice['voucher_no'] . '</td>
                                <td>' . $purchase_invoice['account_number'] . '</td>
                                <td>INR</td>
                                <td style="text-align:right;">' . number_format($purchase_invoice['local_credit'], 2) . '</td>
                                <td style="text-align:right;">' . number_format($payment_total, 2) . '</td>
                                <td style="text-align:right;">' . $balance_invoice . '</td>
                            </tr>';

                $no++;
                $local_debit += $purchase_invoice['local_debit'];
                $local_credit += $purchase_invoice['local_credit'];
            }

            if (($begin_balance_local + $local_credit - $local_debit) >= 0) {
                $balance_local = number_format(($begin_balance_local + $local_credit - $local_debit), 2);
            } else {
                $balance_local = "<span style='color:red;'>(" . number_format(abs(($begin_balance_local + $local_credit - $local_debit)), 2) . ")</span>";
            }

            if (count($purchase_invoices) > 0) {
                $detail .= '  <tr style="background: #E5E5E5; font-weight:bold;">
                                    <td colspan="11">SUB TOTAL</td>
                                    <td></td>
                                    <td style="text-align:right;">' . number_format($local_debit, 2) . '</td>
                                    <td style="text-align:right;">' . number_format($local_credit, 2) . '</td>
                                    <td style="text-align:right;">' . $balance_local . '</td>
                                </tr>
                                <tr>
                                    <td colspan="17" style="height:20px;"></td>
                                </tr>';

                $invoice .= '  <tr style="background: #E5E5E5; font-weight:bold;">
                                    <td colspan="11">SUB TOTAL</td>
                                    <td></td>
                                    <td style="text-align:right;">' . number_format($local_credit, 2) . '</td>
                                    <td style="text-align:right;">' . number_format($local_debit, 2) . '</td>
                                    <td style="text-align:right;">' . $balance_local . '</td>
                                </tr>
                                <tr>
                                    <td colspan="17" style="height:20px;"></td>
                                </tr>';
            }

            $summary .= '   <tr>
                                <td>' . $noid . '</td>
                                <td>' . $supplier['id'] . '</td>
                                <td>' . $supplier['name'] . '</td>
                                <td>' . $supplier['currency'] . '</td>
                                <td style="text-align:right;">' . $balance_local . '</td>
                            </tr>';
            $noid++;

            $grand_local_debit += $local_debit;
            $grand_local_credit += $local_credit;
            $grand_local_balance += ($begin_balance_local + $local_credit - $local_debit);
        }

        $detail .= '    <tr style="background: #C3FFB4; font-weight:bold;">
                            <td colspan="11">GRAND TOTAL</td>
                            <td></td>
                            <td style="text-align:right;">' . number_format($grand_local_debit, 2) . '</td>
                            <td style="text-align:right;">' . number_format($grand_local_credit, 2) . '</td>
                            <td style="text-align:right;">' . number_format($grand_local_balance, 2) . '</td>
                        </tr>';

        $invoice .= '   <tr style="background: #C3FFB4; font-weight:bold;">
                            <td colspan="11">GRAND TOTAL</td>
                            <td></td>
                            <td style="text-align:right;">' . number_format($grand_local_credit, 2) . '</td>
                            <td style="text-align:right;">' . number_format($grand_local_debit, 2) . '</td>
                            <td style="text-align:right;">' . number_format($grand_local_balance, 2) . '</td>
                        </tr>';

        $summary .= '   <tr style="font-weight:bold;">
                            <td colspan="4">GRAND TOTAL</td>
                            <td style="text-align:right;">' . number_format($grand_local_balance, 2) . '</td>
                        </tr>';

        $htmlend = '</table></body></html>';

        if ($filter_display == "Summary") {
            echo $html . $summary . $htmlend;
        }elseif ($filter_display == "Invoice") {
            echo $html . $invoice . $htmlend;
        } else {
            echo $html . $detail . $htmlend;
        }
    }
}
