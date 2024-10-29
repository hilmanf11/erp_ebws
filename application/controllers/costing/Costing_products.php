<?php
date_default_timezone_set("Asia/Bangkok");
defined('BASEPATH') or exit('No direct script access allowed');
class Costing_products extends CI_Controller
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
            $this->load->view('costing/costing_products');
        } else {
            redirect('error_access');
        }
    }

    public function readYears()
    {
        $tahun_before = date('Y', strtotime('-10 year', strtotime(date('Y'))));
        $tahun_next = date('Y', strtotime('+1 year', strtotime(date('Y'))));
        for ($i = $tahun_next; $i >= $tahun_before; $i--) {
            $arr[] = array("id" => $i, "name" => $i);
        }

        echo json_encode($arr);
    }

    public function readMonths()
    {
        $months = array('01' => 'January', '02' => 'February', '03' => 'March', '04' => 'April', '05' => 'May', '06' => 'June', '07' => 'July', '08' => 'August', '09' => 'September', '10' => 'October', '11' => 'November', '12' => 'December');
        foreach ($months as $key => $value) {
            $arr[] = array("id" => $key, "name" => $value);
        }

        echo json_encode($arr);
    }

    public function getData()
    {
        if ($this->input->post()) {
            $month = $this->input->post('month');
            $year = $this->input->post('year');
            $item_id = $this->input->post('item_id');
            $periode = $year . '-' . $month;
            $date = date("Y-m-t", strtotime($periode));

            $this->db->select('a.*, b.name as item_family_name, COALESCE(SUM(c.qty), 0) as qty');
            $this->db->from('items a');
            $this->db->join('item_familys b', 'b.id = a.item_family_id');
            $this->db->join('production_schedules c', "a.id = c.item_id and c.month = '$month' and c.year = '$year'", 'left');
            $this->db->where("b.number", '001');
            $this->db->like('a.id', $item_id);
            $this->db->group_by('a.id');
            $this->db->order_by('a.number', 'asc');
            $items = $this->db->get()->result_array();

            $total_qty = 0;
            foreach ($items as $item) {
                $this->db->select('component_id, qpa');
                $this->db->from('bom');
                $this->db->where('item_id', $item['id']);
                $boms = $this->db->get()->result_array();

                $direct_material = 0;
                foreach ($boms as $bom) {
                    $this->db->select('b.currency, a.price, a.request_date');
                    $this->db->from('purchase_orders a');
                    $this->db->join('suppliers b', 'a.supplier_id = b.id');
                    $this->db->where('a.item_id', $bom['component_id']);
                    $this->db->where('a.request_date <=', $date);
                    $this->db->order_by('a.request_date', 'desc');
                    $this->db->limit(1);
                    $po = $this->db->get()->row();

                    $currency = @$po->currency;

                    $monthBf = date('Y-m-01', strtotime('-1 month', strtotime(@$po->request_date)));
                    $exchange = $this->crud->read('exchange_rates', [], ["start_date" => $monthBf, "currency_from" => $currency, "currency_to" => "IDR"]);

                    if ($currency != "IDR") {
                        if ($exchange) {
                            $price = (@$po->price * @$exchange->middle);
                        } else {
                            $price = 0;
                        }
                    } else {
                        $price = @$po->price;
                    }

                    if ($item['qty'] > 0) {
                        $direct_material += ($bom['qpa'] * $price);
                    }
                }

                $datas[] = array(
                    "item_id" => $item['id'],
                    "item_no" => $item['number'],
                    "item_name" => $item['name'],
                    "qty" => $item['qty'],
                    "price" => $price,
                    "direct_material" => $direct_material,
                );

                $total_qty += $item['qty'];
            }

            foreach ($datas as $data) {
                $shared = round(($data['qty'] / $total_qty) * 100, 2);

                $labor_components = $this->crud->reads("costing_components", [], ["name" => "LABOR"]);
                $total_labor = 0;
                foreach ($labor_components as $labor_component) {
                    $labor = $this->crud->query("SELECT a.account_number, SUM(a.debit) as total_ap 
                    FROM ap_payment_journals a 
                    JOIN (SELECT DISTINCT payment_no, payment_date FROM ap_payments) b ON a.payment_no = b.payment_no 
                    WHERE a.account_number = '$labor_component->account_number' and b.payment_date LIKE '%$periode%'");
                    $total_labor += @$labor[0]->total_ap;
                }
                $direct_labor = round(($total_labor * $shared) / 100);

                $overtime_components = $this->crud->reads("costing_components", [], ["name" => "OVERTIME"]);
                $total_overtime = 0;
                foreach ($overtime_components as $overtime_component) {
                    $overtime = $this->crud->query("SELECT a.account_number, SUM(a.debit) as total_ap 
                    FROM ap_payment_journals a 
                    JOIN (SELECT DISTINCT payment_no, payment_date FROM ap_payments) b ON a.payment_no = b.payment_no 
                    WHERE a.account_number = '$overtime_component->account_number' and b.payment_date LIKE '%$periode%'");
                    $total_overtime += @$overtime[0]->total_ap;
                }
                $direct_overtime = round(($total_overtime * $shared) / 100);
                $direct_labor_total = ($direct_labor + $direct_overtime);

                if ($data['qty'] > 0) {
                    $direct_labor_pcs = round($direct_labor_total / $data['qty']);
                } else {
                    $direct_labor_pcs = 0;
                }

                $foh_components = $this->crud->reads("costing_components", [], ["name" => "FOH"]);
                $total_foh = 0;
                foreach ($foh_components as $foh_component) {
                    $foh = $this->crud->query("SELECT a.account_number, SUM(a.debit) as total_ap 
                    FROM ap_payment_journals a 
                    JOIN (SELECT DISTINCT payment_no, payment_date FROM ap_payments) b ON a.payment_no = b.payment_no 
                    WHERE a.account_number = '$foh_component->account_number' and b.payment_date LIKE '%$periode%'");
                    $total_foh += @$foh[0]->total_ap;
                }
                $direct_foh = round(($total_foh * $shared) / 100);
                if ($data['qty'] > 0) {
                    $direct_foh_pcs = round($direct_foh / $data['qty']);
                } else {
                    $direct_foh_pcs = 0;
                }

                $direct_total = ($data['direct_material'] + $direct_labor_pcs + $direct_foh_pcs);

                $dataFinals[] = array(
                    "periode" => $periode,
                    "item_id" => $data['item_id'],
                    "price" => $data['price'],
                    "qty" => $data['qty'],
                    "total_qty" => $total_qty,
                    "shared" => $shared,
                    "direct_material" => $data['direct_material'],
                    "direct_labor" => $direct_labor,
                    "direct_overtime" => $direct_overtime,
                    "direct_labor_total" => $direct_labor_total,
                    "direct_labor_pcs" => $direct_labor_pcs,
                    "direct_foh" => $direct_foh,
                    "direct_foh_pcs" => $direct_foh_pcs,
                    "direct_total" => $direct_total,
                );
            }

            $result['total'] = count($dataFinals);
            $result = array_merge($result, ['rows' => $dataFinals]);
            echo json_encode($result);
        }
    }

    //GET DATATABLES
    public function datatables()
    {
        if ($this->input->get()) {

            $filter_month = base64_decode($this->input->get('filter_month'));
            $filter_year = base64_decode($this->input->get('filter_year'));
            $filter_item = base64_decode($this->input->get('filter_item'));

            $filter_period = $filter_year . "-" . $filter_month;

            //Select Query
            $this->db->select('a.*, b.number as item_no, b.name as item_name');
            $this->db->from('costing_products a');
            $this->db->join('items b', 'a.item_id = b.id');
            $this->db->where('a.periode', $filter_period);
            $this->db->like('a.item_id', $filter_item);
            $this->db->order_by('a.qty', 'desc');

            //Total Data
            $totalRows = $this->db->count_all_results('', false);
            //Get Data Array
            $records = $this->db->get()->result_array();
            //Mapping Data
            $result['total'] = $totalRows;
            $result = array_merge($result, ['rows' => $records]);
            echo json_encode($result);
        }
    }

    //CREATE DATA
    public function create()
    {
        if ($this->input->post()) {
            $post   = $this->input->post();
            $costing_products = $this->crud->read('costing_products', [], ["periode" => $post['periode'], "item_id" => $post['item_id']]);

            if (@$costing_products->id != "") {
                $send = $this->crud->update('costing_products', ["periode" => $post['periode'], "item_id" => $post['item_id']], $post);
            } else {
                $send = $this->crud->create('costing_products', $post);
            }
            echo $send;
        } else {
            show_error("Cannot Process your request");
        }
    }

    //DELETE DATA
    public function delete()
    {
        $data = $this->input->post();
        $send = $this->crud->delete('costing_products', $data);
        echo $send;
    }

    public function uploadclearFailed()
    {
        @unlink('failed/costing_products.txt');
    }

    public function uploadcreateFailed()
    {
        if ($this->input->post()) {
            $message = $this->input->post('message');
            $textFailed = fopen('failed/costing_products.txt', 'a');
            fwrite($textFailed, $message . "\n");
            fclose($textFailed);
        }
    }

    public function uploadDownloadFailed()
    {
        $file = "failed/costing_products.txt";

        header('Content-Description: File Failed');
        header('Content-Disposition: attachment; filename=' . basename($file));
        header('Expires: 0');
        header('Cache-Control: must-revalidate');
        header('Pragma: public');
        header('Content-Length: ' . @filesize($file));
        header("Content-Type: text/plain");
        @readfile($file);
    }

    //PRINT & EXCEL DATA
    public function print($option = "")
    {
        if ($option == "excel") {
            $format  = date("Ymd");
            header("Content-type: application/vnd-ms-excel");
            header("Content-Disposition: attachment; filename=costing_products_$format.xls");
        }

        $filter_month = base64_decode($this->input->get('filter_month'));
        $filter_year = base64_decode($this->input->get('filter_year'));
        $filter_item = base64_decode($this->input->get('filter_item'));

        $filter_period = $filter_year . "-" . $filter_month;

        //Config
        $this->db->select('*');
        $this->db->from('config');
        $config = $this->db->get()->row();

        $this->db->select('a.*, b.number as item_no, b.name as item_name');
        $this->db->from('costing_products a');
        $this->db->join('items b', 'a.item_id = b.id');
        $this->db->where('a.periode', $filter_period);
        $this->db->like('a.item_id', $filter_item);
        $this->db->order_by('a.qty', 'desc');
        $records = $this->db->get()->result_array();
        $html = '<html><head><title>Print Data</title></head><style>body {font-family: Arial, Helvetica, sans-serif;}#customers {border-collapse: collapse;width: 100%;font-size: 12px;}#customers td, #customers th {border: 1px solid #ddd;padding: 2px;}#customers tr:nth-child(even){background-color: #f2f2f2;}#customers tr:hover {background-color: #ddd;}#customers th {padding-top: 2px;padding-bottom: 2px;text-align: left;color: black;}</style><body>
        <center>
            <div style="float: left; font-size: 12px; text-align: left;">
                <table style="width: 100%;">
                    <tr>
                        <td width="50" style="font-size: 12px; vertical-align: top; text-align: center; vertical-align:jus margin-right:10px;">
                            <img src="' . $config->favicon . '" width="30">
                        </td>
                        <td style="font-size: 14px; text-align: left; margin:2px;">
                            <b>' . $config->name . '</b><br>
                            <small>GENERATE COSTING PRODUCTS PERIOD ' . $filter_period . '</small>
                        </td>
                    </tr>
                </table>
            </div>
            <div style="float: right; font-size: 12px; text-align: right;">
                Print Date ' . date("d M Y H:m:s") . ' <br>
                Print By ' . $this->session->username . '  
            </div>
        </center>
        <br><br><br>
        
        <table id="customers" border="1">
            <tr>
                <th rowspan="2" width="20">No</th>
                <th rowspan="2">Product No</th>
                <th rowspan="2">Product Name</th>
                <th rowspan="2">Quantity</th>
                <th rowspan="2">Shared %</th>
                <th colspan="7">Total Manufacture Cost</th>
                <th rowspan="2">Cost Product</th>
            </tr>
            <tr>
                <th>Direct Material</th>
                <th>Labor Regular</th>
                <th>Overtime</th>
                <th>Direct Labor</th>
                <th>Direct Labor<br>(pcs)</th>
                <th>Direct FOH</th>
                <th>Direct FOH<br>(pcs)</th>
            </tr>';
        $no = 1;
        foreach ($records as $data) {
            $html .= '  <tr>
                            <td>' . $no . '</td>
                            <td>' . $data['item_no'] . '</td>
                            <td>' . $data['item_name'] . '</td>
                            <td>' . $data['qty'] . '</td>
                            <td>' . $data['shared'] . '</td>
                            <td>' . $data['direct_material'] . '</td>
                            <td>' . $data['direct_labor'] . '</td>
                            <td>' . $data['direct_overtime'] . '</td>
                            <td>' . $data['direct_labor_total'] . '</td>
                            <td>' . $data['direct_labor_pcs'] . '</td>
                            <td>' . $data['direct_foh'] . '</td>
                            <td>' . $data['direct_foh_pcs'] . '</td>
                            <td>' . $data['direct_total'] . '</td>
                        </tr>';
            $no++;
        }
        $html .= '</table></body></html>';
        echo $html;
    }
}
