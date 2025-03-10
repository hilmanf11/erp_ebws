<?php
date_default_timezone_set("Asia/Bangkok");
defined('BASEPATH') or exit('No direct script access allowed');
class Production_schedules extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->helper('url');
        $this->load->helper(array('form', 'url'));
        $this->load->library('form_validation');
        $this->load->library('session');
        $this->load->library('Ciqrcode');
        $this->load->model('crud');
        //Validasi Form
        $this->form_validation->set_rules('item_fg_id', 'Product No', 'required|min_length[1]|max_length[50]');
    }
    public function index()
    {
        if (empty($this->session->username)) {
            redirect('error_session');
        } elseif ($this->checkuserAccess($this->id_menu()) > 0) {
            $data['button'] = $this->getbutton($this->id_menu());
            $this->load->view('template/header', $data);
            $this->load->view('planning/production_schedules');
        } else {
            redirect('error_access');
        }
    }
    public function reads()
    {
        $post = isset($_POST['q']) ? $_POST['q'] : "";
        $send = $this->crud->reads('production_schedules', ["name" => $post]);
        echo json_encode($send);
    }
    public function readPeriodAll()
    {
        $send = $this->crud->query("SELECT DISTINCT `period` FROM production_schedules ORDER BY `period` DESC");
        echo json_encode($send);
    }
    public function readWpAll()
    {
        $post = isset($_POST['q']) ? $_POST['q'] : "";
        $period = base64_decode($this->input->get('period'));
        $send = $this->crud->query("SELECT DISTINCT wp, workorder, item_fg_id FROM production_schedules WHERE `period` = '$period' and (workorder like '%$post%' or wp like '%$post%') ORDER BY workorder DESC");
        echo json_encode($send);
    }
    public function readPeriod($types = "")
    {
        if($types == "period"){
            $send = $this->crud->query("SELECT DISTINCT `period` FROM production_schedules WHERE `status` in ('0','1') and precut_status = 'YES' ORDER BY `period` DESC");
            echo json_encode($send);
        }else{
            $send = $this->crud->query("SELECT DISTINCT `period` FROM production_schedules WHERE `status` in ('0','1') and precut_status = 'YES' ORDER BY `period` DESC");
            echo json_encode($send);
        }
    }

    public function readWp()
    {
        $period = base64_decode($this->input->get('period'));
        $send = $this->crud->query("SELECT DISTINCT wp FROM production_schedules WHERE `status` in ('0','1') and precut_status = 'YES' and `period` = '$period' ORDER BY CAST(wp AS SIGNED) DESC");
        echo json_encode($send);
    }

    public function readWorkorder()
    {
        $period = base64_decode($this->input->get('period'));
        $wp = base64_decode($this->input->get('wp'));
        $send = $this->crud->query("SELECT a.*, b.number_customer
            FROM production_schedules a
            JOIN item_fg b ON a.item_fg_id = b.id
            WHERE a.status in ('0','1') and a.precut_status = 'YES' 
            and a.period = '$period' and wp = '$wp' 
            ORDER BY workorder DESC");
        echo json_encode($send);
    }

    public function filterWp($month, $year)
    {   
        $period = $year.$month;
        $send = $this->crud->query("SELECT DISTINCT wp FROM production_schedules WHERE `period` = '$period' ORDER BY `wp` DESC");
        echo json_encode($send);
    }

    public function filterWo($month, $year)
    {   
        $period = $year.$month;
        $send = $this->crud->query("SELECT DISTINCT workorder FROM production_schedules WHERE `period` = '$period' ORDER BY `workorder` DESC");
        echo json_encode($send);
    }

    public function readMonth()
    {
        $months = array('01' => 'January', '02' => 'February', '03' => 'March', '04' => 'April', '05' => 'May', '06' => 'June', '07' => 'July', '08' => 'August', '09' => 'September', '10' => 'October', '11' => 'November', '12' => 'December');
        foreach ($months as $key => $value) {
            $arr[] = array(
                "number" => $key,
                "name" => $value
            );
        }
        die(json_encode($arr));
    }

    public function readYear()
    {
        $tahun_before = date('Y', strtotime('-5 year', strtotime(date('Y'))));
        $tahun_next = date('Y', strtotime('+1 year', strtotime(date('Y'))));
        for ($i = $tahun_before; $i <= $tahun_next; $i++) {
            $arr[] = array(
                "number" => "$i"
            );
        }
        die(json_encode($arr));
    }

    public function workorder($wp, $trans_date)
    {
        $datenow = date("ymd", strtotime($trans_date));
        $sqlGetID = $this->db->query("SELECT max(workorder) as kode FROM production_schedules WHERE workorder like '%$datenow%'");
        $rowID = $sqlGetID->row();
        $kode = $rowID->kode;
        if ($kode == NULL) {
            $autoID = sprintf("%05s", $kode + 1);
        } else {
            $urutan = (int) substr($kode, -4);
            $urutan++;
            $autoID = sprintf("%05s", $urutan);
        }
        $workOrderNo = "WO" . $datenow . "-" . $autoID;
        return $workOrderNo;
    }

    public function getDataWp()
    {
        $post = $this->input->get();
        $p_month = $post['p_month'];
        $p_year = $post['p_year'];
        $customer_id = base64_decode($post['customer_id']);
        $item_fg_id = base64_decode($post['item_fg_id']);

        $query_generate_mpp = $this->db->query("SELECT * FROM generate_mpp WHERE p_month='$p_month' and p_year='$p_year' and customer_id = '$customer_id' and item_fg_id = '$item_fg_id'");
        $generate_mpp = $query_generate_mpp->row_array();

        $period = $p_year.$p_month;
        
        $firstDate = date("Y-m-01", strtotime(date("$p_year-$p_month-01")));
        $endDate = date("Y-m-t", strtotime(date("$p_year-$p_month")));

        $wp = 0;
        $tgl = 1;
        $alfabet = "z";
        $arr = array();
        while (strtotime($firstDate) <= strtotime($endDate)) {
            $working_date = date('Y-m-d', strtotime($firstDate));

            $this->db->select('remarks');
            $this->db->from('calendars');
            $this->db->where('working_date', $working_date);
            $holiday = $this->db->get()->row();

            if (@$holiday->remarks != null or @$holiday->remarks != "") {
                if($alfabet == "z"){
                    $alfabets = "A";
                }elseif($alfabet == "A"){
                    $alfabets = "B";
                }elseif($alfabet == "B"){
                    $alfabets = "C";
                }elseif($alfabet == "C"){
                    $alfabets = "D";
                }elseif($alfabet == "D"){
                    $alfabets = "E";
                }elseif($alfabet == "E"){
                    $alfabets = "F";
                }elseif($alfabet == "F"){
                    $alfabets = "G";
                }elseif($alfabet == "G"){
                    $alfabets = "H";
                }elseif($alfabet == "H"){
                    $alfabets = "I";
                }elseif($alfabet == "I"){
                    $alfabets = "J";
                }elseif($alfabet == "J"){
                    $alfabets = "K";
                }elseif($alfabet == "K"){
                    $alfabets = "L";
                }elseif($alfabet == "L"){
                    $alfabets = "M";
                }elseif($alfabet == "M"){
                    $alfabets = "N";
                }elseif($alfabet == "N"){
                    $alfabets = "O";
                }else{  
                    $alfabets = "";
                }

                $wpp = $wp.$alfabets;
                $alfabet = $alfabets;
                $firstDate_check = date("d M", strtotime("+1 day", strtotime($firstDate)));
                $working_date_check = date('Y-m-d', strtotime($firstDate_check));
                $this->db->select('remarks');
                $this->db->from('calendars');
                $this->db->where('working_date', $working_date_check);
                $holiday_check = $this->db->get()->row();

                // if (date('w', strtotime($firstDate_check)) !== '0' && date('w', strtotime($firstDate_check)) !== '6') {
                    if (@$holiday_check->remarks == null or @$holiday_check->remarks == "") {
                        $wp++;
                    }
                // }
            }else{
                if($wp == 0){
                    $wp = 1;
                }

                $wpp = $wp;
                $alfabet = "z";
                $firstDate_check = date("d M", strtotime("+1 day", strtotime($firstDate)));
                $working_date_check = date('Y-m-d', strtotime($firstDate_check));
                $this->db->select('remarks');
                $this->db->from('calendars');
                $this->db->where('working_date', $working_date_check);
                $holiday_check = $this->db->get()->row();

                // if (date('w', strtotime($firstDate_check)) !== '0' && date('w', strtotime($firstDate_check)) !== '6') {
                    if (@$holiday_check->remarks == null or @$holiday_check->remarks == "") {
                        $wp++;
                    }
                // }
            }

            $qty = $generate_mpp['date_'.$tgl];
            $trans_date = $p_year."-".$p_month."-".sprintf("%02s", $tgl);

            $dataFinal = array(
                "trans_date" => $trans_date,
                "period" => $period,
                "year" => $p_year,
                "month" => $p_month,
                "wp" => $wpp,
                "qty" => $qty,
            );

            $productionSchedule = $this->crud->read("production_schedules", [], [
                "customer_id" => $customer_id, 
                "item_fg_id" => $item_fg_id,
                "period" => $period,
                "year" => $p_year,
                "month" => $p_month,
                "wp" => $wpp,
            ]);

            if($qty > 0){
                if($productionSchedule){
                    //
                }else{
                    $arr[] = $dataFinal;
                }
            }else{
                //
            }

            $tgl++;
            $firstDate = date("Y-m-d", strtotime("+1 day", strtotime($firstDate)));
        }

        die(json_encode($arr));
    }

    public function datatables()
    {
        if ($this->input->post()) {
            $this->dummy = $this->load->database('dummy', TRUE);

            $filter_month = $this->input->get('filter_month');
            $filter_year = $this->input->get('filter_year');
            $filter_wp = $this->input->get('filter_wp');
            $filter_workorder = $this->input->get('filter_workorder');
            $filter_customers = $this->input->get('filter_customers');
            $filter_item_fg_id = $this->input->get('filter_item_fg_id');
            $filter_date_from = $this->input->get('filter_date_from');
            $filter_date_to = $this->input->get('filter_date_to');
            $filter_status = $this->input->get('filter_status');

            $page = $this->input->post('page');
            $rows = $this->input->post('rows');
            //Pagination 1-10
            $page   = isset($page) ? intval($page) : 1;
            $rows   = isset($rows) ? intval($rows) : 10;
            $offset = ($page - 1) * $rows;
            $result = array();
            //Select Query
            // $this->db->select("a.*, b.number as customer_number, b.name as customer_name, b.type as customer_type, 
            //     c.number as item_number, c.name as item_name, c.number_customer, c.uom,
            //     SUM(f.qty) as total_rfg,
            //     (CASE WHEN SUM(f.qty) >= a.qty THEN 1 ELSE 0 END) as status_wip2,
            //     (CASE WHEN SUM(f.qty) >= a.qty THEN 2 ELSE a.status END) as status_wo");
            $this->db->select("a.*, b.number as customer_number, b.name as customer_name, b.type as customer_type, 
                c.number as item_number, c.name as item_name, c.number_customer, c.uom");
            $this->db->from('production_schedules a');
            $this->db->join('customers b', 'a.customer_id = b.id');
            $this->db->join('item_fg c', 'a.item_fg_id = c.id');
            // $this->db->join('scan_item_receipts_fg f', 'a.workorder = f.workorder', 'left');
            $this->db->where('a.deleted', 0);
            // if($filter_status == "0"){
            //     $this->db->where("a.status", 0);
            // }elseif($filter_status == "2"){
            //     $this->db->where("f.id != ''");
            // }
            $this->db->like('a.month', $filter_month);
            $this->db->like('a.year', $filter_year);
            if($filter_wp != ""){
                $this->db->where('a.wp', $filter_wp);
            }
            $this->db->like('a.workorder', $filter_workorder);
            $this->db->like('a.customer_id', $filter_customers);
            $this->db->like('a.item_fg_id', $filter_item_fg_id);
            $this->db->group_by('a.workorder');
            $this->db->order_by('a.trans_date', 'DESC');
            $this->db->order_by('b.name', 'ASC');
            $this->db->order_by('c.number', 'ASC');
            $this->db->order_by('a.id', 'ASC');
            //Total Data
            $totalRows = $this->db->count_all_results('', false);
            //Limit 1 - 10
            $this->db->limit($rows, $offset);
            //Get Data Array
            $records = $this->db->get()->result_array();

            $arr = array();
            foreach ($records as $record) {
                $assy_number = $record['number_customer'];
                $workorder = $record['workorder'];
                $mpp = $record['period'];
                $wp = sprintf("%02s", $record['wp'])."/".substr($mpp, -2);

                $sqlQty = $this->dummy->query("SELECT COUNT(x.serial_number) as qty FROM (
                    SELECT DISTINCT z.serial_number FROM (
                    SELECT DISTINCT
                        TRIM(a.serial_number) AS serial_number,
                        TRIM(a.assy_number) AS assy_number,
                        TRIM(a.customer) AS customer,
                        TRIM(a.mpp) AS mpp,
                        TRIM(a.wp) AS wp,
                        TRIM(a.lot) AS lot,
                        DATE(a.tanggal_proses) AS tanggal,
                        COALESCE(a.jam_scan,'00:00:00') AS jam,
                        a.wds_qty
                    FROM mst_scan_proses a
                    WHERE kode_proses = '5' and assy_number = '$assy_number' and mpp = '$mpp' and wp = '$wp' and
                    tanggal_proses between '$filter_date_from' and '$filter_date_to' and status_repair = 'false' 
                    AND status_before IS NOT NULL
                    AND status_repair = 'f'
                    ORDER BY serial_number) z ) x");
                $rowQty = $sqlQty->row();
                $qty_scan = empty(@$rowQty->qty) ? 0 : @$rowQty->qty;

                $rfg = $this->crud->query("SELECT workorder, SUM(qty) as qty FROM wip_receipts WHERE workorder = '$workorder' GROUP BY workorder");

                if($qty_scan >= $record['qty']){
                    $status_wip2 = "1";
                }else{
                    $status_wip2 = "0";
                }

                if(@$rfg[0]->qty == 0){
                    $status_wo = "0";
                }elseif(@$rfg[0]->qty > 0){
                    $status_wo = "2";
                }else{
                    $status_wo = "1";
                }

                $arr[] = array_merge($record, [
                    "total_rfg" => $qty_scan,
                    "status_wip2" => $status_wip2,
                    "status_wo" => $status_wo,
                ]);
            }

            //Mapping Data
            $result['total'] = $totalRows;
            $result = array_merge($result, ['rows' => $arr]);
            echo json_encode($result);
        }
    }

    public function create()
    {
        if ($this->input->post()) {
            if ($this->form_validation->run() == TRUE) {
                $post = $this->input->post();
                $workorder = $this->workorder($post['wp'], $post['trans_date']);
                $production_schedules = $this->crud->read('production_schedules', [], ["customer_id" => $post['customer_id'], "item_fg_id" => $post['item_fg_id'], "wp" => $post['wp'], "trans_date" => $post['trans_date']]);

                if (@$production_schedules->id) {
                    show_error("Duplicate Data");
                } else {
                    $postFinal = array_merge($post, array("workorder" => $workorder, "period" => $post['year'] . $post['month'], "status_input" => "MANUAL"));
                    $send = $this->crud->create('production_schedules', $postFinal);
                }
                echo $send;
            } else {
                show_error(validation_errors());
            }
        } else {
            show_error("Cannot Process your request");
        }
    }
    
    public function update()
    {
        if ($this->input->post()) {
            $id   = base64_decode($this->input->get('id'));
            $post = $this->input->post();
            $send = $this->crud->update('production_schedules', ["id" => $id], $post);
            echo $send;
        } else {
            show_error("Cannot Process your request");
        }
    }
    
    public function precut()
    {
        if ($this->input->post()) {
            $id   = $this->input->post('id');
            $send = $this->crud->update('production_schedules', ["id" => $id], ["precut_status" => "YES", "precut_by" => $this->session->username, "precut_date" => date("Y-m-d H:i:s")]);
            echo $send;
        } else {
            show_error("Cannot Process your request");
        }
    }

    public function delete()
    {
        $data = $this->input->post();
        $send = $this->crud->delete('production_schedules', ["id" => $data['id']]);
        // $update = $this->crud->update('sales_orders', ["number" => $data['so_number'], "item_fg_id" => $data['item_fg_id']], ["status" => 0]);
        echo $send;
    }

    public function print_job_order($id)
    {
        //Config
        $this->db->select('*');
        $this->db->from('config');
        $config = $this->db->get()->row();
        $config_iso = $this->db->get('config_iso')->row();

        $this->db->select('a.*, b.lot');
        $this->db->from('production_schedules a');
        $this->db->join('item_fg b', 'a.item_fg_id = b.id');
        $this->db->where('a.deleted', 0);
        $this->db->where('a.id', $id);
        $label = $this->db->get()->row();
        $amountQty = ceil($label->qty / $label->lot);
        for ($i = 1; $i <= $amountQty; $i++) {
            $lots = sprintf("%03s", $i);
            $this->db->select('b.circuit');
            $this->db->from('production_schedules a');
            $this->db->join('job_orders b', 'a.item_fg_id = b.item_fg_id and a.customer_id and b.customer_id', 'left');
            $this->db->where('a.deleted', 0);
            $this->db->where('a.id', $id);
            $this->db->order_by('b.circuit', 'asc');
            $totalRows = $this->db->count_all_results('', false);
            $job_orders = $this->db->get()->result_array();
            $no = 1;
            $qty = $label->qty;
            foreach ($job_orders as $job_order) {
                $sequence = sprintf("%03s", $no);
                $label_no = $label->workorder . $lots . $sequence;
                if ($no == $totalRows) {
                    $finalQty = $qty;
                } else {
                    $finalQty = $label->lot;
                }
                $dataJobOrderLabel = array(
                    "workorder" => $label->workorder,
                    "label_no" => $label_no,
                    "circuit" => $job_order['circuit'],
                    "qty" => $finalQty,
                );
                $jobOrderLabel = $this->crud->read("job_order_labels", [], ["label_no" => $label_no]);
                if (empty($jobOrderLabel->id)) {
                    $this->crud->create("job_order_labels", $dataJobOrderLabel);
                }
                $qty -= $label->lot;
                $no++;
            }
        }
        $this->db->select('b.*, a.workorder, a.so_date, a.trans_date, a.qty, c.label_no, c.circuit, d.number as item_number, d.lot');
        $this->db->from('production_schedules a');
        $this->db->join('job_order_labels c', 'a.workorder = c.workorder');
        $this->db->join('job_orders b', 'a.item_fg_id = b.item_fg_id and a.customer_id and b.customer_id and c.circuit = b.circuit', 'left');
        $this->db->join('item_fg d', 'a.item_fg_id = d.id');
        $this->db->where('a.deleted', 0);
        $this->db->where('a.id', $id);
        $this->db->group_by('c.circuit');
        $this->db->group_by('c.label_no');
        $this->db->order_by('c.label_no', 'asc');
        $records = $this->db->get()->result_object();
        if ($records) {
            $html = '<html>
                    <head>
                        <title>' . $label->workorder . '</title>
                        <link rel="icon" href="' . $config->favicon . '" type="image/png" sizes="16x16">
                    </head>
                    <style>body {font-family: Arial, Helvetica, sans-serif;}#customers {border-collapse: collapse;width: 20cm;font-size: 12px;}#customers td, #customers th {border: 1px solid black;padding: 2px;}#customers tr:nth-child(even){background-color: #f2f2f2;}#customers tr:hover {background-color: #ddd;}#customers th {padding-top: 2px;padding-bottom: 2px;text-align: center;color: black;}</style><body>';
            foreach ($records as $record) {
                //Generate QRcode
                $this->createQrcode($record->label_no, "assets/image/qrcode/");
                $html .= '  <table id="customers" border="1" style="margin-bottom:20px;">
                                <tr>
                                    <th colspan="4" style="font-size:16px; padding:10px; text-align:center;"><b>JOB ORDER ' . $config->name . '</b></th>
                                    <th width="150">
                                        <table style="width:100%; font-size:10px; border:0;">
                                            <tr style="border:0;">
                                                <td width="60">Doc No</td>
                                                <td width="100">' . $config_iso->doc_job_order . '</td>
                                            </tr>
                                            <tr style="border:0;">
                                                <td>Form</td>
                                                <td>' . $config_iso->form_job_order . '</td>
                                            </tr>
                                        </table>
                                    </th>
                                </tr>
                                <tr>
                                    <th style="text-align:center;">MODEL</th>
                                    <th style="text-align:center;">PLAN QTY</th>
                                    <th style="text-align:center;">LOT</th>
                                    <th style="text-align:center;">START DATE</th>
                                    <th style="text-align:center;">ISSUE DATE</th>
                                </tr>
                                <tr>
                                    <td style="text-align:center;">' . $record->item_number . '</td>
                                    <td style="text-align:center;">' . $record->qty . '</td>
                                    <td style="text-align:center;">' . $record->lot . '</td>
                                    <td style="text-align:center;">' . $record->trans_date . '</td>
                                    <td style="text-align:center;">' . $record->so_date . '</td>
                                </tr>
                                <tr>
                                    <th style="text-align:center;">WIRE CODE</th>
                                    <th style="text-align:center;">TYPE & SIZE</th>
                                    <th style="text-align:center;">COLOR</th>
                                    <th style="text-align:center;">LENGTH</th>
                                    <th style="text-align:center;">M/C NO</th>
                                </tr>
                                <tr>
                                    <td style="text-align:center;">' . $record->wire . '</td>
                                    <td style="text-align:center;">' . $record->type . ' ' . $record->size . '</td>
                                    <td style="text-align:center;">' . $record->color . '</td>
                                    <td style="text-align:center;">' . $record->length . '</td>
                                    <td style="text-align:center;"></td>
                                </tr>
                                <tr>
                                    <th style="text-align:center;">TERMINAL SIDE A</th>
                                    <th style="text-align:center;">TERMINAL SIDE B</th>
                                    <th colspan="3" style="text-align:center;">WO. No</th>
                                </tr>
                                <tr>
                                    <td style="text-align:center; height:20px;">' . $record->a_terminal . '</td>
                                    <td style="text-align:center; height:20px;">' . $record->b_terminal . '</td>
                                    <td rowspan="7" colspan="3" style="text-align:center;">' . $record->workorder . '</td>
                                </tr>
                                <tr>
                                    <td style="text-align:center; height:20px;">' . $record->a_seal . '</td>
                                    <td style="text-align:center; height:20px;">' . $record->b_seal . '</td>
                                </tr>
                                <tr>
                                    <td style="text-align:center; height:20px;">' . $record->a_chi . '</td>
                                    <td style="text-align:center; height:20px;">' . $record->b_chi . '</td>
                                </tr>
                                <tr>
                                    <td style="text-align:center; height:20px;">' . $record->a_chc . '</td>
                                    <td style="text-align:center; height:20px;">' . $record->b_chc . '</td>
                                </tr>
                                <tr>
                                    <td style="text-align:center; height:20px;">' . $record->a_stripping . '</td>
                                    <td style="text-align:center; height:20px;">' . $record->b_stripping . '</td>
                                </tr>
                                <tr>
                                    <td style="text-align:center; height:20px;">' . $record->a_process . '</td>
                                    <td style="text-align:center; height:20px;">' . $record->b_process . '</td>
                                </tr>
                                <tr>
                                    <td style="text-align:center; height:20px;">' . $record->a_note . '</td>
                                    <td style="text-align:center; height:20px;">' . $record->b_note . '</td>
                                </tr>
                                <tr>
                                    <th style="text-align:center;">CIRCUIT NO</th>
                                    <th style="text-align:center;">SERIAL NO</th>
                                    <th style="text-align:center;">OPERATOR</th>
                                    <th style="text-align:center;">CHECK BY</th>
                                    <th style="text-align:center;">INSPECT BY</th>
                                </tr>
                                <tr>
                                    <th rowspan="3" style="text-align:center; height:50px; font-size:40px;">' . $record->circuit . '</th>
                                    <td rowspan="3" style="text-align:center; height:50px;">
                                        <img src="' . base_url('assets/image/qrcode/' . $record->label_no . '.png') . '" width="80"/>
                                        <br>
                                        <span>' . $record->label_no . '</span>
                                    </td>
                                    <th style="text-align:center; height:80px;"></th>
                                    <th style="text-align:center; height:80px;"></th>
                                    <th style="text-align:center; height:80px;"></th>
                                </tr>
                                <tr>
                                    <th style="text-align:left;">Name :</th>
                                    <th style="text-align:left;">Name :</th>
                                    <th style="text-align:left;">Name :</th>
                                </tr>
                                <tr>
                                    <th style="text-align:left;">Date :</th>
                                    <th style="text-align:left;">Date :</th>
                                    <th style="text-align:left;">Date :</th>
                                </tr>
                            </table>';
            }
            $html .= "<script>window.print()</script>";
            die($html);
        } else {
            echo "<h1>NOT FOUND JOB ORDER</h1>";
        }
    }

    public function print($option = "")
    {
        if ($option == "excel") {
            $format  = date("Ymd");
            header("Content-type: application/vnd-ms-excel");
            header("Content-Disposition: attachment; filename=production_schedules_$format.xls");
        }

        $this->dummy = $this->load->database('dummy', TRUE);

        $filter_month = $this->input->get('filter_month');
        $filter_year = $this->input->get('filter_year');
        $filter_wp = $this->input->get('filter_wp');
        $filter_workorder = $this->input->get('filter_workorder');
        $filter_customers = $this->input->get('filter_customers');
        $filter_item_fg_id = $this->input->get('filter_item_fg_id');
        $filter_date_from = $this->input->get('filter_date_from');
        $filter_date_to = $this->input->get('filter_date_to');
        $filter_status = $this->input->get('filter_status');

        //Config
        $this->db->select('*');
        $this->db->from('config');
        $config = $this->db->get()->row();
        
        // $this->db->select("a.*, b.number as customer_number, b.name as customer_name, b.type as customer_type, 
        //     c.number as item_number, c.name as item_name, c.number_customer, c.uom,
        //     SUM(f.qty) as total_rfg,
        //     (CASE WHEN f.id != '' THEN 2 ELSE a.status END) as status_wo");
        $this->db->select("a.*, b.number as customer_number, b.name as customer_name, b.type as customer_type, 
            c.number as item_number, c.name as item_name, c.number_customer, c.uom");
        $this->db->from('production_schedules a');
        $this->db->join('customers b', 'a.customer_id = b.id');
        $this->db->join('item_fg c', 'a.item_fg_id = c.id');
        // $this->db->join('scan_item_receipts_fg f', 'a.workorder = f.workorder', 'left');
        $this->db->where('a.deleted', 0);
        // if($filter_status == "0"){
        //     $this->db->where("a.status", 0);
        // }elseif($filter_status == "2"){
        //     $this->db->where("f.id != ''");
        // }
        $this->db->like('a.month', $filter_month);
        $this->db->like('a.year', $filter_year);
        if($filter_wp != ""){
            $this->db->where('a.wp', $filter_wp);
        }
        $this->db->like('a.workorder', $filter_workorder);
        $this->db->like('a.customer_id', $filter_customers);
        $this->db->like('a.item_fg_id', $filter_item_fg_id);
        // $this->db->group_by('a.workorder');
        $this->db->order_by('a.trans_date', 'DESC');
        $this->db->order_by('b.name', 'ASC');
        $this->db->order_by('c.number', 'ASC');
        $this->db->order_by('a.id', 'ASC');
        $records = $this->db->get()->result_array();

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
                                <small>PRODUCTION SCHEDULE</small>
                            </td>
                        </tr>
                    </table>
                </div>
                <div style="float: right; font-size: 12px; text-align: right;">
                    Print Date ' . date("d M Y H:i:s") . ' <br>
                    Print By ' . $this->session->username . '  
                </div>
            </center>
            <br><br><br>
            
            <table id="customers" border="1">
                <tr>
                    <th width="20">No</th>
                    <th>Status<br>RFG</th>
                    <th>Production<br>Order</th>
                    <th>Period</th>
                    <th>WP</th>
                    <th>WP Date</th>
                    <th>Work Order</th>
                    <th>Customer No</th>
                    <th>Customer Name</th>
                    <th>Customer Type</th>
                    <th>Product No</th>
                    <th>Product Customer</th>
                    <th>Product Name</th>
                    <th>UoM</th>
                    <th>Qty</th>
                    <th>RFG Qty</th>
                    <th>Created By</th>
                    <th>Created Date</th>
                    <th>Updated By</th>
                    <th>Updated Date</th>
                </tr>';
        $no = 1;
        foreach ($records as $data) {
            $assy_number = $data['number_customer'];
            $mpp = $data['period'];
            $wp = sprintf("%02s", $data['wp'])."/".substr($mpp, -2);

            $sqlQty = $this->dummy->query("SELECT COUNT(x.serial_number) as qty FROM (
                SELECT DISTINCT z.serial_number FROM (
                SELECT DISTINCT
                    TRIM(a.serial_number) AS serial_number,
                    TRIM(a.assy_number) AS assy_number,
                    TRIM(a.customer) AS customer,
                    TRIM(a.mpp) AS mpp,
                    TRIM(a.wp) AS wp,
                    TRIM(a.lot) AS lot,
                    DATE(a.tanggal_proses) AS tanggal,
                    COALESCE(a.jam_scan,'00:00:00') AS jam,
                    a.wds_qty
                FROM mst_scan_proses a
                WHERE kode_proses = '5' and assy_number = '$assy_number' and mpp = '$mpp' and wp = '$wp' and
                tanggal_proses between '$filter_date_from' and '$filter_date_to' and status_repair = 'false' 
                AND status_before IS NOT NULL
                AND status_repair = 'f'
                ORDER BY serial_number) z ) x");
            $rowQty = $sqlQty->row();
            $qty_scan = empty(@$rowQty->qty) ? 0 : @$rowQty->qty;

            if($qty_scan > 0){
                $style_wo = "style='background-color:#FFDFBD;'";
                $status_wo = "SUPPLY";
            }elseif(round($qty_scan) == round($data['qty'])){
                $style_wo = "style='background-color:#FFC8C8;'";
                $status_wo = "CLOSED";
            }else{
                $style_wo = "style='background-color:#C8FFCC;'";
                $status_wo = "OPEN";
            }

            $html .= '<tr>
                        <td style="text-align:center">' . $no . '</td>
                        <td '.$style_wo.'>' . $status_wo . '</td>
                        <td>' . $data['precut_status'] . '</td>
                        <td>' . $data['period'] . '</td>
                        <td>' . $data['wp'] . '</td>
                        <td>' . $data['trans_date'] . '</td>
                        <td>' . $data['workorder'] . '</td>
                        <td>' . $data['customer_number'] . '</td>
                        <td>' . $data['customer_name'] . '</td>
                        <td>' . $data['customer_type'] . '</td>
                        <td>' . $data['item_number'] . '</td>
                        <td>' . $data['number_customer'] . '</td>
                        <td>' . $data['item_name'] . '</td>
                        <td>' . $data['uom'] . '</td>
                        <td>' . number_format($data['qty'], 2) . '</td>
                        <td>' . number_format($qty_scan, 2) . '</td>
                        <td>' . $data['created_by'] . '</td>
                        <td>' . $data['created_date'] . '</td>
                        <td>' . $data['updated_by'] . '</td>
                        <td>' . $data['updated_date'] . '</td>
                    </tr>';
            $no++;
        }
        $html .= '</table></body></html>';
        echo $html;
    }
}
