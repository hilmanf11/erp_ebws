<?php
date_default_timezone_set("Asia/Bangkok");
defined('BASEPATH') or exit('No direct script access allowed');
class Wip_reports extends CI_Controller
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
        $this->form_validation->set_rules('item_rm_id', 'Item ID', 'required|min_length[1]|max_length[30]|is_unique[wip_report.item_rm_id]');
    }

    //HALAMAN UTAMA
    public function index()
    {
        if (empty($this->session->username)) {
            redirect('error_session');
        } elseif ($this->checkuserAccess($this->id_menu()) > 0) {
            $data['button'] = $this->getbutton($this->id_menu());
            $this->load->view('template/header', $data);
            $this->load->view('warehouse/wip_reports');
        } else {
            redirect('error_access');
        }
    }

    //GET DATATABLES
    public function datatables()
    {
        if ($this->input->post()) {
            $filter_from = $this->input->post('filter_from');
            $filter_to = $this->input->post('filter_to');

            //Select Query
            $this->db->select("a.id, a.number, a.name, a.uom, b.name as item_family_name, c.main_process, 
                COALESCE(d.qty_receipt, 0) as receipt, 
                COALESCE(e.qty_ng, 0) as qty_ng, 
                COALESCE(f.qty_scrap, 0) as qty_scrap,
                COALESCE(d.qty_fg, 0) as qty_fg,
                COALESCE(g.wip, 0) as wip,
                (COALESCE(g.wip, 0) + COALESCE(d.qty_receipt, 0) + COALESCE(e.qty_ng, 0) + COALESCE(f.qty_scrap, 0) - COALESCE(d.qty_fg, 0)) as balance");
            $this->db->from('item_rm a');
            $this->db->join('item_familys b', 'a.item_family_id = b.id');
            $this->db->join('bom c', 'a.id = c.item_rm_id');
            $this->db->join("(SELECT a.item_rm_id, COALESCE(SUM(b.qty), 0) AS qty_receipt, COALESCE(SUM(c.qty), 0) AS qty_fg
                FROM issued_materials a
                JOIN issued_material_details b ON a.item_rm_id = b.item_rm_id AND a.request_no = b.request_no
                LEFT JOIN wip_receipts c ON a.workorder = c.workorder AND a.item_fg_id = c.item_fg_id AND c.trans_date_to BETWEEN '$filter_from' AND '$filter_to' 
                WHERE b.created_date BETWEEN '$filter_from' AND '$filter_to' 
                GROUP BY a.item_rm_id) d", 'a.id = d.item_rm_id', 'left');
            $this->db->join("(SELECT item_rm_id, SUM(qty) as qty_ng FROM item_ng WHERE trans_date between '$filter_from' and '$filter_to' GROUP BY item_rm_id) e", 'a.id = e.item_rm_id', 'left');
            $this->db->join("(SELECT item_rm_id, SUM(qty) as qty_scrap FROM scraps WHERE trans_date between '$filter_from' and '$filter_to' GROUP BY item_rm_id) f", 'a.id = f.item_rm_id', 'left');
            $this->db->join("(SELECT item_rm_id, SUM(qty) as wip FROM sto_wip WHERE trans_date between '$filter_from' and '$filter_to' GROUP BY item_rm_id) g", 'a.id = g.item_rm_id', 'left');
            $this->db->where('a.item_category_id', "C01");
            $this->db->group_by('a.id');
            $this->db->group_by('c.main_process');
            $this->db->order_by('b.number', 'ASC');
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
}
