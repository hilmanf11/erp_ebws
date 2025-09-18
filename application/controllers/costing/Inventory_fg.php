<?php
error_reporting(0);
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
            $data['menus_id'] = $this->id_menu();
            
            $this->load->view('template/header', $data);
            $this->load->view('costing/inventory_fg');
        } else {
            redirect('error_access');
        }
    }

    public function getData(){
        $filter_from = $this->input->post('filter_from');
        $filter_to   = $this->input->post('filter_to');
        $filter_items = $this->input->post('filter_items');
        $periode = date("Ym", strtotime($filter_from));
        $periode_bf = date("Ym", strtotime("-1 month", strtotime($filter_from)));
        $month = date("m", strtotime($filter_from));
        $year = date("m", strtotime($filter_from));

        $start = strtotime($filter_from);
        $finish = strtotime($filter_to);

        //Item Receipts
        $records = $this->crud->query("SELECT
            a.id,
            a.uom
        FROM item_fg a 
        WHERE a.id like '%$filter_items%'
        GROUP BY a.id
        ORDER BY a.number");
        
        $data = array();
        foreach ($records as $record) {
            $item_fg_id = $record->id;
            
            $begin = $this->crud->query("SELECT item_fg_id, SUM(qty) as qty, SUM(amount) as amount, SUM(direct_material) as direct_material, SUM(direct_labor) as direct_labor, SUM(direct_foh) as direct_foh FROM inventory_fg WHERE trans_date < '$filter_from' and item_fg_id = '$item_fg_id' GROUP BY item_fg_id");
            
            //INVENTORIES
            $inventories = $this->crud->query("SELECT * FROM inventory_wip WHERE trans_type = 'SCAN FG' and item_fg_id = '$item_fg_id' and trans_date between '$filter_from' and '$filter_to'");

            //DELIVERY
            $deliveries = $this->crud->query("SELECT a.* FROM delivery_notes a WHERE a.item_fg_id = '$item_fg_id' and a.delivery_note_date between '$filter_from' and '$filter_to'");

            $price = 0;
            foreach ($inventories as $inventory) {
                $data[] = array(
                    "created_by" => $this->session->username,
                    "created_date" => date("Y-m-d H:i:s"),
                    "period" => $periode,
                    "item_fg_id" => $item_fg_id,
                    "trans_type" => "RECEIPT FG",
                    "created_name" => $inventory->created_by,
                    "trans_date" => $inventory->trans_date,
                    "invoice_no" => $inventory->invoice_no,
                    "customer_po" => "",
                    "document_no" => $inventory->document_no,
                    "uom" => $record->uom,
                    "qty" => abs($inventory->qty),
                    "price" => abs($inventory->price),
                    "amount" => abs($inventory->amount),
                );

                $price = $inventory->price;
            }

            foreach ($deliveries as $delivery) {
                $data[] = array(
                    "created_by" => $this->session->username,
                    "created_date" => date("Y-m-d H:i:s"),
                    "period" => $periode,
                    "item_fg_id" => $item_fg_id,
                    "trans_type" => "DELIVERY NOTE",
                    "created_name" => $delivery->created_by,
                    "trans_date" => $delivery->delivery_note_date,
                    "invoice_no" => $delivery->delivery_order_no,
                    "customer_po" => $delivery->customer_order_no,
                    "document_no" => $delivery->delivery_note_no,
                    "uom" => $record->uom,
                    "qty" => ($delivery->qty * -1),
                    "price" => $price,
                    "amount" => (($delivery->qty * -1) * $price),
                );
            }
        }

        foreach ($data as $dt) {
            $inventory_fg = $this->crud->reads("inventory_fg", [], [
                "item_fg_id" => $dt['item_fg_id'], 
                "invoice_no" => $dt['invoice_no'],
                "document_no" => $dt['document_no'], 
                "trans_date" => $dt['trans_date']
            ]);

            if(count($inventory_fg) > 0){
                $this->db->update('inventory_fg', $dt, [
                    "item_fg_id" => $dt['item_fg_id'], 
                    "invoice_no" => $dt['invoice_no'],
                    "document_no" => $dt['document_no'], 
                    "trans_date" => $dt['trans_date']
                ]);
            }else{
                $this->db->insert('inventory_fg', $dt);
            }
        }

        $result['total'] = count($data);
        $result = array_merge($result, ['rows' => $data]);
        echo json_encode($result);
    }


    public function formatNo($number, $decimal){
        if($number >= 0){
            return "<span>".number_format($number, $decimal)."</span>";
        }else{
            return "<span style='color:red;'>(".number_format(abs($number), $decimal).")</span>";
        }
    }

    public function print($option = "")
    {
        if ($option == "excel") {
            $format  = date("Ymd");
            header("Content-type: application/vnd-ms-excel");
            header("Content-Disposition: attachment; filename=inventory_fg_$format.xls");
        }

        $filter_from = $this->input->get('filter_from');
        $filter_to   = $this->input->get('filter_to');
        $filter_items = $this->input->get('filter_items');
        $filter_display = $this->input->get("filter_display");

        $start = strtotime($filter_from);
        $finish = strtotime($filter_to);

        $period_tb = date("Ym", strtotime($filter_from));
        $periode_tb_bf = date("Ym", strtotime("-1 month", strtotime($filter_from)));

        $periode = date("Y-m", strtotime($filter_from));
        $periode_bf = date("Y-m", strtotime("-1 month", strtotime($filter_from)));

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
                                <small>REPORT INVENTORY HISTORY TRANSACTION FINISHGOOD</small><br>
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
            a.number_customer as number, 
            a.name, 
            'FINISH GOOD' as prodfam, 
            a.uom,
            COALESCE(d.qty) as qty_in,
            COALESCE(d.direct_material) as direct_material_in,
            COALESCE(d.direct_labor) as direct_labor_in,
            COALESCE(d.direct_foh) as direct_foh_in,
            COALESCE(d.price) as price_in,
            COALESCE(d.amount) as amount_in,
            COALESCE(e.qty) as qty_out,
            COALESCE(e.direct_material) as direct_material_out,
            COALESCE(e.direct_labor) as direct_labor_out,
            COALESCE(e.direct_foh) as direct_foh_out,
            COALESCE(e.price) as price_out,
            COALESCE(e.amount) as amount_out
        FROM item_fg a
        LEFT JOIN (SELECT item_fg_id, price, SUM(qty) as qty, SUM(amount) as amount, SUM(direct_material) as direct_material, SUM(direct_labor) as direct_labor, SUM(direct_foh) as direct_foh FROM inventory_fg WHERE trans_date between '$filter_from' and '$filter_to' and trans_type = 'RECEIPT FG' GROUP BY item_fg_id) d ON a.id = d.item_fg_id
        LEFT JOIN (SELECT item_fg_id, price, SUM(qty) as qty, SUM(amount) as amount, SUM(direct_material) as direct_material, SUM(direct_labor) as direct_labor, SUM(direct_foh) as direct_foh FROM inventory_fg WHERE trans_date between '$filter_from' and '$filter_to' and trans_type = 'DELIVERY NOTE' GROUP BY item_fg_id) e ON a.id = e.item_fg_id
        WHERE a.id like '%$filter_items%'
        GROUP BY a.id
        ORDER BY a.number");

        $html .= '<table id="customers" style="width: 100%">
                    <tr>
                        <th rowspan="2" width="20">No</th>
                        <th colspan="2" rowspan="2">Product No</th>
                        <th colspan="3" rowspan="2">Product Name</th>
                        <th rowspan="2">Uom</th>
                        <th  colspan="3">Begining Stock</th>
                        <th  colspan="3">In</th>
                        <th  colspan="3">Out</th>
                        <th  colspan="3">Ending Stock</th>
                    </tr>
                    <tr>
                        <th >Qty</th>
                        <th >Price</th>
                        <th >Amount</th>
                        <th >Qty</th>
                        <th >Price</th>
                        <th >Amount</th>
                        <th >Qty</th>
                        <th >Price</th>
                        <th >Amount</th>
                        <th >Qty</th>
                        <th >Price</th>
                        <th >Amount</th>
                    </tr>';

        $noh = 1;
        $total_begin = 0;
        $total_begin_price = 0;
        $total_qty_in = 0;
        $total_qty_in_price = 0;
        $total_qty_out = 0;
        $total_qty_out_price = 0;
        $total_end = 0;
        $total_end_price = 0;

        foreach ($records as $record) {
            $item_fg_id = $record->id;

            $begin = $this->crud->query("SELECT item_fg_id, SUM(qty) as qty, SUM(amount) as amount, SUM(direct_material) as direct_material, SUM(direct_labor) as direct_labor, SUM(direct_foh) as direct_foh FROM inventory_fg WHERE trans_date < '$filter_from' and item_fg_id = '$item_fg_id' GROUP BY item_fg_id");

            if(is_nan(@$begin[0]->amount / @$begin[0]->qty)){
                $begin_price = 0;
            }else{
                $begin_price = (@$begin[0]->amount / @$begin[0]->qty);
            }
            
            if($record->qty_in > 0){
                $price_in = ($record->amount_in / $record->qty_in);
            }else{
                $price_in = 0;
            }

            if(abs($record->qty_out) > 0){
                $price_out = abs($record->amount_out / $record->qty_out);
            }else{
                $price_out = 0;
            }

            $ending_qty = (@$begin[0]->qty + $record->qty_in - abs($record->qty_out));
            $ending_amount = (@$begin[0]->amount + $record->amount_in - abs($record->amount_out));

            if($ending_qty > 0){
                $ending_price = ($ending_amount / $ending_qty);
            }else{
                $ending_price = 0;
            }

            $html .= '  <tr>
                            <td style="text-align:center">' . $noh . '</td>
                            <td colspan="2">' . $record->number . '</td>
                            <td colspan="3">' . $record->name . '</td>
                            <td>' . $record->uom . '</td>
                            <td style="text-align:right;">' . $this->formatNo(@$begin[0]->qty, 2) . '</td>
                            <td style="text-align:right;">' . $this->formatNo($begin_price, 4) . '</td>
                            <td style="text-align:right;">' . $this->formatNo(@$begin[0]->amount, 2) . '</td>
                            <td style="text-align:right;">' . $this->formatNo($record->qty_in, 2) . '</td>
                            <td style="text-align:right;">' . $this->formatNo($price_in, 4) . '</td>
                            <td style="text-align:right;">' . $this->formatNo($record->amount_in, 2) . '</td>
                            <td style="text-align:right;">' . $this->formatNo(($record->qty_out), 2) . '</td>
                            <td style="text-align:right;">' . $this->formatNo($price_out, 4) . '</td>
                            <td style="text-align:right;">' . $this->formatNo(($record->amount_out), 2) . '</td>
                            <td style="text-align:right;">' . $this->formatNo($ending_qty, 2) . '</td>
                            <td style="text-align:right;">' . $this->formatNo($ending_price, 4) . '</td>
                            <td style="text-align:right;">' . $this->formatNo($ending_amount, 2) . '</td>
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
                                <th colspan="3">Begining Stock</th>
                                <th colspan="3">In</th>
                                <th colspan="3">Out</th>
                                <th colspan="3">Ending Stock</th>
                            </tr>
                            <tr>
                                <th>Qty</th>
                                <th>Price</th>
                                <th>Amount</th>
                                <th>Qty</th>
                                <th>Price</th>
                                <th>Amount</th>
                                <th>Qty</th>
                                <th>Price</th>
                                <th>Amount</th>
                                <th>Qty</th>
                                <th>Price</th>
                                <th>Amount</th>
                            </tr>';
                $nod = 1;
                for ($i = $start; $i <= $finish; $i += (60 * 60 * 24)) {
                    $working_date = date('Y-m-d', $i);
                    $inventories = $this->crud->query("SELECT * FROM inventory_fg WHERE item_fg_id = '$item_fg_id' and trans_date = '$working_date'");

                    //Wip Receipt
                    foreach ($inventories as $inventory) {
                        if($inventory->trans_type == "RECEIPT FG"){
                            $qty_in = $inventory->qty;
                            $price_in = $inventory->price;
                            $amount_in = $inventory->amount;
                            $qty_out = 0;
                            $price_out = 0;
                            $amount_out = 0;
                        }else{
                            $qty_in = 0;
                            $price_in = 0;
                            $amount_in = 0;
                            $qty_out = $inventory->qty;
                            $price_out = $inventory->price;
                            $amount_out = $inventory->amount;
                        }

                        $qty_end = ($begin_qty + $qty_in - abs($qty_out));
                        $amount_end = abs($begin_amount + $amount_in - abs($amount_out));
                        $price_end = ($amount_end / $qty_end);

                        $html .= '  <tr>
                                        <td></td>
                                        <td style="text-align:center">' . $nod . '</td>
                                        <td>'.$inventory->trans_type.'</td>
                                        <td>' . $inventory->trans_date . '</td>
                                        <td>' . $inventory->created_name . '</td>
                                        <td>' . $inventory->invoice_no . '</td>
                                        <td>' . $inventory->document_no . '</td>
                                        <td style="text-align:right;">' . $this->formatNo($begin_qty, 2) . '</td>
                                        <td style="text-align:right;">' . $this->formatNo($begin_price, 4) . '</td>
                                        <td style="text-align:right;">' . $this->formatNo(abs($begin_amount), 2) . '</td>
                                        <td style="text-align:right;">' . $this->formatNo($qty_in, 2) . '</td>
                                        <td style="text-align:right;">' . $this->formatNo($price_in, 4) . '</td>
                                        <td style="text-align:right;">' . $this->formatNo($amount_in, 2) . '</td>
                                        <td style="text-align:right;">' . $this->formatNo(abs($qty_out), 2)  . '</td>
                                        <td style="text-align:right;">' . $this->formatNo(abs($price_out), 4)  . '</td>
                                        <td style="text-align:right;">' . $this->formatNo(abs($amount_out), 2)  . '</td>
                                        <td style="text-align:right;">' . $this->formatNo($qty_end, 2)  . '</td>
                                        <td style="text-align:right;">' . $this->formatNo($price_end, 4)  . '</td>
                                        <td style="text-align:right;">' . $this->formatNo($amount_end, 2)  . '</td>
                                    </tr>';

                        $begin_qty += ($qty_in - abs($qty_out));
                        $begin_amount += ($amount_in - abs($amount_out));
                        $begin_price = (abs($begin_amount) / $begin_qty);
                        $nod++;
                    }
                }
            }

            $noh++;

            $total_begin += @$begin_qty;
            $total_begin_price += @$begin_amount;
            $total_qty_in += $record->qty_in;
            $total_qty_in_price += $record->amount_in;
            $total_qty_out += $record->qty_out;
            $total_qty_out_price += $record->amount_out;
            $total_end += $ending_qty;
            $total_end_price += $ending_amount;
        }

        if ($filter_display == "RECAP") {
            $html .= '  <tr>
                            <td colspan="7" style="text-align:right;"><b>GRAND TOTAL</b></td>
                            <td style="text-align:right;"><b>' . $this->formatNo($total_begin, 2) . '</b></td>
                            <td style="text-align:right;"><b>-</b></td>
                            <td style="text-align:right;"><b>' . $this->formatNo($total_begin_price, 2) . '</b></td>
                            <td style="text-align:right;"><b>' . $this->formatNo($total_qty_in, 2) . '</b></td>
                            <td style="text-align:right;"><b>-</b></td>
                            <td style="text-align:right;"><b>' . $this->formatNo($total_qty_in_price, 2) . '</b></td>
                            <td style="text-align:right;"><b>' . $this->formatNo(abs($total_qty_out), 2) . '</b></td>
                            <td style="text-align:right;"><b>-</b></td>
                            <td style="text-align:right;"><b>' . $this->formatNo($total_qty_out_price, 2) . '</b></td>
                            <td style="text-align:right;"><b>' . $this->formatNo($total_end, 2) . '</b></td>
                            <td style="text-align:right;"><b>-</b></td>
                            <td style="text-align:right;"><b>' . $this->formatNo($total_end_price, 2) . '</b></td>
                        </tr>';
        }

        $html .= '</table></body></html>';
        echo $html;
    }
}
