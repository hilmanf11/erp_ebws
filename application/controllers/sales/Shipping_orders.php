<?php
date_default_timezone_set("Asia/Bangkok");
defined('BASEPATH') or exit('No direct script access allowed');
class Shipping_orders extends CI_Controller
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
        $this->form_validation->set_rules('checksheet_label', 'Label No', 'required|min_length[1]|max_length[50]');
    }

    public function index()
    {
        if (empty($this->session->username)) {
            redirect('error_session');
        } elseif ($this->checkuserAccess($this->id_menu()) > 0) {
            $data['button'] = $this->getbutton($this->id_menu());
            $this->load->view('template/header', $data);
            $this->load->view('sales/shipping_orders');
        } else {
            redirect('error_access');
        }
    }

    public function getDeliveryOrders()
    {
        if ($this->input->get()) {
            $delivery_order_no = $this->input->get('delivery_order_no');

            $this->db->select('a.delivery_order_no, a.delivery_order_date, a.uom, a.sales_order_no, 
                a.trans_type, a.remarks, b.number_customer, b.number as item_fg_number, b.name as item_fg_name, 
                c.name as customer_name, a.qty_do as delivery, COALESCE(SUM(e.shipping), 0) as shipping, a.created_by, a.created_date');
            $this->db->from('delivery_orders a');
            $this->db->join('item_fg b', 'a.item_fg_id = b.id');
            $this->db->join('customers c', 'a.customer_id = c.id');
            $this->db->join("(SELECT delivery_order_no, c.item_fg_id, SUM(a.qty) as shipping 
                FROM shipping_orders a 
                JOIN scan_item_receipts_fg b on a.checksheet_label = b.checksheet_label 
                JOIN wip_receipts c on b.workorder = c.workorder
                WHERE a.delivery_order_no = '$delivery_order_no' 
                GROUP BY a.delivery_order_no, c.item_fg_id) e", 'a.delivery_order_no = e.delivery_order_no and a.item_fg_id = e.item_fg_id', 'left');
            $this->db->where('a.delivery_order_no', $delivery_order_no);
            $this->db->group_by('b.number');

            $totalRows = $this->db->count_all_results('', false);
            //Get Data Array
            $records = $this->db->get()->result_array();
            //Mapping Data
            $result['total'] = $totalRows;
            $result = array_merge($result, ['rows' => $records]);
            echo json_encode($result);
        }
    }

    public function getChecksheetLabel()
    {
        if ($this->input->post()) {
            $checksheet_label = $this->input->post('checksheet_label');

            $this->db->select("*");
            $this->db->from('scan_item_receipts_fg');
            $this->db->where('checksheet_label', $checksheet_label);
            $this->db->where('status', '0');
            $totalRows = $this->db->count_all_results('', false);
            $records = $this->db->get()->result_array();
            
            //Mapping Data
            $result['total'] = $totalRows;
            $result = array_merge($result, ['rows' => $records]);
            echo json_encode($result);
        }
    }

    public function create()
    {
        if ($this->input->post()) {
            if ($this->form_validation->run() == TRUE) {
                $post = $this->input->post();
                $delivery_order_no = $post['delivery_order_no'];
                $shipping_orders = $this->crud->read("shipping_orders", [], ["delivery_order_no" => $post['delivery_order_no'], "checksheet_label" => $post['checksheet_label']]);

                $this->db->select('a.qty_do, (a.qty_do - COALESCE(SUM(e.shipping), 0)) as shipping');
                $this->db->from('delivery_orders a');
                $this->db->join("(SELECT delivery_order_no, c.item_fg_id, SUM(a.qty) as shipping 
                    FROM shipping_orders a 
                    JOIN scan_item_receipts_fg b on a.checksheet_label = b.checksheet_label 
                    JOIN wip_receipts c on b.workorder = c.workorder
                    WHERE a.delivery_order_no = '$delivery_order_no' 
                    GROUP BY a.delivery_order_no, c.item_fg_id) e", 'a.delivery_order_no = e.delivery_order_no and a.item_fg_id = e.item_fg_id', 'left');
                $this->db->where('a.delivery_order_no', $delivery_order_no);
                $record = $this->db->get()->row();
                
                if(@$record->qty_do >= $post['qty']){
                    if (@$record->shipping > 0) {
                        if (!$shipping_orders) {
                            $send = $this->crud->create('shipping_orders', $post);
                            $this->crud->update('scan_item_receipts_fg', ["checksheet_label" => $post['checksheet_label']], ["status" => "1"]);
                            echo $send;
                        } else {
                            echo json_encode(array("title" => "Available", "message" => "Data Shipping Orders has been Scanning", "theme" => "error"));
                        }
                    } else {
                        echo json_encode(array("title" => "Not Match", "message" => "Qty DO and Shipping already Done", "theme" => "error"));
                    }
                }else{
                    echo json_encode(array("title" => "Not Match", "message" => "Qty DO must bigger when Shipping Qty", "theme" => "error"));
                }
            } else {
                show_error(validation_errors());
            }
        } else {
            show_error("Cannot Process your request");
        }
    }
}
