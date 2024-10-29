<?php
date_default_timezone_set("Asia/Bangkok");
defined('BASEPATH') or exit('No direct script access allowed');
class Inventory_rm extends CI_Controller
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
            $this->load->view('costing/inventory_rm');
        } else {
            redirect('error_access');
        }
    }

    public function readEndingStock()
    {
        if ($this->input->post()) {
            $item_id = $this->input->post('item_id');
            $trans_date = @$this->input->post('trans_date');

            if (@$trans_date == "") {
                $date = date("Y-m-d");
            } else {
                $date = $trans_date;
            }

            $records = $this->crud->query("SELECT
                a.id,
                a.number, 
                a.name, 
                b.name as prodfam, 
                c.name as uom, 
                COALESCE(0,0) as begin_stock,
                (COALESCE(SUM(e.qty),0) + COALESCE(g.return_qty, 0)) as qty_in,
                f.qty as qty_out,
                (COALESCE(SUM(e.qty),0) - COALESCE(f.qty, 0) + COALESCE(g.return_qty, 0)) as end_stock
            FROM items a 
            JOIN item_familys b ON a.item_family_id = b.id
            JOIN uom c ON a.uom_id = c.id
            LEFT JOIN purchase_order_receipts d ON a.id = d.item_id and d.receipt_date <= '$date'
            LEFT JOIN scan_item_receipts e ON d.receipt_id = e.receipt_id
            LEFT JOIN (SELECT item_id, COALESCE(SUM(qty), 0) as qty FROM issued_material_details WHERE DATE_FORMAT(created_date, '%Y-%m-%d') <= '$date' GROUP BY item_id) f ON a.id = f.item_id
            LEFT JOIN (SELECT a.item_id, SUM(c.qty) as return_qty
                FROM return_materials a 
                JOIN return_material_labels b ON a.return_id = b.return_id
                JOIN scan_item_receipts c ON a.return_id = c.receipt_id and b.label_no = c.label_no
                WHERE a.return_date <=  '$date'
                GROUP BY a.item_id) g ON a.id = g.item_id
            WHERE a.id like '$item_id'
            GROUP BY a.id
            ORDER BY a.number");

            echo json_encode($records);
        }
    }

    public function readBalanceWip()
    {
        if ($this->input->post()) {
            $item_id = $this->input->post('item_id');
            $wip_balances = $this->crud->read("wip_balances", [], ["item_id" => $item_id], "", "id", "desc");

            echo json_encode($wip_balances);
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
        $filter_item_family = $this->input->get('filter_item_family');
        $filter_items = $this->input->get('filter_items');
        $filter_display = $this->input->get("filter_display");
        $filter_transtype = $this->input->get('filter_transtype');

        $start = strtotime($filter_from);
        $finish = strtotime($filter_to);

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
                                <small>REPORT INVENTORY HISTORY TRANSACTION</small><br>
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

        //Item Receipts
        $itemReceipts = $this->crud->query("SELECT
                a.id, a.number, a.name, h.po_date, d.receipt_date,
                h.price, i.currency, c.name as uom, b.name as prodfam,
                (COALESCE(SUM(e.qty),0) + COALESCE(g.return_qty,0) - COALESCE(f.qty, 0)) as begin_stock
            FROM items a 
            JOIN item_familys b ON a.item_family_id = b.id and b.number != '006'
            JOIN uom c ON a.uom_id = c.id
            LEFT JOIN purchase_order_receipts d ON a.id = d.item_id and d.receipt_date < '$filter_from'
            LEFT JOIN scan_item_receipts e ON d.receipt_id = e.receipt_id
            LEFT JOIN (SELECT item_id, COALESCE(SUM(qty), 0) as qty FROM issued_material_details WHERE DATE_FORMAT(created_date, '%Y-%m-%d') < '$filter_from' GROUP BY item_id) f ON a.id = f.item_id
            LEFT JOIN (SELECT a.item_id, SUM(c.qty) as return_qty
                FROM return_materials a 
                JOIN return_material_labels b ON a.return_id = b.return_id
                JOIN scan_item_receipts c ON a.return_id = c.receipt_id and b.label_no = c.label_no
                WHERE a.return_date < '$filter_from'
                GROUP BY a.item_id) g ON a.id = g.item_id
            LEFT JOIN purchase_orders h ON a.id = h.item_id and d.po_no = h.po_no
            LEFT JOIN suppliers i ON h.supplier_id = i.id
            WHERE a.id like '%$filter_items%' and b.number like '%$filter_item_family%'
            GROUP BY a.id
            ORDER BY a.number");

        if ($filter_display == "RECAP") {
            $html .= '<table id="customers" border="1" style="width: 100%">
                            <tr>
                                <th rowspan="2"width="20">No</th>
                                <th rowspan="2">Product No</th>
                                <th rowspan="2">Product Name</th>
                                <th rowspan="2">Uom</th>
                                <th rowspan="2">Product Family</th>
                                <th colspan="2" width="100">Begining Stock</th>
                                <th colspan="2" width="100">In</th>
                                <th colspan="2" width="100">Out</th>
                                <th colspan="2" width="100">Ending Stock</th>
                            </tr>
                            <tr>
                                <th>Qty</th>
                                <th>Amount</th>
                                <th>Qty</th>
                                <th>Amount</th>
                                <th>Qty</th>
                                <th>Amount</th>
                                <th>Qty</th>
                                <th>Amount</th>
                            </tr>';
        } else {
            $html .= '<table id="customers" style="width: 200%">
                        <tr>
                            <th rowspan="2" width="20">No</th>
                            <th rowspan="2">Product No</th>
                            <th rowspan="2">Product Name</th>
                            <th rowspan="2">Trans Type</th>
                            <th rowspan="2">Created By</th>
                            <th rowspan="2">PO Date</th>
                            <th rowspan="2">Receipt Date</th>
                            <th rowspan="2">Custom. Kind</th>
                            <th rowspan="2">Custom. No</th>
                            <th rowspan="2">Doc. No</th>
                            <th rowspan="2">Custom. Date</th>
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
        }

        $noh = 1;
        foreach ($itemReceipts as $itemReceipt) {
            $item_id = $itemReceipt->id;

            $monthBf = date('Y-m-01', strtotime('-1 month', strtotime($itemReceipt->receipt_date)));
            $currency = @$itemReceipt->currency;
            $exchange = $this->crud->read('exchange_rates', [], ["start_date" => $monthBf, "currency_from" => $currency, "currency_to" => "IDR"]);
            if ($currency != "IDR") {
                if ($exchange) {
                    $price = (@$itemReceipt->price * @$exchange->middle);
                } else {
                    $price = 0;
                }
            } else {
                $price = @$itemReceipt->price;
            }

            $begin = @$itemReceipt->begin_stock;
            $begin_price = @$price;
            $begin_amount = ($begin * $begin_price);

            //UNTUK REKAP
            $begin_recap = @$itemReceipt->begin_stock;
            $begin_amount_recap = ($begin * $begin_price);
            $in_recap = 0;
            $in_amount_recap = 0;
            $out_recap = 0;
            $out_amount_recap = 0;

            $end_qty = 0;
            $balance = 0;
            $balance_price = 0;
            $balance_amount = 0;

            if ($filter_display != "RECAP") {
                $html .= '  <tr style="background:#D8D8D8;">
                                <td>' . $noh . '</td>
                                <td>' . $itemReceipt->number . '</td>
                                <td>' . $itemReceipt->name . '</td>
                                <td>BEGIN STOCK</td>
                                <td></td>
                                <td>' . $itemReceipt->po_date . '</td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td style="text-align:right;">' . number_format($begin, 2) . '</td>
                                <td style="text-align:right;">' . number_format($begin_price, 2) . '</td>
                                <td style="text-align:right;">' . number_format($begin_amount, 2) . '</td>
                                <td style="text-align:right;">0</td>
                                <td style="text-align:right;">0</td>
                                <td style="text-align:right;">0</td>
                                <td style="text-align:right;">0</td>
                                <td style="text-align:right;">0</td>
                                <td style="text-align:right;">0</td>
                                <td style="text-align:right;">' . number_format($begin, 2)  . '</td>
                                <td style="text-align:right;">' . number_format($begin_price, 2)  . '</td>
                                <td style="text-align:right;">' . number_format($begin_amount, 2)  . '</td>
                            </tr>';
            }

            $nod = 1;
            for ($i = $start; $i <= $finish; $i += (60 * 60 * 24)) {
                $working_date = date('Y-m-d', $i);

                //RECEIPT
                $receipts = $this->crud->query("SELECT
                        a.receipt_date, 
                        a.bc_kind, 
                        a.bc_aju, 
                        a.bc_document, 
                        a.bc_date, 
                        SUM(b.qty) as qty_receipt,
                        c.name as username,
                        d.po_date,
                        d.price, e.currency
                    FROM purchase_order_receipts a 
                    JOIN scan_item_receipts b ON a.receipt_id = b.receipt_id
                    JOIN users c ON a.created_by = c.username
                    LEFT JOIN purchase_orders d ON a.item_id = d.item_id and a.po_no = d.po_no
                    LEFT JOIN suppliers e ON d.supplier_id = e.id
                    WHERE a.item_id = '$item_id' and a.receipt_date between '$working_date' and '$working_date'
                    GROUP BY a.bc_kind, a.bc_aju, a.bc_document, a.bc_date");

                //ISSUED
                $issueds = $this->crud->query("SELECT a.*, d.po_date, d.price, e.currency, c.receipt_date
                    FROM issued_material_details a
                    LEFT JOIN purchase_order_labels b ON a.label_no = b.label_no
                    LEFT JOIN barcode_divides f ON a.label_no = f.label_divided
                    LEFT JOIN purchase_order_receipts c ON a.item_id = c.item_id and (b.receipt_id = c.receipt_id or f.reff = c.receipt_id) 
                    LEFT JOIN purchase_orders d ON a.item_id = d.item_id and c.po_no = d.po_no
                    LEFT JOIN suppliers e ON d.supplier_id = e.id
                    WHERE a.item_id = '$item_id' 
                    and DATE_FORMAT(a.created_date, '%Y-%m-%d') between '$working_date' and '$working_date'");

                //RETURN
                $returns = $this->crud->query("SELECT
                        a.return_no,
                        a.return_id,
                        a.return_name,
                        a.return_date,
                        b.label_no,
                        b.qty,
                        d.name as username
                    FROM return_materials a 
                    JOIN return_material_labels b ON a.return_id = b.return_id
                    JOIN scan_item_receipts c ON a.return_id = c.receipt_id
                    JOIN users d ON a.created_by = d.username
                    WHERE a.item_id = '$item_id' and a.return_date between '$working_date' and '$working_date'
                    GROUP BY b.label_no");

                //Purchase Order Receipt
                foreach ($receipts as $receipt) {
                    $currency = @$receipt->currency;

                    $monthBf = date('Y-m-01', strtotime('-1 month', strtotime($receipt->receipt_date)));
                    $exchange = $this->crud->read('exchange_rates', [], ["start_date" => $monthBf, "currency_from" => $currency, "currency_to" => "IDR"]);

                    if ($currency != "IDR") {
                        if ($exchange) {
                            $price = (@$receipt->price * @$exchange->middle);
                        } else {
                            $price = 0;
                        }
                    } else {
                        $price = @$receipt->price;
                    }

                    $amount = ($receipt->qty_receipt * $price);

                    $balance = ($begin + ($receipt->qty_receipt - $end_qty));
                    $balance_price = (($begin_amount + ($receipt->qty_receipt * $price)) / $balance);
                    $balance_amount = ($begin_amount + ($receipt->qty_receipt * $price));

                    if ($filter_display != "RECAP") {
                        $html .= '  <tr>
                                    <td>' . $noh . '.' . $nod . '</td>
                                    <td>' . $itemReceipt->number . '</td>
                                    <td>' . $itemReceipt->name . '</td>
                                    <td>RECEIPT</td>
                                    <td>' . $receipt->username . '</td>
                                    <td>' . $receipt->po_date . '</td>
                                    <td>' . $receipt->receipt_date . '</td>
                                    <td>' . $receipt->bc_kind . '</td>
                                    <td>' . $receipt->bc_aju . '</td>
                                    <td>' . $receipt->bc_document . '</td>
                                    <td>' . $receipt->bc_date . '</td>
                                    <td style="text-align:right;">' . number_format($begin, 2) . '</td>
                                    <td style="text-align:right;">' . number_format($price, 2) . '</td>
                                    <td style="text-align:right;">' . number_format($begin_amount, 2) . '</td>
                                    <td style="text-align:right; color:green; font-weight:bold;">' . number_format($receipt->qty_receipt, 2) . '</td>
                                    <td style="text-align:right;">' . number_format($price, 2) . '</td>
                                    <td style="text-align:right; color:green; font-weight:bold;">' . number_format($amount, 2) . '</td>
                                    <td style="text-align:right;">' . number_format(0)  . '</td>
                                    <td style="text-align:right;">' . number_format(0)  . '</td>
                                    <td style="text-align:right;">' . number_format(0)  . '</td>
                                    <td style="text-align:right;">' . number_format($balance, 2)  . '</td>
                                    <td style="text-align:right;">' . number_format($balance_price, 2)  . '</td>
                                    <td style="text-align:right;">' . number_format($balance_amount, 2)  . '</td>
                                </tr>';
                    }

                    $begin += $receipt->qty_receipt;
                    $begin_price = @$balance_price;
                    $begin_amount += $amount;
                    $in_recap += $receipt->qty_receipt;
                    $in_amount_recap += $amount;
                    $nod++;
                }

                //Issued Material
                foreach ($issueds as $issued) {
                    $user = $this->crud->read("users", [], ["username" => $issued->created_by]);
                    $price = $begin_price;
                    $amount = ($issued->qty * $price);

                    $balance = ($begin - $issued->qty);
                    $balance_price = $price;
                    $balance_amount = ($begin_amount - ($issued->qty * $price));
                    if ($filter_display != "RECAP") {
                        $html .= '  <tr>
                                    <td>' . $noh . '.' . $nod . '</td>
                                    <td>' . $itemReceipt->number . '</td>
                                    <td>' . $itemReceipt->name . '</td>
                                    <td>ISSUED</td>
                                    <td>' . $user->name . '</td>
                                    <td>' . $issued->po_date . '</td>
                                    <td>' . date("Y-m-d", strtotime($issued->created_date)) . '</td>
                                    <td>-</td>
                                    <td>' . $issued->label_no . '</td>
                                    <td>' . $issued->request_no . '</td>
                                    <td>-</td>
                                    <td style="text-align:right;">' . number_format($begin, 2) . '</td>
                                    <td style="text-align:right;">' . number_format($price, 2) . '</td>
                                    <td style="text-align:right;">' . number_format($begin_amount, 2) . '</td>
                                    <td style="text-align:right;">' . number_format(0) . '</td>
                                    <td style="text-align:right;">' . number_format(0) . '</td>
                                    <td style="text-align:right;">' . number_format(0) . '</td>
                                    <td style="text-align:right; color:red; font-weight:bold;">' . number_format($issued->qty, 2)  . '</td>
                                    <td style="text-align:right;">' . number_format($price, 2)  . '</td>
                                    <td style="text-align:right; color:red; font-weight:bold;">' . number_format($amount, 2)  . '</td>
                                    <td style="text-align:right;">' . number_format($balance, 2)  . '</td>
                                    <td style="text-align:right;">' . number_format($balance_price, 2)  . '</td>
                                    <td style="text-align:right;">' . number_format($balance_amount, 2)  . '</td>
                                </tr>';
                    }
                    $begin -= $issued->qty;
                    $begin_price = @$price;
                    $begin_amount -= $amount;
                    $out_recap += $issued->qty;
                    $out_amount_recap += $amount;
                    $nod++;
                }

                //Return Material
                foreach ($returns as $return) {
                    $balance = ($begin + $return->qty);
                    if ($filter_display != "RECAP") {
                        $html .= '  <tr>
                                    <td>' . $noh . '.' . $nod . '</td>
                                    <td>' . $itemReceipt->number . '</td>
                                    <td>' . $itemReceipt->name . '</td>
                                    <td>RETURN</td>
                                    <td>' . $return->username . '</td>
                                    <td>' . $itemReceipt->po_date . '</td>
                                    <td>' . date("Y-m-d", strtotime($return->return_date)) . '</td>
                                    <td>-</td>
                                    <td>' . $return->label_no . '</td>
                                    <td>' . $return->return_no . '</td>
                                    <td>-</td>
                                    <td style="text-align:right;">' . number_format($begin, 2) . '</td>
                                    <td style="text-align:right;">' . number_format($price, 2) . '</td>
                                    <td style="text-align:right;">' . number_format($amount, 2) . '</td>
                                    <td style="text-align:right;">' . number_format($return->qty, 2)  . '</td>
                                    <td style="text-align:right;">' . number_format(0) . '</td>
                                    <td style="text-align:right;">' . number_format(0) . '</td>
                                    <td style="text-align:right;">' . number_format(0) . '</td>
                                    <td style="text-align:right;">' . number_format($balance, 2)  . '</td>
                                    <td style="text-align:right;">' . number_format(0) . '</td>
                                    <td style="text-align:right;">' . number_format(0) . '</td>
                                </tr>';
                    }
                    $begin += $return->qty;
                    $nod++;
                }
            }

            if ($filter_display == "RECAP") {
                $html .= '  <tr>
                                <td>' . $noh . '</td>
                                <td>' . $itemReceipt->number . '</td>
                                <td>' . $itemReceipt->name . '</td>
                                <td>' . $itemReceipt->uom . '</td>
                                <td>' . $itemReceipt->prodfam . '</td>
                                <td style="text-align:right;">' . number_format($begin_recap, 2) . '</td>
                                <td style="text-align:right;">' . number_format($begin_amount_recap, 2) . '</td>
                                <td style="text-align:right;">' . number_format($in_recap, 2) . '</td>
                                <td style="text-align:right;">' . number_format($in_amount_recap, 2) . '</td>
                                <td style="text-align:right;">' . number_format($out_recap, 2) . '</td>
                                <td style="text-align:right;">' . number_format($out_amount_recap, 2) . '</td>
                                <td style="text-align:right;">' . number_format(($begin_recap + $in_recap - $out_recap), 2) . '</td>
                                <td style="text-align:right;">' . number_format(($begin_amount_recap + $in_amount_recap - $out_amount_recap), 2) . '</td>
                            </tr>';
            }

            $noh++;
        }

        $html .= '</table></body></html>';
        echo $html;
    }
}
