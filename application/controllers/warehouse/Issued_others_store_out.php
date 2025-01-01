<?php
date_default_timezone_set("Asia/Bangkok");
defined('BASEPATH') or exit('No direct script access allowed');
class Issued_others_store_out extends CI_Controller
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
        $this->form_validation->set_rules('item_rm_id', 'Item ID', 'required|min_length[1]|max_length[30]|is_unique[issued_others_store.item_rm_id]');
    }
    //HALAMAN UTAMA
    public function index()
    {
        if (empty($this->session->username)) {
            redirect('error_session');
        } elseif ($this->checkuserAccess($this->id_menu()) > 0) {
            $data['button'] = $this->getbutton($this->id_menu());
            $this->load->view('template/header', $data);
            $this->load->view('warehouse/issued_others_store_out');
        } else {
            redirect('error_access');
        }
    }
    //GET DATA
    public function reads()
    {
        $post = isset($_POST['q']) ? $_POST['q'] : "";
        $send = $this->crud->reads('issued_others_store', ["name" => $post]);
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
            $this->db->select("*, SUM(qty) as total_qty");
            $this->db->from('issued_others_store');
            if (@count($filters) > 0) {
                foreach ($filters as $filter) {
                    $this->db->like($filter->field, $filter->value);
                }
            }
            $this->db->group_by('request_no');
            $this->db->order_by('request_no', 'DESC');
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

    public function datatableDetails($request_no)
    {
        $request_no = base64_decode($request_no);

        //Select Query
        $this->db->select("a.*, b.number as item_rm_number, b.name as item_rm_name, b.uom");
        $this->db->from('issued_others_store a');
        $this->db->join('item_rm b', 'a.item_rm_id = b.id');
        $this->db->where('a.request_no', $request_no);
        $this->db->order_by('b.number', 'DESC');

        //Total Data
        $totalRows = $this->db->count_all_results('', false);
        //Get Data Array
        $records = $this->db->get()->result_array();
        //Mapping Data
        $result['total'] = $totalRows;
        $result = array_merge($result, ['rows' => $records]);
        echo json_encode($result);
    }

    //UPDATE DATA
    public function update()
    {
        if ($this->input->post()) {
            $item_rm_id   = $this->input->post('item_rm_id');
            $request_no   = $this->input->post('request_no');

            $post = $this->input->post();
            $send = $this->crud->update('issued_others_store', ["item_rm_id" => $item_rm_id, "request_no" => $request_no], $post);
            echo $send;
        } else {
            show_error("Cannot Process your request");
        }
    }

    //DELETE DATA
    public function delete()
    {
        $data = $this->input->post();
        $send = $this->crud->update('issued_others_store', $data, ["status" => 0, "reason" => ""]);

        echo $send;
    }
    //PRINT & EXCEL DATA
    public function print($option = "")
    {
        if ($option == "excel") {
            $format  = date("Ymd");
            header("Content-type: application/vnd-ms-excel");
            header("Content-Disposition: attachment; filename=issued_others_store_$format.xls");
        }

        //Config
        $this->db->select('*');
        $this->db->from('config');
        $config = $this->db->get()->row();

        $this->db->select("a.*, b.number as item_rm_number, b.name as item_rm_name, b.uom");
        $this->db->from('issued_others_store a');
        $this->db->join('item_rm b', 'a.item_rm_id = b.id');
        $this->db->order_by('a.request_no', 'DESC');
        $this->db->order_by('a.item_rm_id', 'ASC');
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
                            <small>ISSUED CONSUMABLE</small>
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
                <th>Request No</th>
                <th>Request Date</th>
                <th>Request Name</th>
                <th>Uom</th>
                <th>Stock</th>
                <th>Issued</th>
                <th>Balance</th>
                <th>Remarks</th>
                <th>Accepted By</th>
                <th>Accepted Date</th>
                <th>Reason</th>
            </tr>';
        $no = 1;
        foreach ($records as $data) {
            if ($data['status'] == 0) {
                $status = "OPEN";
            } elseif ($data['status'] == "1") {
                $status = "CLOSED";
            } else {
                $status = "CANCEL";
            }

            $html .= '<tr>
                        <td>' . $no . '</td>
                        <td>' . $status . '</td>
                        <td style="mso-number-format:\@;">' . $data['item_rm_id'] . '</td>
                        <td style="mso-number-format:\@;">' . $data['item_rm_number'] . '</td>
                        <td style="mso-number-format:\@;">' . $data['item_rm_name'] . '</td>
                        <td>' . $data['request_no'] . '</td>
                        <td>' . $data['trans_date'] . '</td>
                        <td>' . $data['request_name'] . '</td>
                        <td>' . $data['uom'] . '</td>
                        <td>' . $data['stock'] . '</td>
                        <td>' . $data['qty'] . '</td>
                        <td>' . $data['balance'] . '</td>
                        <td>' . $data['remarks'] . '</td>
                        <td>' . $data['out_by'] . '</td>
                        <td>' . $data['out_date'] . '</td>
                        <td>' . $data['reason'] . '</td>
                    </tr>';
            $no++;
        }
        $html .= '</table></body></html>';
        echo $html;
    }
}
