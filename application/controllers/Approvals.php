<?php
date_default_timezone_set("Asia/Bangkok");
defined('BASEPATH') or exit('No direct script access allowed');

class Approvals extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->helper('url');
        $this->load->helper(array('form', 'url'));
        $this->load->library('form_validation');
        $this->load->library('session');
        $this->load->model('crud');
    }

    public function approve()
    {
        $id = $this->input->post('id');
        $tablename = $this->input->post('tablename');
        $data = $this->crud->read($tablename, [], ["id" => $id]);
        $user = $this->crud->read('users', [], ["username" => $data->created_by]);
        $approval = $this->crud->read('approvals', [], ["table_name" => $tablename]);

        if ($data->approved == 1) {
            $users_id = @$approval->user_approval_2;
            $approved = 2;
        } elseif ($data->approved == 2) {
            $users_id = @$approval->user_approval_3;
            $approved = 3;
        } elseif ($data->approved == 3) {
            $users_id = @$approval->user_approval_4;
            $approved = 4;
        } elseif ($data->approved == 4) {
            $users_id = @$approval->user_approval_5;
            $approved = 5;
        } else {
            $users_id = "";
            $approved = 0;
        }

        $values = array(
            "approved_by" => $this->session->username,
            "approved_date" => date('Y-m-d H:i:s'),
            "approved_to" => $users_id,
            "approved" => $approved,
        );

        $send = $this->db->update($tablename, $values, ["id" => $id]);
        if ($send) {
            echo json_encode(array("title" => "Approved", "message" => "Data Approved Successfully", "theme" => "success"));
        } else {
            echo log_message('error', 'There is an error in your system or data');
        }
    }

    public function disapprove()
    {
        $id = $this->input->post('id');
        $tablename = $this->input->post('tablename');
        $read = $this->crud->read($tablename, [], ["id" => $id]);
        $data = json_decode($read->approved_data, false);

        /* Default */
        if(empty($data)){
            $send = $this->db->delete($tablename, ["id" => $id]);
        }else{
            $send = $this->db->update($tablename, $data, ["id" => $id]);
        }
        
        echo json_encode(array("title" => "Disapproved", "message" => "Data Disapproved Successfully", "theme" => "success"));
    }

    public function approvalCount()
    {
        $users = $this->crud->reads('users', [], ["approved_to" => $this->session->username], "", "", "", ["approved_to", "approved_by"]);
        $purchase_orders = $this->crud->reads('purchase_orders', [], ["approved_to" => $this->session->username], "", "", "", ["approved_to", "approved_by"]);
        $bom = $this->crud->reads('bom', [], ["approved_to" => $this->session->username], "", "", "", ["approved_to", "approved_by"]);
        $customer_items = $this->crud->reads('customer_items', [], ["approved_to" => $this->session->username], "", "", "", ["approved_to", "approved_by"]);
        $supplier_items = $this->crud->reads('supplier_items', [], ["approved_to" => $this->session->username], "", "", "", ["approved_to", "approved_by"]);
        $supplier_item_prices = $this->crud->reads('supplier_item_prices', [], ["approved_to" => $this->session->username], "", "", "", ["approved_to", "approved_by"]);
        $item_rm = $this->crud->reads('item_rm', [], ["approved_to" => $this->session->username], "", "", "", ["approved_to", "approved_by"]);
        $item_fg = $this->crud->reads('item_fg', [], ["approved_to" => $this->session->username], "", "", "", ["approved_to", "approved_by"]);
        // $stock_fg = $this->crud->reads('stock_fg', [], ["approved_to" => $this->session->username], "", "", "", ["approved_to", "approved_by"]);
        $stock_wip = $this->crud->reads('stock_wip', [], ["approved_to" => $this->session->username], "", "", "", ["approved_to", "approved_by"]);
        // $stock_so = $this->crud->reads('stock_so', [], ["approved_to" => $this->session->username], "", "", "", ["approved_to", "approved_by"]);
        // $os_so = $this->crud->reads('os_so', [], ["approved_to" => $this->session->username], "", "", "", ["approved_to", "approved_by"]);
        // $os_mpp = $this->crud->reads('os_mpp', [], ["approved_to" => $this->session->username], "", "", "", ["approved_to", "approved_by"]);
        $forecasts = $this->crud->reads('forecasts', [], ["approved_to" => $this->session->username], "", "", "", ["approved_to", "approved_by"]);
        $purchase_requests = $this->crud->reads('purchase_requests', [], ["approved_to" => $this->session->username], "", "", "", ["approved_to", "approved_by"]);

        $totalRows = (count($users) + 
            count($purchase_orders) + 
            count($bom) + 
            count($customer_items) + 
            count($supplier_items) + 
            count($supplier_item_prices) + 
            count($item_rm) + 
            count($item_fg) +
            // count($stock_fg) +
            count($stock_wip) +
            // count($stock_so) +
            // count($os_so) +
            // count($os_mpp) +
            count($purchase_requests) +
            count($forecasts)
        );

        if ($totalRows > 0) {
            echo '<span class="badge">' . $totalRows . '</span>';
        } else {
            echo '';
        }
    }

    public function approvalList()
    {
        //Users
        $users = $this->crud->reads('users', [], ["approved_to" => $this->session->username], "", "", "", ["approved_to", "approved_by"]);
        $purchase_orders = $this->crud->reads('purchase_orders', [], ["approved_to" => $this->session->username], "", "", "", ["approved_to", "approved_by"]);
        $boms = $this->crud->reads('bom', [], ["approved_to" => $this->session->username], "", "", "", ["approved_to", "approved_by"]);
        $customer_items = $this->crud->reads('customer_items', [], ["approved_to" => $this->session->username], "", "", "", ["approved_to", "approved_by"]);
        $supplier_items = $this->crud->reads('supplier_items', [], ["approved_to" => $this->session->username], "", "", "", ["approved_to", "approved_by"]);
        $supplier_item_prices = $this->crud->reads('supplier_item_prices', [], ["approved_to" => $this->session->username], "", "", "", ["approved_to", "approved_by"]);
        $item_rm = $this->crud->reads('item_rm', [], ["approved_to" => $this->session->username], "", "", "", ["approved_to", "approved_by"]);
        $item_fg = $this->crud->reads('item_fg', [], ["approved_to" => $this->session->username], "", "", "", ["approved_to", "approved_by"]);
        // $stock_fg = $this->crud->reads('stock_fg', [], ["approved_to" => $this->session->username], "", "", "", ["approved_to", "approved_by"]);
        $stock_wip = $this->crud->reads('stock_wip', [], ["approved_to" => $this->session->username], "", "", "", ["approved_to", "approved_by"]);
        // $stock_so = $this->crud->reads('stock_so', [], ["approved_to" => $this->session->username], "", "", "", ["approved_to", "approved_by"]);
        // $os_so = $this->crud->reads('os_so', [], ["approved_to" => $this->session->username], "", "", "", ["approved_to", "approved_by"]);
        // $os_mpp = $this->crud->reads('os_mpp', [], ["approved_to" => $this->session->username], "", "", "", ["approved_to", "approved_by"]);
        $forecasts = $this->crud->reads('forecasts', [], ["approved_to" => $this->session->username], "", "", "", ["approved_to", "approved_by"]);
        $purchase_requests = $this->crud->reads('purchase_requests', [], ["approved_to" => $this->session->username], "", "", "", ["approved_to", "approved_by"]);

        foreach ($users as $user) {
            $this->approvalMessage($user->approved_by, $user->approved_to, $user->created_by, "users");
        }

        foreach ($purchase_orders as $po) {
            $this->approvalMessage($po->approved_by, $po->approved_to, $po->created_by, "purchase_orders");
        }

        foreach ($customer_items as $customer_item) {
            $this->approvalMessage($customer_item->approved_by, $customer_item->approved_to, $customer_item->created_by, "customer_items");
        }

        foreach ($supplier_items as $supplier_item) {
            $this->approvalMessage($supplier_item->approved_by, $supplier_item->approved_to, $supplier_item->created_by, "supplier_items");
        }

        foreach ($supplier_item_prices as $supplier_item_price) {
            $this->approvalMessage($supplier_item_price->approved_by, $supplier_item_price->approved_to, $supplier_item_price->created_by, "supplier_item_prices");
        }

        foreach ($boms as $bom) {
            $this->approvalMessage($bom->approved_by, $bom->approved_to, $bom->created_by, "bom");
        }

        foreach ($item_rm as $rm) {
            $this->approvalMessage($rm->approved_by, $rm->approved_to, $rm->created_by, "item_rm");
        }

        foreach ($item_fg as $fg) {
            $this->approvalMessage($fg->approved_by, $fg->approved_to, $fg->created_by, "item_fg");
        }
        
        foreach ($forecasts as $forecast) {
            $this->approvalMessage($forecast->approved_by, $forecast->approved_to, $forecast->created_by, "forecasts");
        }

        foreach ($stock_wip as $wip) {
            $this->approvalMessage($wip->approved_by, $wip->approved_to, $wip->created_by, "stock_wip");
        }

        foreach ($purchase_requests as $purchase_request) {
            $this->approvalMessage($purchase_request->approved_by, $purchase_request->approved_to, $purchase_request->created_by, "purchase_requests");
        }
    }

    public function approvalMessage($approved_by, $approved_to, $created_by, $table)
    {
        $user = $this->crud->read('users', [], ["username" => $approved_by]);

        if (empty($user->avatar)) {
            $avatar = base_url('assets/image/users/default.png');
        } else {
            $avatar = $user->avatar;
        }

        $title = "APPROVAL ". strtoupper(str_replace('_', ' ', $table));

        $link = "approvalDetail('$table', '$approved_to', '$approved_by', '$title')";
        echo '  <li class="list-isi">
                    <a onclick="' . $link . '">
                        <table style="width: 100%;">
                            <tr>
                                <td>
                                    <div class="icon-container">
                                        <img src="' . $avatar . '" class="user-online" />
                                        <div class="status-circle"></div>
                                    </div>
                                </td>
                                <td style="padding-left: 10px;">
                                    <b>' . $user->name . '</b><br>
                                    <small>Sent a request to approve data <b>' . strtoupper(str_replace("_", " ", $table)) . '</b></small>
                                </td>
                            </tr>
                        </table>
                    </a>
                </li>';
    }

    public function users($approved_to, $approved_by){
        if (empty($this->session->username)) {
            redirect('error_session');
        } else {
            $data['approved_to'] = base64_decode($approved_to);
            $data['approved_by'] = base64_decode($approved_by);
            $data['table'] = "users";
            $this->load->view('template/header', $data);
            $this->load->view('approval/users');
        }
    }

    // public function stock_fg($approved_to, $approved_by){
    //     if (empty($this->session->username)) {
    //         redirect('error_session');
    //     } else {
    //         $data['approved_to'] = base64_decode($approved_to);
    //         $data['approved_by'] = base64_decode($approved_by);
    //         $data['table'] = "stock_fg";
    //         $this->load->view('template/header', $data);
    //         $this->load->view('approval/stock_fg');
    //     }
    // }

    public function stock_wip($approved_to, $approved_by){
        if (empty($this->session->username)) {
            redirect('error_session');
        } else {
            $data['approved_to'] = base64_decode($approved_to);
            $data['approved_by'] = base64_decode($approved_by);
            $data['table'] = "stock_wip";
            $this->load->view('template/header', $data);
            $this->load->view('approval/stock_wip');
        }
    }

    // public function stock_so($approved_to, $approved_by){
    //     if (empty($this->session->username)) {
    //         redirect('error_session');
    //     } else {
    //         $data['approved_to'] = base64_decode($approved_to);
    //         $data['approved_by'] = base64_decode($approved_by);
    //         $data['table'] = "stock_so";
    //         $this->load->view('template/header', $data);
    //         $this->load->view('approval/stock_so');
    //     }
    // }

    // public function os_so($approved_to, $approved_by){
    //     if (empty($this->session->username)) {
    //         redirect('error_session');
    //     } else {
    //         $data['approved_to'] = base64_decode($approved_to);
    //         $data['approved_by'] = base64_decode($approved_by);
    //         $data['table'] = "os_so";
    //         $this->load->view('template/header', $data);
    //         $this->load->view('approval/os_so');
    //     }
    // }

    // public function os_mpp($approved_to, $approved_by){
    //     if (empty($this->session->username)) {
    //         redirect('error_session');
    //     } else {
    //         $data['approved_to'] = base64_decode($approved_to);
    //         $data['approved_by'] = base64_decode($approved_by);
    //         $data['table'] = "os_mpp";
    //         $this->load->view('template/header', $data);
    //         $this->load->view('approval/os_mpp');
    //     }
    // }

    public function forecasts($approved_to, $approved_by){
        if (empty($this->session->username)) {
            redirect('error_session');
        } else {
            $data['approved_to'] = base64_decode($approved_to);
            $data['approved_by'] = base64_decode($approved_by);
            $data['table'] = "forecasts";
            $this->load->view('template/header', $data);
            $this->load->view('approval/forecasts');
        }
    }

    public function purchase_requests($approved_to, $approved_by){
        if (empty($this->session->username)) {
            redirect('error_session');
        } else {
            $data['approved_to'] = base64_decode($approved_to);
            $data['approved_by'] = base64_decode($approved_by);
            $data['table'] = "purchase_requests";
            $this->load->view('template/header', $data);
            $this->load->view('approval/purchase_requests');
        }
    }

    public function purchase_orders($approved_to, $approved_by){
        if (empty($this->session->username)) {
            redirect('error_session');
        } else {
            $data['approved_to'] = base64_decode($approved_to);
            $data['approved_by'] = base64_decode($approved_by);
            $data['table'] = "purchase_orders";
            $this->load->view('template/header', $data);
            $this->load->view('approval/purchase_orders');
        }
    }

    public function bom($approved_to, $approved_by){
        if (empty($this->session->username)) {
            redirect('error_session');
        } else {
            $data['approved_to'] = base64_decode($approved_to);
            $data['approved_by'] = base64_decode($approved_by);
            $data['table'] = "bom";
            $this->load->view('template/header', $data);
            $this->load->view('approval/bom');
        }
    }

    public function customer_items($approved_to, $approved_by){
        if (empty($this->session->username)) {
            redirect('error_session');
        } else {
            $data['approved_to'] = base64_decode($approved_to);
            $data['approved_by'] = base64_decode($approved_by);
            $data['table'] = "customer_items";
            $this->load->view('template/header', $data);
            $this->load->view('approval/customer_items');
        }
    }

    public function supplier_items($approved_to, $approved_by){
        if (empty($this->session->username)) {
            redirect('error_session');
        } else {
            $data['approved_to'] = base64_decode($approved_to);
            $data['approved_by'] = base64_decode($approved_by);
            $data['table'] = "supplier_items";
            $this->load->view('template/header', $data);
            $this->load->view('approval/supplier_items');
        }
    }

    public function item_rm($approved_to, $approved_by){
        if (empty($this->session->username)) {
            redirect('error_session');
        } else {
            $data['approved_to'] = base64_decode($approved_to);
            $data['approved_by'] = base64_decode($approved_by);
            $data['table'] = "item_rm";
            $this->load->view('template/header', $data);
            $this->load->view('approval/item_rm');
        }
    }

    public function item_fg($approved_to, $approved_by){
        if (empty($this->session->username)) {
            redirect('error_session');
        } else {
            $data['approved_to'] = base64_decode($approved_to);
            $data['approved_by'] = base64_decode($approved_by);
            $data['table'] = "item_fg";
            $this->load->view('template/header', $data);
            $this->load->view('approval/item_fg');
        }
    }

    public function supplier_item_prices($approved_to, $approved_by){
        if (empty($this->session->username)) {
            redirect('error_session');
        } else {
            $data['approved_to'] = base64_decode($approved_to);
            $data['approved_by'] = base64_decode($approved_by);
            $data['table'] = "supplier_item_prices";
            $this->load->view('template/header', $data);
            $this->load->view('approval/supplier_item_prices');
        }
    }

    public function approvalUsers($approved_to, $approved_by)
    {
        $approved_to = base64_decode($approved_to);
        $approved_by = base64_decode($approved_by);

        $this->db->select('*');
        $this->db->from('users');
        $this->db->where('approved_to', $approved_to);
        $this->db->where('approved_by', $approved_by);
        $this->db->order_by('created_date', 'DESC');
        $records = $this->db->get()->result_array();

        die(json_encode($records));
    }

    public function approvalStockFg($approved_to, $approved_by)
    {
        $approved_to = base64_decode($approved_to);
        $approved_by = base64_decode($approved_by);

        $this->db->select('a.*, b.number as item_fg_number, b.name as item_fg_name');
        $this->db->from('stock_fg a');
        $this->db->join('item_fg b', 'a.item_fg_id = b.id');
        $this->db->where('a.approved_to', $approved_to);
        $this->db->where('a.approved_by', $approved_by);
        $this->db->order_by('a.created_date', 'DESC');
        $records = $this->db->get()->result_array();

        die(json_encode($records));
    }

    public function approvalStockWip($approved_to, $approved_by)
    {
        $approved_to = base64_decode($approved_to);
        $approved_by = base64_decode($approved_by);

        $this->db->select('a.*, b.number as item_fg_number, b.name as item_fg_name');
        $this->db->from('stock_wip a');
        $this->db->join('item_fg b', 'a.item_fg_id = b.id');
        $this->db->where('a.approved_to', $approved_to);
        $this->db->where('a.approved_by', $approved_by);
        $this->db->order_by('a.created_date', 'DESC');
        $records = $this->db->get()->result_array();

        die(json_encode($records));
    }

    public function approvalStockSo($approved_to, $approved_by)
    {
        $approved_to = base64_decode($approved_to);
        $approved_by = base64_decode($approved_by);

        $this->db->select('a.*, b.number as item_fg_number, b.name as item_fg_name, c.name as customer_name');
        $this->db->from('stock_so a');
        $this->db->join('item_fg b', 'a.item_fg_id = b.id');
        $this->db->join('customers c', 'a.customer_id = c.id');
        $this->db->where('a.approved_to', $approved_to);
        $this->db->where('a.approved_by', $approved_by);
        $this->db->order_by('a.created_date', 'DESC');
        $records = $this->db->get()->result_array();

        die(json_encode($records));
    }

    public function approvalOsSo($approved_to, $approved_by)
    {
        $approved_to = base64_decode($approved_to);
        $approved_by = base64_decode($approved_by);

        $this->db->select('a.*, b.number as item_fg_number, b.name as item_fg_name, c.name as customer_name');
        $this->db->from('os_so a');
        $this->db->join('item_fg b', 'a.item_fg_id = b.id');
        $this->db->join('customers c', 'a.customer_id = c.id');
        $this->db->where('a.approved_to', $approved_to);
        $this->db->where('a.approved_by', $approved_by);
        $this->db->order_by('a.created_date', 'DESC');
        $records = $this->db->get()->result_array();

        die(json_encode($records));
    }

    public function approvalOsMpp($approved_to, $approved_by)
    {
        $approved_to = base64_decode($approved_to);
        $approved_by = base64_decode($approved_by);

        $this->db->select('a.*, b.number as item_fg_number, b.name as item_fg_name, c.name as customer_name');
        $this->db->from('os_mpp a');
        $this->db->join('item_fg b', 'a.item_fg_id = b.id');
        $this->db->join('customers c', 'a.customer_id = c.id');
        $this->db->where('a.approved_to', $approved_to);
        $this->db->where('a.approved_by', $approved_by);
        $this->db->order_by('a.created_date', 'DESC');
        $records = $this->db->get()->result_array();

        die(json_encode($records));
    }

    public function approvalForecasts($approved_to, $approved_by)
    {
        $approved_to = base64_decode($approved_to);
        $approved_by = base64_decode($approved_by);

        $this->db->select('a.*, b.number as item_fg_number, b.name as item_fg_name, c.name as customer_name');
        $this->db->from('forecasts a');
        $this->db->join('item_fg b', 'a.item_fg_id = b.id');
        $this->db->join('customers c', 'a.customer_id = c.id');
        $this->db->where('a.approved_to', $approved_to);
        $this->db->where('a.approved_by', $approved_by);
        $this->db->order_by('a.created_date', 'DESC');
        $records = $this->db->get()->result_array();

        die(json_encode($records));
    }

    public function approvalPurchaseRequests($approved_to, $approved_by)
    {
        $approved_to = base64_decode($approved_to);
        $approved_by = base64_decode($approved_by);

        $this->db->select('a.*, b.uom, b.number as item_rm_number, b.name as item_rm_name, c.name as supplier_name, d.name as item_family_name');
        $this->db->from('purchase_requests a');
        $this->db->join('item_rm b', 'a.item_rm_id = b.id');
        $this->db->join('suppliers c', 'a.supplier_id = c.id');
        $this->db->join('item_familys d', 'b.item_family_id = d.id');
        $this->db->where('a.approved_to', $approved_to);
        $this->db->where('a.approved_by', $approved_by);
        $this->db->order_by('a.created_date', 'DESC');
        $records = $this->db->get()->result_array();

        die(json_encode($records));
    }

    public function approvalPO($approved_to, $approved_by)
    {
        $approved_to = base64_decode($approved_to);
        $approved_by = base64_decode($approved_by);

        $this->db->select('a.id,a.po_no, a.request_no, a.total_dp,
                    a.po_date,
                    a.remarks,
                    b.number as item_number,
                    b.name as item_name,
                    c.name as item_family_name, 
                    d.name as supplier_name, 
                    d.currency, e.mpq, 
                    e.moq,
                    b.uom,
                    a.month_1,
                    a.month_2,
                    a.month_3,
                    a.discount,
                    d.currency, 
                    SUM(a.qty) as qty, 
                    SUM(a.price) as price, 
                    SUM(a.total) as total,
                    a.total_sub');
                $this->db->from('purchase_orders a');
                $this->db->join('item_rm b', 'a.item_rm_id = b.id');
                $this->db->join('item_familys c', 'b.item_family_id = c.id');
                $this->db->join('suppliers d', 'a.supplier_id = d.id');
                $this->db->join('supplier_items e', 'a.item_rm_id = e.item_rm_id and a.supplier_id = e.supplier_id');
                $this->db->join('(SELECT po_no, COUNT(status) as total_status_close FROM purchase_orders WHERE status = 1 GROUP BY po_no) g', 'a.po_no = g.po_no', 'left');
        $this->db->where('a.approved_to', $approved_to);
        $this->db->where('a.approved_by', $approved_by);
        $this->db->order_by('a.created_date', 'DESC');
        $records = $this->db->get()->result_array();

        die(json_encode($records));
    }

    public function approvalBom($approved_to, $approved_by)
    {
        $approved_to = base64_decode($approved_to);
        $approved_by = base64_decode($approved_by);

        $this->db->select('a.*, b.number as item_fg_number, b.name as item_fg_name, c.number as item_rm_number, c.name as item_rm_name, c.item_family_id as product_family, c.uom as uom, , d.name as product_family_name');
        $this->db->from('bom a');
        $this->db->join('item_fg b', 'a.item_fg_id = b.id');
        $this->db->join('item_rm c', 'a.item_rm_id = c.id');
        $this->db->join('item_familys d', 'c.item_family_id = d.id');
        $this->db->where('a.approved_to', $approved_to);
        $this->db->where('a.approved_by', $approved_by);
        $this->db->order_by('a.id', 'ASC');
        $records = $this->db->get()->result_array();

        die(json_encode($records));
    }

    public function approvalCustomerItems($approved_to, $approved_by)
    {
        $approved_to = base64_decode($approved_to);
        $approved_by = base64_decode($approved_by);

        $this->db->select('a.*, b.number as customer_number, b.name as customer_name, b.currency, c.number as item_fg_number, c.name as item_fg_name, c.number_customer as item_fg_customer');
        $this->db->from('customer_items a');
        $this->db->join('customers b', 'a.customer_id = b.id');
        $this->db->join('item_fg c', 'a.item_fg_id = c.id');
        $this->db->where('a.approved_to', $approved_to);
        $this->db->where('a.approved_by', $approved_by);
        $this->db->order_by('a.id', 'ASC');
        $records = $this->db->get()->result_array();

        die(json_encode($records));
    }

    public function approvalSupplierItems($approved_to, $approved_by)
    {
        $approved_to = base64_decode($approved_to);
        $approved_by = base64_decode($approved_by);

        $this->db->select('a.*, b.number as supplier_number, b.name as supplier_name, b.currency as supplier_currency, c.number as item_rm_number, c.name as item_rm_name, c.item_family_id as item_rm_family, d.name as item_family_name, e.price as price_before');
        $this->db->from('supplier_items a');
        $this->db->join('suppliers b', 'a.supplier_id = b.id');
        $this->db->join('item_rm c', 'a.item_rm_id = c.id');
        $this->db->join('item_familys d', 'c.item_family_id = d.id');
        $this->db->join("(SELECT * FROM supplier_item_histories ORDER BY id DESC LIMIT 1) e", "a.supplier_id = e.supplier_id and a.item_rm_id = e.item_rm_id", "left");
        $this->db->where('a.approved_to', $approved_to);
        $this->db->where('a.approved_by', $approved_by);
        $this->db->order_by('a.id', 'ASC');
        $records = $this->db->get()->result_array();

        die(json_encode($records));
    }

    public function approvalSupplierItemPrices($approved_to, $approved_by)
    {
        $approved_to = base64_decode($approved_to);
        $approved_by = base64_decode($approved_by);

        $this->db->select('a.*, b.number as supplier_number, b.name as supplier_name, b.currency as supplier_currency, c.number as item_rm_number, c.name as item_rm_name, c.item_family_id as item_rm_family, d.name as item_family_name');
        $this->db->from('supplier_item_prices a');
        $this->db->join('suppliers b', 'a.supplier_id = b.id');
        $this->db->join('item_rm c', 'a.item_rm_id = c.id');
        $this->db->join('item_familys d', 'c.item_family_id = d.id');
        $this->db->where('a.approved_to', $approved_to);
        $this->db->where('a.approved_by', $approved_by);
        $this->db->order_by('a.id', 'ASC');
        $records = $this->db->get()->result_array();

        die(json_encode($records));
    }

    public function approvalItemRm($approved_to, $approved_by)
    {
        $approved_to = base64_decode($approved_to);
        $approved_by = base64_decode($approved_by);

        $this->db->select('a.*, b.name as item_category_name, c.name as item_family_name, d.number as hsn_number, d.name as hsn_name');
        $this->db->from('item_rm a');
        $this->db->join('item_categories b', 'a.item_category_id = b.id');
        $this->db->join('item_familys c', 'a.item_family_id = c.id');
        $this->db->join('hsn d', 'a.hsn_code = d.number', 'left');
        $this->db->where('a.approved_to', $approved_to);
        $this->db->where('a.approved_by', $approved_by);
        $this->db->order_by('a.id', 'ASC');
        $records = $this->db->get()->result_array();

        die(json_encode($records));
    }

    public function approvalItemFg($approved_to, $approved_by){
        $approved_to = base64_decode($approved_to);
        $approved_by = base64_decode($approved_by);
        
        $this->db->select('a.*, b.number as hsn_number, b.name as hsn_name, count(c.item_fg_id) as total_mold, f.min, f.max');
        $this->db->from('item_fg a');
        $this->db->join('hsn b', 'a.hsn_code = b.number', 'left');
        $this->db->join('mold_items c', 'a.id = c.item_fg_id', 'left');
        $this->db->join('customer_items d', 'd.item_fg_id = a.id', 'left');
        $this->db->join('customers e', 'd.customer_id = e.id', 'left');
        $this->db->join('setting_stocks f', "e.type = f.kind AND f.item_category_id = 'C03'", 'left');
        $this->db->where('a.approved_to', $approved_to);
        $this->db->where('a.approved_by', $approved_by);
        $this->db->group_by('a.id');
        $this->db->order_by('a.id', 'ASC');
        $records = $this->db->get()->result_array();

        die(json_encode($records));
    }
}

