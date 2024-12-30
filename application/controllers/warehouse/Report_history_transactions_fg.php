<?php
date_default_timezone_set("Asia/Bangkok");
defined('BASEPATH') or exit('No direct script access allowed');
class Report_history_transactions_fg extends CI_Controller
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
        $this->form_validation->set_rules('po_no', 'PO No', 'required|min_length[1]|max_length[50]');
    }

    public function index()
    {
        if (empty($this->session->username)) {
            redirect('error_session');
        } elseif ($this->checkuserAccess($this->id_menu()) > 0) {
            $data['button'] = $this->getbutton($this->id_menu());
            $this->load->view('template/header', $data);
            $this->load->view('warehouse/report_history_transactions_fg');
        } else {
            redirect('error_access');
        }
    }

    public function print($option = "")
    {
        if ($option == "excel") {
            $format  = date("Ymd");
            header("Content-type: application/vnd-ms-excel");
            header("Content-Disposition: attachment; filename=history_transactions_$format.xls");
        }
        $filter_from = $this->input->get('filter_from');
        $filter_to   = $this->input->get('filter_to');
        $filter_items = $this->input->get('filter_items');
        $filter_display = $this->input->get("filter_display");

        $start = strtotime($filter_from);
        $finish = strtotime($filter_to);

        //Config
        $this->db->select('*');
        $this->db->from('config');
        $config = $this->db->get()->row();
        
        $records = $this->crud->query("SELECT
            a.id,
            a.number,
            a.number_customer,
            a.name, 
            a.uom, 
            COALESCE(0,0) as begin_stock,
            (COALESCE(b.qty_sto, 0) + COALESCE(d.sto_qty_in,0) + COALESCE(c.qty_wip, 0) + COALESCE(e.qty_rgp_in, 0)) as qty_in,
            (g.qty + COALESCE(d.sto_qty_out, 0) + COALESCE(f.qty_rgp_out, 0)) as qty_out,
            (COALESCE((b.qty_sto + d.sto_qty_in + c.qty_wip),0) + COALESCE(e.qty_rgp_in, 0) - COALESCE(g.qty, 0) - COALESCE(d.sto_qty_out, 0) - COALESCE(f.qty_rgp_out, 0)) as end_stock
        FROM item_fg a 
        LEFT JOIN (select a.item_fg_id, COALESCE(SUM(b.qty), 0) as qty_sto FROM os_fg a JOIN scan_item_receipts_fg b ON a.id = b.workorder WHERE a.trans_date between '$filter_from' and '$filter_to' GROUP BY a.item_fg_id) b ON a.id = b.item_fg_id
        LEFT JOIN (SELECT a.item_fg_id, (CASE WHEN a.type = 'IN' THEN COALESCE(SUM(a.qty), 0) ELSE 0 END) as sto_qty_in, (CASE WHEN a.type = 'OUT' THEN COALESCE(SUM(a.qty), 0) ELSE 0 END) as sto_qty_out FROM sto_fg a WHERE a.trans_date between '$filter_from' and '$filter_to' and (a.approved_to = '' or a.approved_to is null) GROUP BY item_fg_id) d ON a.id = d.item_fg_id
        LEFT JOIN (select a.item_fg_id, COALESCE(SUM(b.qty), 0) as qty_wip FROM wip_receipts a JOIN scan_item_receipts_fg b ON a.workorder = b.workorder and a.checksheet_number = b.checksheet_number WHERE DATE_FORMAT(b.created_date, '%Y-%m-%d') between '$filter_from' and '$filter_to' GROUP BY a.item_fg_id) c ON a.id = c.item_fg_id
        LEFT JOIN (SELECT item_id, COALESCE(SUM(qty), 0) as qty_rgp_in FROM rgp_transactions WHERE type = 'IN' and transaction_date between '$filter_from' and '$filter_to' GROUP BY item_id) e ON a.id = e.item_id
        LEFT JOIN (SELECT item_id, COALESCE(SUM(qty), 0) as qty_rgp_out FROM rgp_transactions WHERE type = 'OUT' and transaction_date between '$filter_from' and '$filter_to' GROUP BY item_id) f ON a.id = f.item_id
        LEFT JOIN (SELECT item_fg_id, delivery_note_date, COALESCE(SUM(qty), 0) as qty FROM delivery_notes WHERE DATE_FORMAT(created_date, '%Y-%m-%d') between '$filter_from' and '$filter_to' GROUP BY item_fg_id) g ON a.id = g.item_fg_id
        WHERE a.id like '%$filter_items%'
        GROUP BY a.id
        ORDER BY a.number");
        
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
                            <small>'.$config->description.'</small>
                        </td>
                    </tr>
                </table>
            </div>
            <div style="float: right; font-size: 12px; text-align: right;">
                Print Date ' . date("d M Y H:i:s") . ' <br>
                Print By ' . $this->session->username . '  
            </div>
            <br><br><br>
            <h3 style="margin:0;">INVENTORY HISTORY TRANSACTION (FG)</h3>
            <small>PERIOD : <b>' . $filter_from . '</b> To <b>' . $filter_to . '</b></small>
        </center>
        <br>
            
            <table id="customers" border="1">
                <tr>
                    <th width="20">No</th>
                    <th colspan="2">Product No EBWS</th>
                    <th>Product No Customer</th>
                    <th>Product Name</th>
                    <th>Uom</th>
                    <th>Product Family</th>
                    <th width="100">Begin<br>Stock</th>
                    <th width="100">In</th>
                    <th width="100">Out</th>
                    <th width="100">Ending<br>Stock</th>
                </tr>';
        $no = 1;
        foreach ($records as $record) {
            $item_fg_id = $record->id;

            $endstock = $this->crud->query("SELECT
                a.id,
                (COALESCE(b.qty_sto, 0) + COALESCE(d.sto_qty_in, 0) + COALESCE(c.qty_wip, 0) + COALESCE(e.qty_rgp_in, 0) - COALESCE(g.qty, 0) - COALESCE(d.sto_qty_out, 0) - COALESCE(f.qty_rgp_out, 0)) as begin_stock
            FROM item_fg a 
            LEFT JOIN (select a.item_fg_id, COALESCE(SUM(b.qty), 0) as qty_sto FROM os_fg a JOIN scan_item_receipts_fg b ON a.id = b.workorder WHERE a.trans_date < '$filter_from' GROUP BY a.item_fg_id) b ON a.id = b.item_fg_id
            LEFT JOIN (select a.item_fg_id, COALESCE(SUM(b.qty), 0) as qty_wip FROM wip_receipts a JOIN scan_item_receipts_fg b ON a.workorder = b.workorder and a.checksheet_number = b.checksheet_number WHERE DATE_FORMAT(b.created_date, '%Y-%m-%d') < '$filter_from' GROUP BY a.item_fg_id) c ON a.id = c.item_fg_id
            LEFT JOIN (SELECT a.item_fg_id, (CASE WHEN a.type = 'IN' THEN COALESCE(SUM(a.qty), 0) ELSE 0 END) as sto_qty_in, (CASE WHEN a.type = 'OUT' THEN COALESCE(SUM(a.qty), 0) ELSE 0 END) as sto_qty_out FROM sto_fg a WHERE a.trans_date < '$filter_from' and (a.approved_to = '' or a.approved_to is null) GROUP BY item_fg_id) d ON a.id = d.item_fg_id
            LEFT JOIN (SELECT item_id, COALESCE(SUM(qty), 0) as qty_rgp_in FROM rgp_transactions WHERE type = 'IN' and transaction_date < '$filter_from' GROUP BY item_id) e ON a.id = e.item_id
            LEFT JOIN (SELECT item_id, COALESCE(SUM(qty), 0) as qty_rgp_out FROM rgp_transactions WHERE type = 'OUT' and transaction_date < '$filter_from' GROUP BY item_id) f ON a.id = f.item_id
            LEFT JOIN (SELECT item_fg_id, delivery_note_date, COALESCE(SUM(qty), 0) as qty FROM delivery_notes WHERE DATE_FORMAT(created_date, '%Y-%m-%d') < '$filter_from' GROUP BY item_fg_id) g ON a.id = g.item_fg_id
            WHERE a.id = '$item_fg_id'
            GROUP BY a.id
            ORDER BY a.number");

            $html .= '  <tr>
                            <td style="text-align:center">' . $no . '</td>
                            <td colspan="2">' . $record->number . '</td>
                            <td style="mso-number-format:\@;">' . $record->number_customer . '</td>
                            <td>' . $record->name . '</td>
                            <td>' . $record->uom . '</td>
                            <td>FINISH GOOD</td>
                            <td style="text-align:right;">' . number_format(@$endstock[0]->begin_stock, 2) . '</td>
                            <td style="text-align:right;">' . number_format($record->qty_in, 2) . '</td>
                            <td style="text-align:right;">' . number_format($record->qty_out, 2) . '</td>
                            <td style="text-align:right;">' . number_format((@$endstock[0]->begin_stock + $record->qty_in - $record->qty_out), 2) . '</td>
                        </tr>';

            if ($filter_display == "DETAIL") {
                $html .= '  <tr>
                                <td colspan="11" style="background:#D1FFC6;"><b>DETAIL OF ' . $record->number . ' - ' . $record->name . '</b></td>
                            </tr>';
                $html .= '  <tr>
                                <th width="20"></th>
                                <th width="20">No</th>
                                <th>Trans Type</th>
                                <th>Created By</th>
                                <th>Trans Date</th>
                                <th>WO / DO</th>
                                <th>Doc. No</th>
                                <th>Begin</th>
                                <th>In</th>
                                <th>Out</th>
                                <th>Balance</th>
                            </tr>';
                $nod = 1;
                $begin = @$endstock[0]->begin_stock;
                $in_qty = 0;
                $end_qty = 0;
                $balance = @$endstock[0]->begin_stock;

                for ($i = $start; $i <= $finish; $i += (60 * 60 * 24)) {
                    $working_date = date('Y-m-d', $i);

                    //BEGIN STOCK
                    $os_rms = $this->crud->query("SELECT
                        a.*,
                        SUM(b.qty) as qty,
                        c.name as username
                    FROM os_fg a 
                    JOIN scan_item_receipts_fg b ON a.id = b.workorder
                    JOIN users c ON a.created_by = c.username
                    WHERE a.item_fg_id = '$item_fg_id' and a.trans_date = '$working_date'
                    GROUP BY a.id");

                    //STO
                    $sto_rms = $this->crud->query("SELECT
                        a.*,
                        c.name as username
                    FROM sto_fg a 
                    JOIN users c ON a.created_by = c.username
                    WHERE a.item_fg_id = '$item_fg_id' and a.trans_date = '$working_date'
                    GROUP BY a.id");

                    //RECEIPT
                    $receipts = $this->crud->query("SELECT f.*, c.name as username
                        FROM wip_receipts e
                        JOIN scan_item_receipts_fg f ON e.checksheet_number = f.checksheet_number and e.workorder = f.workorder
                        LEFT JOIN users c ON e.created_by = c.username
                        WHERE e.item_fg_id = '$item_fg_id' 
                        and DATE_FORMAT(f.created_date, '%Y-%m-%d') = '$working_date'");

                    //DELIVERY
                    $returns = $this->crud->query("SELECT a.*, d.name as username
                        FROM delivery_notes a 
                        JOIN users d ON a.created_by = d.username
                        WHERE a.item_fg_id = '$item_fg_id' and DATE_FORMAT(a.created_date, '%Y-%m-%d') = '$working_date'");

                    //RGP TRANSACTION
                    $rgps = $this->crud->query("SELECT a.*, b.name as company_name FROM rgp_transactions a JOIN suppliers b ON a.company_id = b.id WHERE a.item_id = '$item_fg_id' and a.transaction_date = '$working_date'");

                    //BEGIN STOCK
                    foreach ($os_rms as $os_rm) {
                        $balance = ($begin + $os_rm->qty);
                        $html .= '  <tr>
                                        <td></td>
                                        <td style="text-align:center">' . $nod . '</td>
                                        <td>STO</td>
                                        <td>' . $os_rm->username . '</td>
                                        <td>' . $os_rm->trans_date . '</td>
                                        <td>' . $os_rm->document_no . '</td>
                                        <td>' . $os_rm->id . '</td>
                                        <td style="text-align:right;">' . number_format($begin, 2) . '</td>
                                        <td style="text-align:right;">' . number_format($os_rm->qty) . '</td>
                                        <td style="text-align:right;">' . number_format(0)  . '</td>
                                        <td style="text-align:right;">' . number_format($balance, 2)  . '</td>
                                    </tr>';
                        $begin += $os_rm->qty;
                        $nod++;
                    }

                    //STO
                    foreach ($sto_rms as $sto_rm) {
                        if($sto_rm->type == "IN"){
                            $type = "STO ADJUSTMENT IN";
                            $qty_in = $sto_rm->qty;
                            $qty_out = 0;
                            $balance = ($begin + $sto_rm->qty);
                        }else{
                            $type = "STO ADJUSTMENT OUT";
                            $qty_in = 0;
                            $qty_out = $sto_rm->qty;
                            $balance = ($begin - $sto_rm->qty);
                        }

                        $html .= '  <tr>
                                        <td></td>
                                        <td style="text-align:center">' . $nod . '</td>
                                        <td>' . $type . '</td>
                                        <td>' . $sto_rm->username . '</td>
                                        <td>' . $sto_rm->trans_date . '</td>
                                        <td>-</td>
                                        <td>' . $sto_rm->document_no . '</td>
                                        <td style="text-align:right;">' . number_format($begin, 2) . '</td>
                                        <td style="text-align:right;">' . number_format($qty_in, 2) . '</td>
                                        <td style="text-align:right;">' . number_format($qty_out)  . '</td>
                                        <td style="text-align:right;">' . number_format($balance, 2)  . '</td>
                                    </tr>';
                        if($sto_rm->type == "IN"){
                            $begin += $sto_rm->qty;
                        }else{
                            $begin -= $sto_rm->qty;
                        }

                        $nod++;
                    }

                    //Wip Receipt
                    foreach ($receipts as $receipt) {
                        $balance = ($begin + ($receipt->qty - $end_qty));
                        $html .= '  <tr>
                                                <td></td>
                                                <td style="text-align:center">' . $nod . '</td>
                                                <td>RECEIPT FG</td>
                                                <td>' . $receipt->username . '</td>
                                                <td>' . $receipt->created_date . '</td>
                                                <td>' . $receipt->workorder . '</td>
                                                <td>' . $receipt->checksheet_label . '</td>
                                                <td style="text-align:right;">' . number_format($begin, 2) . '</td>
                                                <td style="text-align:right;">' . number_format($receipt->qty, 2) . '</td>
                                                <td style="text-align:right;">' . number_format(0)  . '</td>
                                                <td style="text-align:right;">' . number_format($balance, 2)  . '</td>
                                            </tr>';
                        $begin += $receipt->qty;
                        $nod++;
                    }

                    //Delivery Note
                    foreach ($returns as $return) {
                        $balance = ($begin - $return->qty);
                        $html .= '  <tr>
                                                <td></td>
                                                <td style="text-align:center">' . $nod . '</td>
                                                <td>DELIVERY NOTE</td>
                                                <td>' . $return->username . '</td>
                                                <td>' . $return->created_date . '</td>
                                                <td>' . $return->delivery_order_no  . '</td>
                                                <td>' . $return->delivery_note_no . '</td>
                                                <td style="text-align:right;">' . number_format($begin, 2) . '</td>
                                                <td style="text-align:right;">' . number_format(0) . '</td>
                                                <td style="text-align:right;">' . number_format($return->qty, 2)  . '</td>
                                                <td style="text-align:right;">' . number_format($balance, 2)  . '</td>
                                            </tr>';
                        $begin -= $return->qty;
                        $nod++;
                    }

                    //RGP
                    foreach ($rgps as $rgp) {
                        $user = $this->crud->read("users", [], ["username" => $rgp->created_by]);
                        if($rgp->type == "IN"){
                            $balance = ($begin + $rgp->qty);
                            $rgp_status = "RGP IN";
                            $rgp_qty_in = $rgp->qty;
                            $rgp_qty_out = 0;
                        }else{
                            $rgp_status = "RGP OUT";
                            $balance = ($begin - $rgp->qty);
                            $rgp_qty_in = 0;
                            $rgp_qty_out = $rgp->qty;
                        }

                        $html .= '  <tr>
                                        <td></td>
                                        <td style="text-align:center">' . $nod . '</td>
                                        <td>' . $rgp_status . '</td>
                                        <td>' . $user->name . '</td>
                                        <td>' . $rgp->transaction_date . '</td>
                                        <td>' . $rgp->company_id . '</td>
                                        <td>' . $rgp->company_name . '</td>
                                        <td>' . $rgp->reference_number . '</td>
                                        <td>' . $rgp->rgp_number . '</td>
                                        <td style="text-align:right;">' . number_format($begin, 2) . '</td>
                                        <td style="text-align:right;">' . number_format($rgp_qty_in) . '</td>
                                        <td style="text-align:right;">' . number_format($rgp_qty_out, 2)  . '</td>
                                        <td style="text-align:right;">' . number_format($balance, 2)  . '</td>
                                    </tr>';
                        
                        if($rgp->type == "IN"){
                            $begin += $rgp_qty_in;
                        }else{
                            $begin -= $rgp_qty_out;
                        }

                        $nod++;
                    }
                }
            }
            $no++;
        }
        $html .= '</table></body></html>';
        echo $html;
    }
}
