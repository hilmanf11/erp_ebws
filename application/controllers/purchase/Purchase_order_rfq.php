<?php
date_default_timezone_set("Asia/Bangkok");
defined('BASEPATH') or exit('No direct script access allowed');
class purchase_order_rfq extends CI_Controller
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
        $this->form_validation->set_rules('item_number', 'Part No EBWS', 'required|min_length[1]|max_length[100]');
    }

    public function index()
    {
        if (empty($this->session->username)) {
            redirect('error_session');
        } elseif ($this->checkuserAccess($this->id_menu()) > 0) {
            $data['button'] = $this->getbutton($this->id_menu());
            $data['approval'] = $this->crud->read('signatures');
            $data['id_menu'] = $this->id_menu();

            $this->load->view('template/header', $data);
            $this->load->view('purchase/purchase_order_rfq');
        } else {
            redirect('error_access');
        }
    }

    public function reads()
    {
        $post = isset($_POST['q']) ? $_POST['q'] : "";
        $send = $this->crud->reads('purchase_order_rfq', ["name" => $post]);
        echo json_encode($send);
    }

    public function readItem()
    {
        $post = isset($_POST['q']) ? $_POST['q'] : "";

        $this->db->select('a.item_number, item_name');
        $this->db->from('purchase_request_rfq a');
        $this->db->like('a.item_number', $post);
        $this->db->or_like('a.item_name', $post);
        $this->db->order_by('a.item_number', 'asc');
        $records = $this->db->get()->result_object();
        echo json_encode($records);
    }
    
    public function readPono()
    {
        $post = isset($_POST['q']) ? $_POST['q'] : "";
        
        $this->db->select('a.po_no, a.po_date, d.name as po_name');
        $this->db->from('purchase_order_rfq a');
        $this->db->join('users d', 'a.created_by = d.username');
        $this->db->where('a.status', 0);
        $this->db->where("(a.approved_to = '' or a.approved_to is null)");
        $this->db->like('a.po_no', $post);
        $this->db->group_by('a.po_no');
        $this->db->order_by('a.created_date', 'desc');
        $records = $this->db->get()->result_object();
        echo json_encode($records);
    }

    public function readPrno()
    {   
        $this->db->select('a.request_no');
        $this->db->from('purchase_order_rfq a');
        $this->db->join('users d', 'a.created_by = d.username');
        $this->db->group_by('a.request_no');
        $this->db->order_by('a.request_no', 'desc');
        $records = $this->db->get()->result_object();
        echo json_encode($records);
    }

    public function readTotalPo()
    {
        $item_number = $this->input->post('item_number');
        $this->db->select('item_number, SUM(qty) as qty');
        $this->db->from('purchase_order_rfq');
        $this->db->where('deleted', 0);
        $this->db->where('status', 0);
        $this->db->where('item_number', $item_number);
        $this->db->group_by('item_number');
        $records = $this->db->get()->row();

        echo json_encode($records);
    }

    public function request_no($id_menu, $add = ""){
        $datenow = date("Y-m-d");
        $sql_menu = $this->db->query("SELECT * FROM menus_no WHERE menus_id = '$id_menu' and `status` = '0' and `start_date` <= '$datenow' and end_date >= '$datenow'");
        $row_menu = $sql_menu->row();

        if(@$row_menu->number == ""){
            //
        }else{
            $number = @$row_menu->number;
            $yearnow = date("y", strtotime($row_menu->start_date));
            $yearend = date("y", strtotime($row_menu->end_date));

            $whereDate = $number.$yearnow.$yearend."1";

            $sqlGetID	= $this->db->query("SELECT max(po_no) as kode FROM purchase_order_rfq WHERE po_no like '%$whereDate%'");
            $rowID = $sqlGetID->row();
            $kode = $rowID->kode;
            
            if ($kode == NULL) {
                $autoID = sprintf("%0".$row_menu->sequence."s", $kode + 1);
                $autoNo = $whereDate.$autoID;
            } else {
                $urutan = (int) substr($kode, -6);
                $urutan++;
                $autoID	= sprintf("%0".$row_menu->sequence."s", $urutan);
                $autoNo = $whereDate.$autoID;
            }

            if($add == ""){
                return $autoNo;
            }else{
                die(json_encode(array("code" => $autoNo)));
            }
        }
    }

    public function readTerm()
    {
        $po_no = $this->input->post('po_no');
        $send = $this->crud->read('purchase_order_rfq', [], ["po_no" => $po_no]);
        echo json_encode($send);
    }

    public function datatables()
    {
        if ($this->input->post()) {
            $filter_from = $this->input->get('filter_from');
            $filter_to   = $this->input->get('filter_to');
            $filter_po_no = $this->input->get('filter_po_no');
            $filter_pr_no = $this->input->get('filter_pr_no');
            $filter_item_no = $this->input->get('filter_item_no');
            $page = $this->input->post('page');
            $rows = $this->input->post('rows');

            //Pagination 1-10
            $page   = isset($page) ? intval($page) : 1;
            $rows   = isset($rows) ? intval($rows) : 10;
            $offset = ($page - 1) * $rows;
            $result = array();

            //Select Query
            $id = $_POST['id'];
            if ($id === "0") {
                //Select Query
                $this->db->select('a.po_no, a.request_no, a.currency, a.supplier,
                    a.po_date, 
                    SUM(a.mpq) as mpq, 
                    SUM(a.moq) as moq, 
                    SUM(a.leadtime) as leadtime, 
                    SUM(a.price) as price, 
                    c.total_status_close,
                    a.approved_by,
                    a.approved_date,
                    a.approved_to,
                    a.created_by,
                    a.created_date,
                    a.updated_by,
                    a.updated_date');
                $this->db->from('purchase_order_rfq a');
                $this->db->join('(SELECT po_no, COUNT(status) as total_status_close FROM purchase_order_rfq WHERE status = 1 GROUP BY po_no) c', 'a.po_no = c.po_no', 'left');
                $this->db->where('a.deleted', 0);
                if ($filter_from != "" or $filter_to != "") {
                    $this->db->where('a.po_date >=', $filter_from);
                    $this->db->where('a.po_date <=', $filter_to);
                }
                if($filter_po_no != ""){
                    $this->db->where('a.po_no', $filter_po_no);
                }
                if($filter_pr_no != ""){
                    $this->db->where('a.request_no', $filter_pr_no);
                }
                if($filter_item_no != ""){
                    $this->db->where('a.item_number', $filter_item_no);
                }
                $this->db->group_by('a.po_no');
                // $this->db->order_by('a.status', 'ASC');
                $this->db->order_by('a.po_no', 'DESC');
                //Total Data
                $totalRows = $this->db->count_all_results('', false);
                //Limit 1 - 10
                $this->db->limit($rows, $offset);
                //Get Data Array
                $records = $this->db->get()->result_array();
                //Mapping Data
                foreach ($records as $record) {
                    $arr[] = array(
                        "id" => $record['po_no'],
                        "po_no" => $record['po_no'],
                        "request_no" => $record['request_no'],
                        "po_date" => $record['po_date'],
                        "currency" => $record['currency'],
                        "supplier" => $record['supplier'],
                        "mpq" => $record['mpq'],
                        "moq" => $record['moq'],
                        "leadtime" => $record['leadtime'],
                        "price" => $record['price'],
                        "approved_by" => $record['approved_by'],
                        "approved_to" => $record['approved_to'],
                        "approved_date" => $record['approved_date'],
                        "created_by" => $record['created_by'],
                        "created_date" => $record['created_date'],
                        "updated_by" => $record['updated_by'],
                        "updated_date" => $record['updated_date'],
                        "state" => "closed",
                        "datatable" => 1
                    );
                }
                $result['total'] = $totalRows;
                $result = array_merge($result, ['rows' => @$arr]);
                echo json_encode($result);
            } else {
                $this->db->select('a.*, b.item_name, b.supplier');
                $this->db->from('purchase_order_rfq a');
                $this->db->join('purchase_request_rfq b', 'a.request_no = b.request_no and a.item_number = b.item_number', 'left');
                
                $this->db->where('a.deleted', 0);
                if ($filter_from != "" or $filter_to != "") {
                    $this->db->where('a.po_date >=', $filter_from);
                    $this->db->where('a.po_date <=', $filter_to);
                }
                if($filter_pr_no != ""){
                    $this->db->where('a.request_no', $filter_pr_no);
                }
                if($filter_item_no != ""){
                    $this->db->where('a.item_number', $filter_item_no);
                }
                $this->db->like('a.po_no', $id);
                $this->db->group_by('a.id');
                $this->db->order_by('a.status', 'ASC');
                $this->db->order_by('a.po_no', 'DESC');
                $records = $this->db->get()->result_array();
                echo json_encode($records);
            }
        }
    }

    public function uploadatt()
    {
        // Pastikan file disimpan dalam direktori yang diinginkan
        $uploadDir = 'assets/documents/purchase_order_rfq/';

        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            // Pastikan ada file yang diunggah dari permintaan
            if (isset($_FILES['file'])) {
                $file = $_FILES['file'];

                // Validasi ekstensi file yang diunggah
                $allowedExtensions = ['pdf', 'jpg', 'jpeg', 'png'];
                $fileExtension = strtolower(pathinfo($file['name'], PATHINFO_EXTENSION));

                if (!in_array($fileExtension, $allowedExtensions)) {
                    echo json_encode(['success' => false, 'message' => 'Only files with the extension .pdf, .jpg, or .png are allowed.']);
                    exit; // Menghentikan proses lebih lanjut jika ekstensi tidak valid
                }

                // Validasi ukuran file yang diunggah (maksimal 5MB)
                $maxFileSize = 2 * 1024 * 1024; // 5MB dalam bytes
                if ($file['size'] > $maxFileSize) {
                    echo json_encode(['success' => false, 'message' => 'Size File Maximal 2 Mb.']);
                    exit; // Menghentikan proses lebih lanjut jika ukuran terlalu besar
                }

                // Pastikan tidak ada error dalam proses upload
                if ($file['error'] === UPLOAD_ERR_OK) {
                    // Buat nama unik untuk file yang diunggah
                    $fileName = uniqid() . '_' . $file['name'];
                    $uploadPath = $uploadDir . $fileName;

                    // Pindahkan file dari temporary directory ke lokasi yang diinginkan
                    if (move_uploaded_file($file['tmp_name'], $uploadPath)) {
                        // File berhasil diunggah
                        echo json_encode(['success' => true, 'message' => 'File Upload Success.', 'filename' => $fileName]);
                    } else {
                        // Gagal menyimpan file
                        echo json_encode(['success' => false, 'message' => 'File Upload Failed.']);
                    }
                } else {
                    // Ada error dalam proses upload
                    echo json_encode(['success' => false, 'message' => 'Error while Upload.']);
                }
            } else {
                // File tidak ditemukan dalam permintaan
                echo json_encode(['success' => false, 'message' => 'File Not Found.']);
            }
        } else {
            // Metode request yang diperlukan adalah POST
            echo json_encode(['success' => false, 'message' => 'Metode request yang diperlukan adalah POST.']);
        }
    }

    public function create()
    {
        if ($this->input->post()) {
            $post = $this->input->post();
            $purchaseOrder = $this->crud->read('purchase_order_rfq', [], ["request_no" => $post['request_no'], "item_number" => $post['item_number']]);

            if(empty($purchaseOrder)){
                $send = $this->crud->create('purchase_order_rfq', $post);

                $this->db->where('request_no', $post['request_no']);
                $this->db->where('item_number', $post['item_number']);
                $this->db->update("purchase_request_rfq", ["status" => 1]);
                echo $send;
            }else{
                show_error();
            }
        } else {
            show_error("Cannot Process your request");
        }
    }

    public function update()
    {
        if ($this->input->post()) {
            $post = $this->input->post();
            $id = $this->input->post('id');

            if($id != ""){
                $purchase_orders = $this->crud->update('purchase_order_rfq', ["id" => $id], [
                    "mpq" => $post['mpq'],
                    "moq" => $post['moq'],
                    "leadtime" => $post['leadtime'],
                    "currency" => $post['currency'],
                    "price" => $post['price'],
                    "remarks" => $post['remarks']
                ]);
                
                echo $purchase_orders;
            }else{
                show_error("Cannot Process your request");
            }
        } else {
            show_error("Cannot Process your request");
        }
    }

    public function updateTerms()
    {
        if ($this->input->post()) {
            $post = $this->input->post();
            $send = $this->db->update('purchase_order_rfq', ["terms" => $post['terms']], ["po_no" => $post['po_no']]);
            echo json_encode(array("title" => "Good Job", "message" => "Update Temrs & Conditions Successfully", "theme" => "success"));
        } else {
            show_error("Cannot Process your request");
        }
    }

    public function update_approval()
    {
        if ($this->input->post()) {
            $post = $this->input->post();
            $send = $this->crud->update('signatures', [], $post);

            echo $send;
        } else {
            show_error("Cannot Process your request");
        }
    }

    public function delete()
    {
        $data = $this->input->post();
        $send = $this->crud->delete('purchase_order_rfq', $data);
        $this->db->update('purchase_request_rfq', ["status" => 0], ["request_no" => $data['request_no'], "item_number" => $data['item_number']]);
        echo $send;
    }
    
    public function print_po($po_no, $export = "")
    {
        $purchase_order_rfq_total = $this->crud->reads('purchase_order_rfq', [], ["po_no" => base64_decode($po_no)]);
        $purchase_order_rfq = $this->crud->read('purchase_order_rfq', [], ["po_no" => base64_decode($po_no)], "", "revision", "desc");
        $approval = $this->crud->read('approvals', [], ["table_name" => "purchase_order_rfq"]);

        $user_3 = $this->crud->read('users', [], ["username" => @$approval->user_approval_2]);
        $user_4 = $this->crud->read('users', [], ["username" => @$approval->user_approval_3]);
        
        $qr_user_3 = "";
        $qr_user_4 = "";
        
        if($purchase_order_rfq->approved == 3){
            $qr_user_3 = "src='" .base_url('assets/image/qrcode/' . @$user_3->name . '.png')."'";
        }elseif($purchase_order_rfq->approved == 4){
            $qr_user_3 = "src='" .base_url('assets/image/qrcode/' . @$user_3->name . '.png')."'";
            $qr_user_4 = "src='" .base_url('assets/image/qrcode/' . @$user_4->name . '.png')."'";
        }

        // $month_1 =  date('M Y', strtotime('+1 month', strtotime(@$purchase_order_rfq->po_date)));
        // $month_2 =  date('M Y', strtotime('+2 month', strtotime(@$purchase_order_rfq->po_date)));
        // $month_3 =  date('M Y', strtotime('+3 month', strtotime(@$purchase_order_rfq->po_date)));

        $config = $this->db->get('config')->row();

        //Config Page
        $rows = 20;
        $page = ceil(count($purchase_order_rfq_total) / $rows);
        //Generate QRcode
        // $this->createQrcode($purchase_order_rfq->po_no, "assets/image/qrcode/");

        $this->createQrcode(@$user_3->name, "assets/image/qrcode/");
        $this->createQrcode(@$user_4->name, "assets/image/qrcode/");

        $media = "@media screen {
                        .print {
                            display: none !important;
                        }
                    }
                    @media print {
                        .noprint {
                            display: none !important;
                        }
                    }";
        $media2 = ' <div style="margin:20%;" class="noprint">
                        <center>
                            <h1>Press CTRL + P for Print</h1>
                        </center>
                    </div>';
        

        $html = '<html>
                    <head>
                        <title>' . $purchase_order_rfq->po_no . '</title>
                        <link rel="icon" href="' . $config->favicon . '" type="image/png" sizes="16x16">
                    </head>
                    <style>
                        body {
                            font-family: Arial, Helvetica, sans-serif;
                        }
                        .customers {
                            border-collapse: collapse;
                            font-size: 12px;
                        }
                        .customers td, .customers th {
                            border: 1px solid black;padding: 2px;
                        }
                        .customers th {
                            padding-top: 2px;
                            padding-bottom: 2px;
                            text-align: center;color: black;
                        }
                        '.$media.'
                    </style>
                    <body>
                        '.$media2.'
                        <div class="print">';
        //Loop Page
        $no = 1;
        $hal = 1;
        $subtotal = 0;
        for ($i = 0; $i < $page; $i++) {
            $this->db->select('a.*, b.currency, b.type, b.state');
            $this->db->from('purchase_order_rfq a');
            $this->db->where('a.po_no', base64_decode($po_no));
            $this->db->order_by('a.id');
            $this->db->limit(20, ($i * 20));
            $records = $this->db->get()->result_array();

            $html .= '  <table style="width:100%;">
                            <tr>
                                <th width="10">
                                    <img src="' . $config->favicon . '" width="60" />
                                </th>
                                <td width="300" style="padding:10px;">
                                    <b style="font-size:14px;">' . $config->name . '</b><br>
                                    <span style="font-size:10px;">' . $config->address . '</span><br>
                                </td>
                                <th width="100" style="text-align:right;">
                                    
                                </th>
                            </tr>
                        </table>
                        <div style="border: 1px solid black; width:100%; float:left;">
                            <div style="padding:10px;">
                                <center>
                                    <br>
                                    <h3 style="margin:0;">REQUEST FOR QUOTATION</h3>
                                </center>
                                <br>
                                <div style="width:45%; float:left;">
                                    <table style="width:100%; font-size:11px; margin-bottom:10px;">
                                        <tr>
                                            <td width="20" style="vertical-align: top;"><b>To</b></td>
                                            <td width="5" style="vertical-align: top;">:</td>
                                            <td><b>' . @$supplier->name . '</b><br>'.@$supplier->address.'<br>GST No : '.@$supplier->gst.'</td>
                                        </tr>
                                    </table>
                                </div>
                                <div style="width:10%; float:left;"><br></div>
                                <div style="width:45%; float:left;">
                                    <table style="width:100%; font-size:11px; margin-bottom:10px;">
                                        <tr>
                                            <td width="50" style="vertical-align: top;"></td>
                                            <td width="30" style="vertical-align: top;"></td>
                                            <td>PO No : ' . $supplier->supplier_po . '<br>
                                                Del. Sch No : ' . $purchase_order_rfq->po_no . '<br>
                                                Date : ' . $purchase_order_rfq->po_date . '<br>
                                                Revision : ' . $purchase_order_rfq->revision . '<br><br>
                                                Factory / Shipping Address : <br>
                                                '.@$config->address2.'<br>
                                                GST No : '.@$config->gst_no.'
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                
                                <table class="customers" style="width:100%;">
                                    <tr>
                                        <th style="text-align:center;">No</th>
                                        <th style="text-align:center;">Part No Supplier</th>
                                        <th style="text-align:center;">Description</th>
                                        <th style="text-align:center;">MPQ</th>
                                        <th style="text-align:center;">MOQ</th>
                                        <th style="text-align:center;">Leadtime</th>
                                        <th style="text-align:center;">Currency</th>
                                        <th style="text-align:center;">Price</th>
                                    </tr>';
            $row = 0;
            foreach ($records as $record) {
                if(!empty($record['reason'])){
                    $styles = "background:#FFDD9E;";
                }else{
                    $styles = "";
                }
                
                $html .= '  <tr style="'.$styles.'">
                                <td  style="text-align:center;">' . $no . '</td>
                                <td>' . $record['item_number'] . '</td>
                                <td>' . $record['item_name'] . '</td>
                                <td>' . $record['mpq'] . '</td>
                                <td>' . $record['moq'] . '</td>
                                <td>' . $record['leadtime'] . '</td>
                                <td>' . $record['currency'] . '</td>
                                <td style="text-align:right;">' . number_format($record['price'], 4) . '</td>
                            </tr>';
                $row++;
                $no++;
            }
                $html .= '</table>';
            
            if (($i + 1) == $page) {
                $html .= '  <div style="width:100%">
                                <div style="width:70%; float:left;">
                                    <br><br>
                                    <div style="font-size:12px !important;">
                                        <b style="font-size:16px !important;">Term & Condition</b><br><br>
                                        '.@$purchase_order_rfq->terms.'
                                    </div>
                                </div>
                                <div style="width:30%; float:left; right: 50px;">
                                    <br><br><br>
                                    <table style="margin-top:20px; font-size:12px;">
                                        <tr>
                                            <th colspan="2" width="800" style="text-align:left;">'.$config->name.'</th>
                                        </tr>
                                        <tr>
                                            <th style="height:80px; text-align:left;"><img '.$qr_user_3.' width="80"/></th>
                                        </tr>
                                        <tr>
                                            <th style="height:20px; text-align:left;">Authorized Signatory <br>Vishal Sharma</th>
                                        </tr>
                                    </table>
                                    <br>
                                </div>
                            </div>
                        </div>
                    </div>';
            }else{
                $html .= "</div></div>";
            }

            if (($i + 1) != $page) {
                $html .= '<div style="page-break-after:always;"></div>';
            }
            $hal++;
        }
        
        $html .= '<script>window.print()</script>';
        die($html);
    }

    public function print($option = "")
    {
        if ($option == "excel") {
            $format  = date("Ymd");
            header("Content-type: application/vnd-ms-excel");
            header("Content-Disposition: attachment; filename=purchase_order_rfq_$format.xls");
        }
        $filter_from = $this->input->get('filter_from');
        $filter_to = $this->input->get('filter_to');
        $filter_po_no = $this->input->get('filter_po_no');
        $filter_pr_no = $this->input->get('filter_pr_no');
        $filter_item_no = $this->input->get('filter_item_no');

        //Config
        $this->db->select('*');
        $this->db->from('config');
        $config = $this->db->get()->row();

        $this->db->select('a.*');
        $this->db->from('purchase_order_rfq a');
        $this->db->where('a.deleted', 0);
        if ($filter_from != "" or $filter_to != "") {
            $this->db->where('a.po_date >=', $filter_from);
            $this->db->where('a.po_date <=', $filter_to);
        }
        $this->db->like('a.po_no', $filter_po_no);
        $this->db->like('a.request_no', $filter_pr_no);
        $this->db->like('a.item_number', $filter_item_no);
        $this->db->order_by('a.po_date', 'DESC');
        $records = $this->db->get()->result_array();
        
        $html = '<html><head><title>Print Data</title></head><style>body {font-family: Arial, Helvetica, sans-serif;}#customers {border-collapse: collapse;width: 100%;font-size: 12px;}#customers td, #customers th {border: 1px solid black;padding: 2px;}#customers tr:nth-child(even){background-color: #f2f2f2;}#customers tr:hover {background-color: black;}#customers th {padding-top: 2px;padding-bottom: 2px;text-align: center;color: black;}</style><body>
            <center>
                <div style="float: left; font-size: 12px; text-align: left;">
                    <table style="width: 100%;">
                        <tr>
                            <td width="50" style="font-size: 12px; vertical-align: top; text-align: center; vertical-align:jus margin-right:10px;">
                                <img src="' . $config->favicon . '" width="30">
                            </td>
                            <td style="font-size: 14px; text-align: left; margin:2px;">
                                <b>' . $config->name . '</b><br>
                                <small>PURCHASE ORDER SERVICE</small>
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
                    <th>Approved</th>
                    <th>Approved By</th>
                    <th>Approved Date</th>
                    <th>RFQ No</th>
                    <th>RFQ Date</th>
                    <th>Part No Supplier</th>
                    <th>MPQ</th>
                    <th>MOQ</th>
                    <th>Leadtime</th>
                    <th>Price</th>
                    <th>Currency</th>
                    <th>Remarks</th>
                    <th>Created By</th>
                    <th>Created Date</th>
                </tr>';
        $no = 1;
        foreach ($records as $data) {
            if($data['approved_to'] == ""){
                $approved = "APPROVED";
            }else{
                $approved = "CHECKING";
            }
            
            $html .= '<tr>
                        <td style="text-align:center">' . $no . '</td>
                        <td>' . $approved . '</td>
                        <td>' . $data['approved_by'] . '</td>
                        <td>' . $data['approved_date'] . '</td>
                        <td>' . $data['po_no'] . '</td>
                        <td>' . $data['po_date'] . '</td>
                        <td>' . $data['item_number'] . '</td>
                        <td>' . $data['mpq'] . '</td>
                        <td>' . $data['moq'] . '</td>
                        <td>' . $data['leadtime'] . '</td>
                        <td>' . $data['price'] . '</td>
                        <td>' . $data['currency'] . '</td>
                        <td>' . $data['remarks'] . '</td>
                        <td>' . $data['created_by'] . '</td>
                        <td>' . $data['created_date'] . '</td>
                    </tr>';
            $no++;
        }
        $html .= '</table></body></html>';
        echo $html;
    }
}