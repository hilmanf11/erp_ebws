<?php
date_default_timezone_set("Asia/Bangkok");
defined('BASEPATH') or exit('No direct script access allowed');
class Inventory_wip extends CI_Controller
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
            $this->load->view('costing/inventory_wip');
        } else {
            redirect('error_access');
        }
    }

    public function print($option = "")
    {
        if ($option == "excel") {
            $format  = date("Ymd");
            header("Content-type: application/vnd-ms-excel");
            header("Content-Disposition: attachment; filename=inventory_wip_$format.xls");
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
                                <small>REPORT INVENTORY HISTORY TRANSACTION WIP</small><br>
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
            c.name as uom,
            h.direct_total as price,
            COALESCE(0,0) as begin_stock,
            COALESCE(d.qty_in,0) as qty_in,
            COALESCE(e.qty_out,0) as qty_out,
            (COALESCE(d.qty_in,0) - COALESCE(e.qty_out,0)) as end_stock
        FROM items a 
        JOIN item_familys b ON a.item_family_id = b.id
        JOIN uom c ON a.uom_id = c.id
        LEFT JOIN (SELECT a.item_id, SUM(a.qty) as qty_in FROM production_schedules a 
                    WHERE a.trans_date BETWEEN '$filter_from' and '$filter_to' 
                    GROUP BY a.item_id) d ON a.id = d.item_id
        LEFT JOIN (SELECT SUM(b.qty) as qty_out, a.item_id
                    FROM production_schedules a 
                    LEFT JOIN checksheets e ON a.workorder = e.workorder
                    LEFT JOIN scan_item_receipts_fg b ON e.number = b.checksheet_number and a.so_number = b.so_number and a.workorder = b.workorder
                    WHERE DATE_FORMAT(b.created_date, '%Y-%m-%d') BETWEEN '$filter_from' and '$filter_to'
                    GROUP BY a.item_id) e ON a.id = e.item_id
        LEFT JOIN costing_products h ON a.id = h.item_id and h.periode = '$periode' 
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
                h.direct_total as price,
                d.qty_in as begin_stock
            FROM items a 
            JOIN item_familys b ON a.item_family_id = b.id
            JOIN uom c ON a.uom_id = c.id
            JOIN (SELECT a.item_id, SUM(a.qty) as qty_in FROM production_schedules a 
                        WHERE a.trans_date <= '$filter_from' and a.status = 0 
                        GROUP BY a.item_id) d ON a.id = d.item_id
            JOIN (SELECT SUM(b.qty) as qty_out, a.item_id
                        FROM production_schedules a 
                        LEFT JOIN checksheets e ON a.workorder = e.workorder
                        LEFT JOIN scan_item_receipts_fg b ON e.number = b.checksheet_number and a.so_number = b.so_number and a.workorder = b.workorder
                        WHERE DATE_FORMAT(b.created_date, '%Y-%m-%d') BETWEEN '$filter_from' and '$filter_to'
                        GROUP BY a.item_id) e ON a.id = e.item_id
            LEFT JOIN costing_products h ON a.id = h.item_id and h.periode = '$periode'
            WHERE a.id = '$item_id'
            GROUP BY a.id
            ORDER BY a.number");

            $html .= '  <tr>
                            <td style="text-align:center">' . $noh . '</td>
                            <td colspan="2">' . $record->number . '</td>
                            <td colspan="3">' . $record->name . '</td>
                            <td>' . $record->uom . '</td>
                            <td style="text-align:right;">' . number_format(@$endstock[0]->begin_stock, 2) . '</td>
                            <td style="text-align:right;">' . number_format(@$endstock[0]->price, 2) . '</td>
                            <td style="text-align:right;">' . number_format((@$endstock[0]->begin_stock * @$endstock[0]->price), 2) . '</td>
                            <td style="text-align:right;">' . number_format($record->qty_in, 2) . '</td>
                            <td style="text-align:right;">' . number_format($record->price, 2) . '</td>
                            <td style="text-align:right;">' . number_format(($record->qty_in * $record->price), 2) . '</td>
                            <td style="text-align:right;">' . number_format($record->qty_out, 2) . '</td>
                            <td style="text-align:right;">' . number_format($record->price, 2) . '</td>
                            <td style="text-align:right;">' . number_format(($record->qty_out * $record->price), 2) . '</td>
                            <td style="text-align:right;">' . number_format((@$endstock[0]->begin_stock + $record->qty_in - $record->qty_out), 2) . '</td>
                            <td style="text-align:right;">' . number_format($record->price, 2) . '</td>
                            <td style="text-align:right;">' . number_format(((@$endstock[0]->begin_stock + $record->qty_in - $record->qty_out) * $record->price), 2) . '</td>
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
                                <th rowspan="2">Workorder</th>
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
                    $receipts = $this->crud->query("SELECT a.*, b.direct_total as price
                                    FROM production_schedules a
                                    LEFT JOIN costing_products b ON a.item_id = b.item_id and b.periode = '$periode'
                                    WHERE a.item_id = '$item_id' 
                                    and a.trans_date = '$working_date'");

                    //DELIVERY
                    $returns = $this->crud->query("SELECT b.qty, b.workorder, b.created_by, DATE_FORMAT(b.created_date, '%Y-%m-%d') as trans_date, b.checksheet_label, c.direct_total as price
                                    FROM production_schedules a 
                                    LEFT JOIN checksheets e ON a.workorder = e.workorder
                                    LEFT JOIN scan_item_receipts_fg b ON e.number = b.checksheet_number and a.so_number = b.so_number and a.workorder = b.workorder
                                    LEFT JOIN costing_products c ON a.item_id = c.item_id and c.periode = '$periode'
                                    WHERE a.item_id = '$item_id' and DATE_FORMAT(b.created_date, '%Y-%m-%d') = '$working_date'
                                    GROUP BY b.checksheet_label");

                    //Wip Receipt
                    foreach ($receipts as $receipt) {
                        $balance = ($begin + ($receipt->qty - $end_qty));
                        $html .= '  <tr>
                                        <td></td>
                                        <td style="text-align:center">' . $nod . '</td>
                                        <td>PRODUCTION</td>
                                        <td>' . $receipt->trans_date . '</td>
                                        <td>' . $receipt->created_by . '</td>
                                        <td>' . $receipt->workorder . '</td>
                                        <td>' . $receipt->so_number . '</td>
                                        <td style="text-align:right; background-color:#CACACA;">' . number_format($begin, 2) . '</td>
                                        <td style="text-align:right; background-color:#CACACA;">' . number_format($record->price, 2) . '</td>
                                        <td style="text-align:right; background-color:#CACACA;">' . number_format(($begin * $record->price), 2) . '</td>
                                        <td style="text-align:right; background-color:#B0FFA0;">' . number_format($receipt->qty, 2) . '</td>
                                        <td style="text-align:right; background-color:#B0FFA0;">' . number_format($receipt->price, 2) . '</td>
                                        <td style="text-align:right; background-color:#B0FFA0;">' . number_format(($receipt->qty * $receipt->price), 2) . '</td>
                                        <td style="text-align:right; background-color:#FFA0A0;">' . number_format(0)  . '</td>
                                        <td style="text-align:right; background-color:#FFA0A0;">' . number_format(0)  . '</td>
                                        <td style="text-align:right; background-color:#FFA0A0;">' . number_format(0)  . '</td>
                                        <td style="text-align:right; background-color:#FCFFA0;">' . number_format($balance, 2)  . '</td>
                                        <td style="text-align:right; background-color:#FCFFA0;">' . number_format($record->price, 2)  . '</td>
                                        <td style="text-align:right; background-color:#FCFFA0;">' . number_format(($balance * $record->price), 2)  . '</td>
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
                                        <td>SCAN FG</td>
                                        <td>' . $return->trans_date . '</td>
                                        <td>' . $return->created_by . '</td>
                                        <td>' . $return->workorder . '</td>
                                        <td>' . $return->checksheet_label . '</td>
                                        <td style="text-align:right; background-color:#CACACA;">' . number_format($begin, 2) . '</td>
                                        <td style="text-align:right; background-color:#CACACA;">' . number_format($record->price, 2) . '</td>
                                        <td style="text-align:right; background-color:#CACACA;">' . number_format(($begin * $record->price), 2) . '</td>
                                        <td style="text-align:right; background-color:#B0FFA0;">' . number_format(0) . '</td>
                                        <td style="text-align:right; background-color:#B0FFA0;">' . number_format(0) . '</td>
                                        <td style="text-align:right; background-color:#B0FFA0;">' . number_format(0) . '</td>
                                        <td style="text-align:right; background-color:#FFA0A0;">' . number_format($return->qty, 2)  . '</td>
                                        <td style="text-align:right; background-color:#FFA0A0;">' . number_format($return->price, 2)  . '</td>
                                        <td style="text-align:right; background-color:#FFA0A0;">' . number_format(($return->qty * $return->price), 2)  . '</td>
                                        <td style="text-align:right; background-color:#FCFFA0;">' . number_format($balance, 2)  . '</td>
                                        <td style="text-align:right; background-color:#FCFFA0;">' . number_format($record->price, 2)  . '</td>
                                        <td style="text-align:right; background-color:#FCFFA0;">' . number_format(($balance * $record->price), 2)  . '</td>
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
