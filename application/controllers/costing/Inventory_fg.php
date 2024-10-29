<?php
date_default_timezone_set("Asia/Bangkok");
defined('BASEPATH') or exit('No direct script access allowed');
class Inventory_fg extends CI_Controller
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
            $this->load->view('costing/inventory_fg');
        } else {
            redirect('error_access');
        }
    }

    public function readItemFamily($number = "")
    {
        $this->db->select('*');
        $this->db->from('item_familys');
        $this->db->where('deleted', 0);
        if ($number != "001") {
            $this->db->where("number", $number);
        } else {
            $this->db->where("number !=", $number);
        }
        $this->db->order_by('name', 'ASC');
        $records = $this->db->get()->result_array();
        echo json_encode($records);
    }

    public function print($option = "")
    {
        if ($option == "excel") {
            $format  = date("Ymd");
            header("Content-type: application/vnd-ms-excel");
            header("Content-Disposition: attachment; filename=stock_values_$format.xls");
        }

        $filter_from = $this->input->get('filter_from');
        $filter_to   = $this->input->get('filter_to');
        $filter_items = $this->input->get('filter_items');
        $filter_display = $this->input->get("filter_display");

        $start = strtotime($filter_from);
        $finish = strtotime($filter_to);

        $periode = date("Y-m", strtotime($filter_from));

        //Config
        $this->db->select('*');
        $this->db->from('config');
        $config = $this->db->get()->row();

        $html = '<html><head><title>Print Data</title></head><style>body {font-family: Arial, Helvetica, sans-serif;}#customers {border-collapse: collapse;font-size: 12px;}#customers td, #customers th {border: 1px solid #ddd;padding: 2px;}#customers tr:nth-child(even){background-color: #f2f2f2;}#customers tr:hover {background-color: #ddd;}#customers th {padding-top: 2px;padding-bottom: 2px;text-align: center;color: black;}</style><body>
            <center>
                <div style="float: left; font-size: 12px; text-align: left;">
                    <table style="width: 100%;">
                        <tr>
                            <td width="50" style="font-size: 12px; vertical-align: top; text-align: center; vertical-align:jus margin-right:10px;">
                                <img src="' . $config->favicon . '" width="30">
                            </td>
                            <td style="font-size: 14px; text-align: left; margin:2px;">
                                <b>' . $config->name . '</b><br>
                                <small>REPORT INVENTORY HISTORY TRANSACTION FINISH GOOD</small><br>
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
            <br><br><br><br>';

        $records = $this->crud->query("SELECT
            a.id,
            a.number, 
            a.name, 
            b.name as prodfam, 
            c.name as uom,
            d.workorder,
            d.trans_date,
            f.checksheet_number,
            COALESCE(0,0) as begin_stock,
            COALESCE(SUM(f.qty),0) as qty_in,
            g.qty as qty_out,
            (COALESCE(SUM(f.qty),0) - COALESCE(g.qty, 0)) as end_stock
        FROM items a 
        JOIN item_familys b ON a.item_family_id = b.id
        JOIN uom c ON a.uom_id = c.id
        LEFT JOIN production_schedules d ON a.id = d.item_id
        LEFT JOIN checksheets e ON d.workorder = e.workorder
        LEFT JOIN scan_item_receipts_fg f ON e.number = f.checksheet_number and DATE_FORMAT(f.created_date, '%Y-%m-%d') between '$filter_from' and '$filter_to'
        LEFT JOIN (SELECT item_id, trans_date, COALESCE(SUM(qty), 0) as qty FROM delivery_notes WHERE trans_date between '$filter_from' and '$filter_to' GROUP BY item_id) g ON a.id = g.item_id
        WHERE a.id like '%$filter_items%' and b.number = '001'
        GROUP BY a.id
        ORDER BY a.number");

        $html .= '<table id="customers" style="width: 150%">
                    <tr>
                        <th rowspan="2" width="20">No</th>
                        <th colspan="2" rowspan="2">Product No</th>
                        <th colspan="3" rowspan="2">Product Name</th>
                        <th rowspan="2">Uom</th>
                        <th style="background-color:#CACACA;" colspan="3">Begining Stock</th>
                        <th style="background-color:#B0FFA0;" colspan="3">In</th>
                        <th style="background-color:#FFA0A0;" colspan="3">Out</th>
                        <th style="background-color:#FCFFA0;" colspan="3">Ending Stock</th>
                    </tr>
                    <tr>
                        <th style="background-color:#CACACA;">Qty</th>
                        <th style="background-color:#CACACA;">Price</th>
                        <th style="background-color:#CACACA;">Amount</th>
                        <th style="background-color:#B0FFA0;">Qty</th>
                        <th style="background-color:#B0FFA0;">Price</th>
                        <th style="background-color:#B0FFA0;">Amount</th>
                        <th style="background-color:#FFA0A0;">Qty</th>
                        <th style="background-color:#FFA0A0;">Price</th>
                        <th style="background-color:#FFA0A0;">Amount</th>
                        <th style="background-color:#FCFFA0;">Qty</th>
                        <th style="background-color:#FCFFA0;">Price</th>
                        <th style="background-color:#FCFFA0;">Amount</th>
                    </tr>';

        $noh = 1;
        foreach ($records as $record) {
            $item_id = $record->id;

            $endstock = $this->crud->query("SELECT
                a.id,
                (COALESCE(SUM(f.qty),0) - COALESCE(g.qty, 0)) as begin_stock
            FROM items a 
            JOIN item_familys b ON a.item_family_id = b.id
            JOIN uom c ON a.uom_id = c.id
            LEFT JOIN production_schedules d ON a.id = d.item_id
            LEFT JOIN checksheets e ON d.workorder = e.workorder
            LEFT JOIN scan_item_receipts_fg f ON e.number = f.checksheet_number and DATE_FORMAT(f.created_date, '%Y-%m-%d') < '$filter_from'
            LEFT JOIN (SELECT item_id, trans_date, COALESCE(SUM(qty), 0) as qty FROM delivery_notes WHERE trans_date < '$filter_from' GROUP BY item_id) g ON a.id = g.item_id
            WHERE a.id = '$item_id'
            GROUP BY a.id
            ORDER BY a.number");

            $costing_product = $this->crud->query("SELECT direct_total as price FROM costing_products WHERE item_id = '$item_id' and periode <= '$periode' and direct_total > 0 ORDER BY periode DESC LIMIT 1");

            if(@$endstock[0]->begin_stock > 0){
                $price_begin = @$costing_product[0]->price;
            }else{
                $price_begin = 0;
            }

            if($record->qty_in > 0){
                $price_in = @$costing_product[0]->price;
            }else{
                $price_in = 0;
            }

            if($record->qty_out > 0){
                $price_out = @$costing_product[0]->price;
            }else{
                $price_out = 0;
            }

            if((@$endstock[0]->begin_stock + $record->qty_in - $record->qty_out) > 0){
                $price_bal = @$costing_product[0]->price;
            }else{
                $price_bal = 0;
            }

            $html .= '  <tr>
                            <td style="text-align:center">' . $noh . '</td>
                            <td colspan="2">' . $record->number . '</td>
                            <td colspan="3">' . $record->name . '</td>
                            <td>' . $record->uom . '</td>
                            <td style="text-align:right;">' . number_format(@$endstock[0]->begin_stock, 2) . '</td>
                            <td style="text-align:right;">' . number_format($price_begin, 2) . '</td>
                            <td style="text-align:right;">' . number_format((@$endstock[0]->begin_stock * $price_begin), 2) . '</td>
                            <td style="text-align:right;">' . number_format($record->qty_in, 2) . '</td>
                            <td style="text-align:right;">' . number_format($price_in, 2) . '</td>
                            <td style="text-align:right;">' . number_format(($record->qty_in * $price_in), 2) . '</td>
                            <td style="text-align:right;">' . number_format($record->qty_out, 2) . '</td>
                            <td style="text-align:right;">' . number_format($price_out, 2) . '</td>
                            <td style="text-align:right;">' . number_format(($record->qty_out * $price_out), 2) . '</td>
                            <td style="text-align:right;">' . number_format((@$endstock[0]->begin_stock + $record->qty_in - $record->qty_out), 2) . '</td>
                            <td style="text-align:right;">' . number_format($price_bal, 2) . '</td>
                            <td style="text-align:right;">' . number_format(((@$endstock[0]->begin_stock + $record->qty_in - $record->qty_out) * $price_bal), 2) . '</td>
                        </tr>';

            if ($filter_display == "DETAIL") {
                $html .= '  <tr>
                                <td colspan="19" style="background:#D1FFC6;"><b>DETAIL OF ' . $record->number . ' - ' . $record->name . '</b></td>
                            </tr>';
                $html .= '  <tr>
                                <th rowspan="2" width="20"></th>
                                <th rowspan="2">No</th>
                                <th rowspan="2">Trans Type</th>
                                <th rowspan="2">Trans Date</th>
                                <th rowspan="2">Created By</th>
                                <th rowspan="2">WO / DO</th>
                                <th rowspan="2">Doc No</th>
                                <th style="background-color:#CACACA;" colspan="3">Begining Stock</th>
                                <th style="background-color:#B0FFA0;" colspan="3">In</th>
                                <th style="background-color:#FFA0A0;" colspan="3">Out</th>
                                <th style="background-color:#FCFFA0;" colspan="3">Ending Stock</th>
                            </tr>
                            <tr>
                                <th style="background-color:#CACACA;">Qty</th>
                                <th style="background-color:#CACACA;">Price</th>
                                <th style="background-color:#CACACA;">Amount</th>
                                <th style="background-color:#B0FFA0;">Qty</th>
                                <th style="background-color:#B0FFA0;">Price</th>
                                <th style="background-color:#B0FFA0;">Amount</th>
                                <th style="background-color:#FFA0A0;">Qty</th>
                                <th style="background-color:#FFA0A0;">Price</th>
                                <th style="background-color:#FFA0A0;">Amount</th>
                                <th style="background-color:#FCFFA0;">Qty</th>
                                <th style="background-color:#FCFFA0;">Price</th>
                                <th style="background-color:#FCFFA0;">Amount</th>
                            </tr>';
                $nod = 1;
                $begin = @$endstock[0]->begin_stock;
                $end_qty = 0;
                $balance = 0;

                for ($i = $start; $i <= $finish; $i += (60 * 60 * 24)) {
                    $working_date = date('Y-m-d', $i);

                    //RECEIPT
                    $receipts = $this->crud->query("SELECT f.*, c.name as username, h.direct_total as price
                                    FROM production_schedules d
                                    JOIN checksheets e ON d.workorder = e.workorder
                                    JOIN scan_item_receipts_fg f ON e.number = f.checksheet_number
                                    JOIN users c ON f.created_by = c.username
                                    LEFT JOIN costing_products h ON d.item_id = h.item_id and h.periode = '$periode'
                                    WHERE d.item_id = '$item_id' 
                                    and DATE_FORMAT(f.created_date, '%Y-%m-%d') between '$working_date' and '$working_date'");

                    //DELIVERY
                    $returns = $this->crud->query("SELECT a.*, h.direct_total as price, d.name as username
                                    FROM delivery_notes a 
                                    JOIN users d ON a.created_by = d.username
                                    LEFT JOIN costing_products h ON a.item_id = h.item_id and h.periode = '$periode'
                                    WHERE a.item_id = '$item_id' and a.trans_date between '$working_date' and '$working_date'");

                    //Wip Receipt
                    foreach ($receipts as $receipt) {
                        $balance = ($begin + ($receipt->qty - $end_qty));

                        $periode = date("Y-m", strtotime($receipt->created_date));

                        $costing_product = $this->crud->query("SELECT direct_total as price FROM costing_products WHERE item_id = '$item_id' and periode <= '$periode' and direct_total > 0 ORDER BY periode DESC LIMIT 1");
                        $price_rec = @$costing_product[0]->price;

                        if($balance > 0){
                            $price_rec_bal = $price_rec;
                        }else{
                            $price_rec_bal = 0;
                        }

                        $html .= '  <tr>
                                        <td></td>
                                        <td style="text-align:center">' . $nod . '</td>
                                        <td>RECEIPT FG</td>
                                        <td>' . $receipt->created_date . '</td>
                                        <td>' . $receipt->username . '</td>
                                        <td>' . $receipt->workorder . '</td>
                                        <td>' . $receipt->checksheet_label . '</td>
                                        <td style="text-align:right; background-color:#CACACA;">' . number_format($begin, 2) . '</td>
                                        <td style="text-align:right; background-color:#CACACA;">' . number_format($price_begin, 2) . '</td>
                                        <td style="text-align:right; background-color:#CACACA;">' . number_format(($begin * $price_begin), 2) . '</td>
                                        <td style="text-align:right; background-color:#B0FFA0;">' . number_format($receipt->qty, 2) . '</td>
                                        <td style="text-align:right; background-color:#B0FFA0;">' . number_format($price_rec, 2) . '</td>
                                        <td style="text-align:right; background-color:#B0FFA0;">' . number_format(($receipt->qty * $price_rec), 2) . '</td>
                                        <td style="text-align:right; background-color:#FFA0A0;">' . number_format(0)  . '</td>
                                        <td style="text-align:right; background-color:#FFA0A0;">' . number_format(0)  . '</td>
                                        <td style="text-align:right; background-color:#FFA0A0;">' . number_format(0)  . '</td>
                                        <td style="text-align:right; background-color:#FCFFA0;">' . number_format($balance, 2)  . '</td>
                                        <td style="text-align:right; background-color:#FCFFA0;">' . number_format($price_rec_bal, 2)  . '</td>
                                        <td style="text-align:right; background-color:#FCFFA0;">' . number_format(($balance * $price_rec_bal), 2)  . '</td>
                                    </tr>';
                        $begin += $receipt->qty;
                        $nod++;
                    }

                    //Delivery Note
                    foreach ($returns as $return) {
                        $balance = ($begin - $return->qty);
                        $periode = date("Y-m", strtotime($return->trans_date));

                        $costing_product = $this->crud->query("SELECT direct_total as price FROM costing_products WHERE item_id = '$item_id' and periode <= '$periode' and direct_total > 0 ORDER BY periode DESC LIMIT 1");
                        $price_del = @$costing_product[0]->price;

                        if($balance > 0){
                            $price_del_bal = $price_del;
                        }else{
                            $price_del_bal = 0;
                        }

                        $html .= '  <tr>
                                        <td></td>
                                        <td style="text-align:center">' . $nod . '</td>
                                        <td>DELIVERY NOTE</td>
                                        <td>' . $return->trans_date . '</td>
                                        <td>' . $return->username . '</td>
                                        <td>' . $return->do_number . '</td>
                                        <td>' . $return->number . '</td>
                                        <td style="text-align:right; background-color:#CACACA;">' . number_format($begin, 2) . '</td>
                                        <td style="text-align:right; background-color:#CACACA;">' . number_format($price_begin, 2) . '</td>
                                        <td style="text-align:right; background-color:#CACACA;">' . number_format(($begin * $price_begin), 2) . '</td>
                                        <td style="text-align:right; background-color:#B0FFA0;">' . number_format(0) . '</td>
                                        <td style="text-align:right; background-color:#B0FFA0;">' . number_format(0) . '</td>
                                        <td style="text-align:right; background-color:#B0FFA0;">' . number_format(0) . '</td>
                                        <td style="text-align:right; background-color:#FFA0A0;">' . number_format($return->qty, 2)  . '</td>
                                        <td style="text-align:right; background-color:#FFA0A0;">' . number_format($price_del, 2)  . '</td>
                                        <td style="text-align:right; background-color:#FFA0A0;">' . number_format(($return->qty * $price_del), 2)  . '</td>
                                        <td style="text-align:right; background-color:#FCFFA0;">' . number_format($balance, 2)  . '</td>
                                        <td style="text-align:right; background-color:#FCFFA0;">' . number_format($price_del_bal, 2)  . '</td>
                                        <td style="text-align:right; background-color:#FCFFA0;">' . number_format(($balance * $price_del_bal), 2)  . '</td>
                                    </tr>';
                        $begin -= $return->qty;
                        $nod++;
                    }
                }
            }

            $noh++;
        }

        $html .= '</table></body></html>';
        echo $html;
    }
}
