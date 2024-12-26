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

    public function getData()
    {
        if ($this->input->post()) {
            $this->dummy = $this->load->database('dummy', TRUE);

            $filter_from = $this->input->post('filter_from');
            $filter_to = $this->input->post('filter_to');
            $mpp = date("Ym", strtotime($filter_from));

            $sqlBom = $this->db->query("SELECT a.item_fg_id, a.main_process, a.composition, b.number_customer
                FROM bom a
                JOIN item_fg b ON a.item_fg_id = b.id
                GROUP BY a.item_fg_id");
            $boms = $sqlBom->result_array();
            
            $datas = [];
            foreach ($boms as $bom) {
                $assy_number = $bom['number_customer'];
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
                    WHERE kode_proses = '5' and assy_number = '$assy_number' and mpp = '$mpp' and tanggal_proses between '$filter_from' and '$filter_to' and status_repair = 'false' 
                    AND status_before IS NOT NULL
                    AND status_repair = 'f'
                    ORDER BY serial_number) z ) x");
                $rowQty = $sqlQty->row();
                $qty_scan = empty(@$rowQty->qty) ? 0 : @$rowQty->qty;

                if($qty_scan > 0){
                    $datas[] = array(
                        "created_by" => $this->session->username,
                        "created_date" => date("Y-m-d H:i:s"),
                        "item_fg_id" => $bom['item_fg_id'], 
                        "qty" => $qty_scan
                    );
                }
            }

            //Mapping Data
            $result['total'] = count($datas);
            $result = array_merge($result, $datas);
            echo json_encode($result);
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
                COALESCE(SUM(c.fg), 0) as fg,
                COALESCE(e.qty_ng, 0) as ng, 
                COALESCE(f.qty_scrap, 0) as scrap,
                COALESCE(g.wip, 0) as wip,
                (COALESCE(d.qty_receipt, 0) + COALESCE(e.qty_ng, 0) + COALESCE(f.qty_scrap, 0) + COALESCE(g.wip, 0) - COALESCE(SUM(c.fg), 0)) as balance");
            $this->db->from('item_rm a');
            $this->db->join('item_familys b', 'a.item_family_id = b.id');
            $this->db->join('(select a.item_rm_id, a.main_process, a.item_fg_id, (a.composition * b.qty) as fg from bom a JOIN wip_reports b ON a.item_fg_id = b.item_fg_id GROUP BY a.item_rm_id, a.item_fg_id) c', 'a.id = c.item_rm_id');
            $this->db->join("(SELECT a.item_rm_id, COALESCE(SUM(b.qty), 0) AS qty_receipt
                FROM issued_materials a
                JOIN (SELECT item_rm_id, request_no, SUM(qty) as qty FROM issued_material_details WHERE created_date BETWEEN '$filter_from' AND '$filter_to' GROUP BY request_no, item_rm_id) b ON b.request_no = a.request_no and b.item_rm_id = a.item_rm_id
                GROUP BY a.item_rm_id) d", 'a.id = d.item_rm_id');
            $this->db->join("(SELECT item_rm_id, SUM(qty) as qty_ng FROM scraps WHERE source = 'Vendor' and trans_date between '$filter_from' and '$filter_to' GROUP BY item_rm_id) e", 'a.id = e.item_rm_id', 'left');
            $this->db->join("(SELECT item_rm_id, SUM(qty) as qty_scrap FROM scraps WHERE source = 'User' and trans_date between '$filter_from' and '$filter_to' GROUP BY item_rm_id) f", 'a.id = f.item_rm_id', 'left');
            $this->db->join("(SELECT item_rm_id, SUM(qty) as wip FROM sto_wip WHERE trans_date between '$filter_from' and '$filter_to' GROUP BY item_rm_id) g", 'a.id = g.item_rm_id', 'left');
            $this->db->join("wip_reports h", 'c.item_fg_id = h.item_fg_id');
            $this->db->where('a.item_category_id', "C01");
            $this->db->group_by('a.id');
            $this->db->order_by('a.number', 'ASC');

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

    public function create()
    {   
        if ($this->input->post()) {
            $post = $this->input->post('data');

            $reads = $this->crud->reads("wip_reports", [], ["item_fg_id" => $post['item_fg_id']]);
            if(count($reads) > 0){
                $send = $this->db->update('wip_reports', $post, ["item_fg_id" => $post['item_fg_id']]);
                die(json_encode(array("title" => "Good Job", "message" => "Product No ".$post['item_fg_id']." Updated Successfuly", "theme" => "success")));
            }else{
                $send = $this->db->insert('wip_reports', $post);
                die(json_encode(array("title" => "Good Job", "message" => "Product No ".$post['item_fg_id']." Saved Successfuly", "theme" => "success")));
            }
        }
    }
}
