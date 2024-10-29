<?php
date_default_timezone_set("Asia/Bangkok");
defined('BASEPATH') or exit('No direct script access allowed');

class Delivery_confirm extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->helper('url');
        $this->load->helper(array('form', 'url'));
        $this->load->library('form_validation');
        $this->load->library('session');
        $this->load->model('crud');
        // $this->load->model('banshu');
        //$this->pg = $this->load->database('pg', TRUE);

        //Validasi Form
        $this->form_validation->set_rules('item_rm_id', 'Item ID', 'required|min_length[2]|max_length[30]|is_unique[purchase_confirm.item_rm_id]');
    }

    public function index()
    {
        if (empty($this->session->username)) {
            redirect('error_session');
        } elseif ($this->checkuserAccess($this->id_menu()) > 0) {
            $data['button'] = $this->getbutton($this->id_menu());
            $this->load->view('template/header', $data);
            $this->load->view('purchase/delivery_confirm');
        } else {
            redirect('error_access');
        }
    }

    public function readSupplier(){
        $post = isset($_POST['q']) ? $_POST['q'] : "";
        $data = $this->crud->query("SELECT DISTINCT b.id, b.number, b.name FROM purchase_confirm a JOIN suppliers b ON a.supplier_id = b.id WHERE a.status = 0 ORDER BY b.name asc");
        echo json_encode($data);
    }

    function readPono(){
        $post = isset($_POST['q']) ? $_POST['q'] : "";
        $supplier_id = base64_decode($this->input->get('supplier_id'));
        $datas = $this->crud->query("SELECT a.po_no, a.po_date, invoice_no, invoice_date, awb_no, awb_date FROM purchase_confirm a WHERE a.supplier_id = '$supplier_id' and (po_date like '%$post%' or po_no like '%$post%') GROUP BY a.po_date, a.po_no ASC");
        echo json_encode($datas);
    }

    public function readProducts($po_no){
        $post = isset($_POST['q']) ? $_POST['q'] : "";
        $po_no = base64_decode($po_no);

        $data = $this->crud->query("SELECT b.id, b.number, b.name, a.qty, b.uom, a.delivery_date, DATE_FORMAT(now(), '%Y-%m-%d') as today, COALESCE(c.delivery, 0) as delivery FROM purchase_orders a 
            JOIN item_rm b ON a.item_rm_id = b.id
            LEFT JOIN purchase_confirm c ON a.po_no = c.po_no and a.item_rm_id = c.item_rm_id and a.supplier_id = c.supplier_id
            WHERE a.po_no = '$po_no' and a.status = 0 and b.number LIKE '%$post%'
            GROUP BY a.item_rm_id ORDER BY b.number asc");
        echo json_encode($data);
    }

    public function filterSupplier(){
        $post = isset($_POST['q']) ? $_POST['q'] : "";
        $data = $this->crud->query("SELECT DISTINCT b.id, b.number, b.name FROM purchase_confirm a JOIN suppliers b ON a.supplier_id = b.id ORDER BY b.name asc");
        echo json_encode($data);
    }

    public function filterProdfam($supplier_id){
        $post = isset($_POST['q']) ? $_POST['q'] : "";
        $supplier_id = base64_decode($supplier_id);
        $data = $this->crud->query("SELECT DISTINCT c.id, c.number, c.name FROM purchase_confirm a JOIN item_rm b ON a.item_rm_id = b.id JOIN item_familys c ON b.item_family_id = c.id WHERE a.supplier_id = '$supplier_id' ORDER BY c.number asc");
        echo json_encode($data);
    }

    public function filterPo($supplier_id){
        $post = isset($_POST['q']) ? $_POST['q'] : "";
        $supplier_id = base64_decode($supplier_id);
        $data = $this->crud->query("SELECT DISTINCT po_no FROM purchase_confirm WHERE supplier_id = '$supplier_id' ORDER BY po_no asc");
        echo json_encode($data);
    }

    public function datatables()
    {
        if ($this->input->post()) {
            $filter_supplier = base64_decode($this->input->get('filter_supplier'));
            $filter_status = base64_decode($this->input->get('filter_status'));
            $filter_po_no = base64_decode($this->input->get('filter_po_no'));
            $filter_product_family = base64_decode($this->input->get('filter_product_family'));
            $filter_item_rm_id = base64_decode($this->input->get('filter_item_rm_id'));

            $page = $this->input->post('page');
            $rows = $this->input->post('rows');
            //Pagination 1-10
            $page   = isset($page) ? intval($page) : 1;
            $rows   = isset($rows) ? intval($rows) : 10;
            $offset = ($page - 1) * $rows;
            $result = array();
            //Select Query
            $this->db->select("a.*, b.name as supplier_name, c.number as item_rm_number, c.name as item_rm_name, d.name as item_family_name, '0' as receipt");
            $this->db->from('purchase_confirm a');
            $this->db->join('suppliers b', 'a.supplier_id = b.id');
            $this->db->join('item_rm c', 'a.item_rm_id = c.id');
            $this->db->join('item_familys d', 'c.item_family_id = d.id');
            $this->db->like('a.supplier_id', $filter_supplier);
            $this->db->like('a.po_no', $filter_po_no);
            $this->db->like('c.item_family_id', $filter_product_family);
            $this->db->like('a.item_rm_id', $filter_item_rm_id);
            $this->db->order_by('a.supplier_id', 'ASC');
            $this->db->order_by('a.delivery_no', 'ASC');
            $this->db->order_by('a.item_rm_id', 'ASC');
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

    // UPDATE DATA
    public function datatableUpdates()
    {
        if ($this->input->get()) {
            $delivery_no = base64_decode($this->input->get('delivery_no'));

            $this->db->select("a.*, b.name as supplier_name, c.number as item_rm_number, '0' as actual, (a.qty - a.delivery) as balance, c.name as item_rm_name, d.name as item_family_name");
            $this->db->from('purchase_confirm a');
            $this->db->join('suppliers b', 'a.supplier_id = b.id');
            $this->db->join('item_rm c', 'a.item_rm_id = c.id');
            $this->db->join('item_familys d', 'c.item_family_id = d.id');
            $this->db->where('a.delivery_no', $delivery_no);
            $records = $this->db->get()->result_array();

            echo json_encode($records);
        }
    }

    //UPLOAD IMAGE
    public function uploadAttachment($file_bf = ""){
        $file				= $_FILES['file']['name'];
        $extension			= explode('.', $file);
        $extension_end		= strtolower(end($extension));
        $size				= $_FILES['file']['size'];
        $temporary 			= $_FILES['file']['tmp_name'];
        $fileName           = time() . "." . $extension_end;

        if (in_array($extension_end, array('pdf','jpg','png','jpeg')) === true) {
            if ($size < 1000000) {
                if ($file != "") {
                    @unlink("assets/documents/delivery_confirm/" . base64_decode($file_bf));
                    @move_uploaded_file($temporary, 'assets/documents/delivery_confirm/' . $fileName);
                    echo json_encode(array('msg' => 'Upload Success', "file" => $fileName));
                }
            }else{
                echo json_encode(array('msg' => 'Your file size is too large, a maximum of 1 MB', 'file' => base64_decode($file_bf)));
            }
        }else{
            echo json_encode(array('msg' => 'error', 'text' =>  'Your file format is not accepted', 'file' => base64_decode($file_bf)));
        }
    }

    public function create()
    {
        if ($this->input->post()) {
            $post = $this->input->post();
            $id = $post['id'];
            $dataFinals = array(
                "supplier_id" => $post['supplier_id'],
                "delivery_no" => $post['delivery_no'],
                "invoice_no" => $post['invoice_no'],
                "invoice_date" => $post['invoice_date'],
                "awb_no" => $post['awb_no'],
                "awb_date" => $post['awb_date'],
                "attachment" => $post['attachment'],
                "po_no" => $post['po_no'],
                "po_date" => $post['po_date'],
                "item_rm_id" => $post['item_rm_id'],
                "uom" => $post['uom'],
                "eta" => $post['eta'],
                "etd" => $post['etd'],
                "qty" => $post['qty'],
                "delivery" => $post['delivery'],
            );
 
            if($id != ""){
                if($post['balance'] > 0){
                    $status = 0;
                }else{
                    $status = 1;
                }

                $send = $this->crud->update('purchase_confirm', ["id" => $id], ["delivery" => $post['delivery'], "awb_no" => $post['awb_no'], "awb_date" => $post['awb_date']]);
                $this->db->update('purchase_orders', ["status" => $status], ["po_no" => $post['po_no'], "item_rm_id" => $post['item_rm_id']]);
                echo $send;
            }else{
                if($post['balance'] > 0){
                    $status = 0;
                }else{
                    $status = 1;
                }

                $this->db->update('purchase_orders', ["status" => $status], ["po_no" => $post['po_no'], "item_rm_id" => $post['item_rm_id']]);
                $send = $this->crud->create('purchase_confirm', $dataFinals);
                echo $send;
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
            $send = $this->crud->update('purchase_confirm', ["id" => $id], $post);
            echo $send;
        } else {
            show_error("Cannot Process your request");
        }
    }

    public function delete()
    {
        $data = $this->input->post();
        $send = $this->crud->delete('purchase_confirm', $data);
        $this->db->update('purchase_orders', ["status" => 0], ["po_no" => $data['po_no'], "item_rm_id" => $data['item_rm_id']]);
        echo $send;
    }

    public function print($option = "")
    {
        if ($option == "excel") {
            $format  = date("Ymd");
            header("Content-type: application/vnd-ms-excel");
            header("Content-Disposition: attachment; filename=schedule_delivery_$format.xls");
        }

        //Config
        $this->db->select('*');
        $this->db->from('config');
        $config = $this->db->get()->row();

        $filter_supplier = base64_decode($this->input->get('filter_supplier'));
        $filter_status = base64_decode($this->input->get('filter_status'));
        $filter_po_no = base64_decode($this->input->get('filter_po_no'));
        $filter_product_family = base64_decode($this->input->get('filter_product_family'));
        $filter_item_rm_id = base64_decode($this->input->get('filter_item_rm_id'));

        $this->db->select('a.*, b.name as supplier_name, c.number as item_rm_number, c.name as item_rm_name, d.name as item_family_name');
        $this->db->from('purchase_confirm a');
        $this->db->join('suppliers b', 'a.supplier_id = b.id');
        $this->db->join('item_rm c', 'a.item_rm_id = c.id');
        $this->db->join('item_familys d', 'c.item_family_id = d.id');
        $this->db->like('a.supplier_id', $filter_supplier);
        $this->db->like('a.po_no', $filter_po_no);
        $this->db->like('c.item_family_id', $filter_product_family);
        $this->db->like('a.item_rm_id', $filter_item_rm_id);
        $this->db->order_by('a.supplier_id', 'ASC');
        $this->db->order_by('a.delivery_no', 'ASC');
        $this->db->order_by('a.item_rm_id', 'ASC');
        $records = $this->db->get()->result_array();

        $html = '<html><head><title>Print Data</title></head><style>body {font-family: Arial, Helvetica, sans-serif;}#customers {border-collapse: collapse;width: 100%;font-size: 12px;}#customers td, #customers th {border: 1px solid #ddd;padding: 2px;}#customers tr:nth-child(even){background-color: #f2f2f2;}#customers tr:hover {background-color: #ddd;}#customers th {padding-top: 2px;padding-bottom: 2px;text-align: left;color: black;}</style><body>
        <center>
            <div style="float: left; font-size: 12px; text-align: left;">
                <table style="width: 100%;">
                    <tr>
                        <td width="50" style="font-size: 12px; vertical-align: top; text-align: center; vertical-align:jus margin-right:10px;">
                            <img src="' . $config->logo . '" width="30">
                        </td>
                        <td style="font-size: 14px; text-align: left; margin:2px;">
                            <b>' . $config->name . '</b><br>
                            <small>DELIVERY CONFIRMATION</small>
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
                <th width="20">No</th>
                <th>Supplier Name</th>
                <th>Delivery No</th>
                <th>Invoice No</th>
                <th>PO No</th>
                <th>PO Date</th>
                <th>Part No EBWS</th>
                <th>Part No Supplier</th>
                <th>Description</th>
                <th>Product Family</th>
                <th>Uom</th>
                <th>Qty PO</th>
                <th>Plan Delivery</th>
                <th>ETD</th>
                <th>ETA</th>
            </tr>';
        $no = 1;
        foreach ($records as $data) {
            $html .= '  <tr>
                            <td>' . $no . '</td>
                            <td>' . $data['supplier_name'] . '</td>
                            <td>' . $data['delivery_no'] . '</td>
                            <td>' . $data['invoice_no'] . '</td>
                            <td>' . $data['po_no'] . '</td>
                            <td>' . $data['po_date'] . '</td>
                            <td style="mso-number-format:\@;">' . $data['item_rm_id'] . '</td>
                            <td style="mso-number-format:\@;">' . $data['item_rm_number'] . '</td>
                            <td>' . $data['item_rm_name'] . '</td>
                            <td>' . $data['item_family_name'] . '</td>
                            <td>' . $data['uom'] . '</td>
                            <td>' . $data['qty'] . '</td>
                            <td>' . $data['delivery'] . '</td>
                            <td>' . $data['etd'] . '</td>
                            <td>' . $data['eta'] . '</td>
                        </tr>';
            $no++;
        }

        $html .= '</table></body></html>';
        echo $html;
    }
}