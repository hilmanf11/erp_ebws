<?php
date_default_timezone_set("Asia/Bangkok");
defined('BASEPATH') or exit('No direct script access allowed');
class Wip_balances extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->helper('url');
        $this->load->helper(array('form', 'url'));
        $this->load->library('form_validation');
        $this->load->library('session');
        $this->load->model('crud');
        //VALIDASI FORM
        $this->form_validation->set_rules('item_rm_id', 'Item ID', 'required|min_length[1]|max_length[30]|is_unique[wip_balances.item_rm_id]');
    }
    //HALAMAN UTAMA
    public function index()
    {
        if (empty($this->session->username)) {
            redirect('error_session');
        } elseif ($this->checkuserAccess($this->id_menu()) > 0) {
            $data['button'] = $this->getbutton($this->id_menu());
            $this->load->view('template/header', $data);
            $this->load->view('warehouse/wip_balances');
        } else {
            redirect('error_access');
        }
    }
    //GET DATA
    public function reads()
    {
        $post = isset($_POST['q']) ? $_POST['q'] : "";
        $send = $this->crud->reads('wip_balances', ["name" => $post]);
        echo json_encode($send);
    }
    //GET DATATABLES
    public function datatables()
    {
        if ($this->input->post()) {
            $filters = json_decode($this->input->post('filterRules'));
            $page = $this->input->post('page');
            $rows = $this->input->post('rows');
            //Pagination 1-10
            $page   = isset($page) ? intval($page) : 1;
            $rows   = isset($rows) ? intval($rows) : 10;
            $offset = ($page - 1) * $rows;
            $result = array();
            //Select Query
            $this->db->select("a.*, 
                c.number as item_rm_number, 
                c.name as item_rm_name, 
                c.uom,
                coalesce(i.qty_issued, 0) as issued,
                (coalesce(i.qty_issued, 0) - a.qty_act) as qty_issued_bal,
                (CASE WHEN (coalesce(i.qty_issued, 0) - a.qty_act) < 0 THEN 'OPEN' ELSE 'CLOSED' END) as supply_type");
            $this->db->from('supply_sheets a');
            $this->db->join('item_rm c', 'a.item_rm_id = c.id');
            // $this->db->join('production_schedules e', 'a.item_fg_id = e.item_fg_id and a.workorder = e.workorder');
            $this->db->join("(SELECT request_no, item_rm_id, SUM(qty) as qty_issued FROM issued_material_details GROUP BY request_no, item_rm_id) i", "i.request_no = a.request_no and i.item_rm_id = c.id", "LEFT");
            $this->db->where('a.deleted', 0);
            // $this->db->where('e.period !=', '202410');
            // $this->db->select('a.*, b.number as item_number, b.name as item_name, b.uom');
            // $this->db->from('wip_balances a');
            // $this->db->join('item_rm b', 'a.item_rm_id = b.id');
            // $this->db->join('uom c', 'b.uom_id = c.id');
            // $this->db->where('a.deleted', 0);
            if (@count($filters) > 0) {
                foreach ($filters as $filter) {
                    if ($filter->field == "item_rm_number") {
                        $this->db->like("c.number", $filter->value);
                    } elseif ($filter->field == "item_rm_name") {
                        $this->db->like("c.name", $filter->value);
                    } elseif ($filter->field == "uom") {
                        $this->db->like("c.uom", $filter->value);
                    } elseif ($filter->field == "issued") {
                        $this->db->like("i.qty_issued", $filter->value);
                    } elseif ($filter->field == "supply_type") {
                        $this->db->like("(CASE WHEN (coalesce(i.qty_issued, 0) - a.qty_act) < 0 THEN 'OPEN' ELSE 'CLOSED' END)", $filter->value);
                    } else {
                        $this->db->like("a.". $filter->field, $filter->value);
                    }
                }
            }else{
                $this->db->like("a.created_date", date("Y-m-d"));
            }
            $this->db->group_by('a.request_no');
            $this->db->group_by('a.item_rm_id');
            $this->db->order_by('a.created_date', 'DESC');
            //$this->db->order_by('a.warehouse', 'DESC');
            //Total Data
            $totalRows = $this->db->count_all_results('', false);
            //Limit 1 - 10
            $this->db->limit($rows, $offset);
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
            $send   = $this->crud->create('wip_balances', $post);
            echo $send;
        } else {
            show_error("Cannot Process your request");
        }
    }
    //UPDATE DATA
    public function update()
    {
        if ($this->input->post()) {
            $id   = base64_decode($this->input->get('id'));
            $post = $this->input->post();
            $send = $this->crud->update('wip_balances', ["id" => $id], $post);
            echo $send;
        } else {
            show_error("Cannot Process your request");
        }
    }
    //DELETE DATA
    public function delete()
    {
        $data = $this->input->post();
        $send = $this->crud->delete('wip_balances', $data);
        echo $send;
    }
    //PRINT & EXCEL DATA
    public function print($option = "")
    {
        if ($option == "excel") {
            $format  = date("Ymd");
            header("Content-type: application/vnd-ms-excel");
            header("Content-Disposition: attachment; filename=wip_balances_$format.xls");
        }

        $supply_type  = base64_decode($this->input->get('supply_type'));
        $item_rm_id  = base64_decode($this->input->get('item_rm_id'));
        $item_rm_number  = base64_decode($this->input->get('item_rm_number'));
        $uom  = base64_decode($this->input->get('uom'));
        $request_no  = base64_decode($this->input->get('request_no'));
        $workorder  = base64_decode($this->input->get('workorder'));
        $qty_act  = base64_decode($this->input->get('qty_act'));
        $issued  = base64_decode($this->input->get('issued'));
        $qty_issued_bal  = base64_decode($this->input->get('qty_issued_bal'));
        $created_by  = base64_decode($this->input->get('created_by'));
        $created_date  = base64_decode($this->input->get('created_date'));
        $updated_by  = base64_decode($this->input->get('updated_by'));
        $updated_date  = base64_decode($this->input->get('updated_date'));

        //Config
        $this->db->select('*');
        $this->db->from('config');
        $config = $this->db->get()->row();

        // $this->db->select('a.*, b.number as item_number, b.name as item_name, b.uom');
        // $this->db->from('wip_balances a');
        // $this->db->join('item_rm b', 'a.item_rm_id = b.id');
        // $this->db->join('uom c', 'b.uom_id = c.id');
        // $this->db->where('a.deleted', 0);
        // $this->db->order_by('b.number', 'ASC');
        // $this->db->order_by('a.request_no', 'ASC');
        // $this->db->order_by('a.created_date', 'DESC');
        $this->db->select("a.*, 
            c.number as item_rm_number, 
            c.name as item_rm_name, 
            c.uom,
            (CASE WHEN (coalesce(i.qty_issued, 0) - a.qty_act) < 0 THEN 'OPEN' ELSE 'CLOSED' END) as supply_type,
            coalesce(i.qty_issued, 0) as issued,
            (coalesce(i.qty_issued, 0) - a.qty_act) as qty_issued_bal");
        $this->db->from('supply_sheets a');
        $this->db->join('item_rm c', 'a.item_rm_id = c.id');
        $this->db->join("(SELECT request_no, item_rm_id, SUM(qty) as qty_issued FROM issued_material_details GROUP BY request_no, item_rm_id) i", "i.request_no = a.request_no and i.item_rm_id = c.id", "LEFT");
        // $this->db->like("(CASE WHEN (coalesce(i.qty_issued, 0) - a.qty_act) < 0 THEN 'OPEN' ELSE 'CLOSED' END)", $supply_type);
        // $this->db->like('a.item_rm_id', $item_rm_id);
        // $this->db->like('c.number', $item_rm_number);
        // $this->db->like('c.uom', $uom);
        // $this->db->like('a.request_no', $request_no);
        // $this->db->like('a.workorder', $workorder);
        // $this->db->like('a.qty_act', $qty_act);
        // $this->db->like('coalesce(i.qty_issued, 0)', $issued);
        // $this->db->like('(coalesce(i.qty_issued, 0) - a.qty_act)', $qty_issued_bal);
        // $this->db->like('a.created_by', $created_by);
        // $this->db->like('a.created_date', $created_date);
        // $this->db->like('a.updated_by', $updated_by);
        // $this->db->like('a.updated_date', $updated_date);
        $this->db->group_by('a.request_no');
        $this->db->group_by('a.item_rm_id');
        $this->db->order_by('a.created_date', 'DESC');
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
                            <small>MASTER WIP BALANCE</small>
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
                <th>Status</th>
                <th>Part No EBWS</th>
                <th>Part No Supplier</th>
                <th>Description</th>
                <th>Kanban No</th>
                <th>Workorder</th>
                <th>Uom</th>
                <th>Need</th>
                <th>Issued</th>
                <th>Balance</th>
                <th>Created By</th>
                <th>Created Date</th>
            </tr>';
        $no = 1;
        foreach ($records as $data) {
            $html .= '<tr>
                    <td>' . $no . '</td>
                    <td>' . $data['supply_type'] . '</td>
                    <td style="mso-number-format:\@;">' . $data['item_rm_id'] . '</td>
                    <td style="mso-number-format:\@;">' . $data['item_rm_number'] . '</td>
                    <td style="mso-number-format:\@;">' . $data['item_rm_name'] . '</td>
                    <td>' . $data['request_no'] . '</td>
                    <td>' . $data['workorder'] . '</td>
                    <td>' . $data['uom'] . '</td>
                    <td>' . $data['qty_act'] . '</td>
                    <td>' . $data['issued'] . '</td>
                    <td>' . $data['qty_issued_bal'] . '</td>
                    <td>' . $data['created_by'] . '</td>
                    <td>' . $data['created_date'] . '</td>';
            $no++;
        }
        $html .= '</table></body></html>';
        echo $html;
    }
}
