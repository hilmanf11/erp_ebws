<?php
error_reporting(0);
defined('BASEPATH') or exit('No direct script access allowed');

class Report_exceptions extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->helper('url');
        $this->load->helper(array('form', 'url'));
        $this->load->library('form_validation');
        $this->load->library('session');
        $this->load->model('crud');
        // $this->dummy = $this->load->database('dummy', TRUE);

        //Validasi Form
        $this->form_validation->set_rules('item_rm_id', 'Product No', 'required|min_length[2]|max_length[50]|is_unique[generate_mrp.item_rm_id]');
    }

    public function index()
    {
        if (empty($this->session->username)) {
            redirect('error_session');
        } elseif ($this->checkuserAccess($this->id_menu()) > 0) {
            $data['button'] = $this->getbutton($this->id_menu());
            $this->load->view('template/header', $data);
            $this->load->view('planning/report_exceptions');
        } else {
            redirect('error_access');
        }
    }

    public function checkMps()
    {
        $filter_month = base64_decode($this->input->get('filter_month'));
        $filter_year = base64_decode($this->input->get('filter_year'));
        $filter_revision = base64_decode($this->input->get('filter_revision'));

        //Select Query
        $this->db->select('*');
        $this->db->from('generate_mps_details');
        $this->db->where('p_month', $filter_month);
        $this->db->where('p_year', $filter_year);
        $this->db->like('revision', $filter_revision);
        $this->db->group_by('item_fg_id');
        $records = $this->db->get()->result_array();

        if (count($records) > 0) {
            echo json_encode(array("theme" => "success"));
        } else {
            echo json_encode(array("theme" => "error"));
        }
    }

    public function checkOspo()
    {
        $filter_month = base64_decode($this->input->get('filter_month'));
        $filter_year = base64_decode($this->input->get('filter_year'));
        $filter_revision = base64_decode($this->input->get('filter_revision'));
        $filter_cutoff = base64_decode($this->input->get('filter_cutoff'));

        //Select Query
        // $this->db->select('*');
        // $this->db->from('os_po');
        // $this->db->where("(approved_to = '' or approved_to is null)");
        // $this->db->where('p_month', $filter_month);
        // $this->db->where('p_year', $filter_year);
        // $this->db->like('revision', $filter_revision);
        // $this->db->like('revision', $filter_revision);
        // $this->db->group_by('item_rm_id');
        // $records = $this->db->get()->result_array();

        // $sql = $this->db->query("SELECT a.item_rm_id, b.po_no, SUM(a.qty) AS qty_po, COALESCE(b.qty_receipt, 0) AS qty_receipt, COALESCE(SUM(a.qty) - b.qty_receipt, 0) AS outstanding FROM purchase_orders a
        //     LEFT JOIN (SELECT po_no, item_rm_id, SUM(qty_receipt) AS qty_receipt FROM purchase_order_receipts GROUP BY po_no) b ON a.po_no = b.po_no AND a.item_rm_id = b.item_rm_id
        //     WHERE a.po_date <= '$filter_cutoff'
        //     GROUP BY a.item_rm_id, a.po_no");
        // $records = $sql->result_array();

        // if (count($records) > 0) {
        echo json_encode(array("theme" => "success"));
        // } else {
        //     echo json_encode(array("theme" => "error"));
        // }
    }

    public function checkWip()
    {
        $filter_month = base64_decode($this->input->get('filter_month'));
        $filter_year = base64_decode($this->input->get('filter_year'));
        $filter_revision = base64_decode($this->input->get('filter_revision'));
        $filter_cutoff = base64_decode($this->input->get('filter_cutoff'));

        //Select Query
        // $sql = $this->db->query("SELECT a.item_rm_id, COALESCE(SUM(a.qty_act) - SUM(c.qty), 0) AS qty
        //     FROM supply_sheets a
        //     LEFT JOIN issued_materials b ON a.item_rm_id = b.item_rm_id AND a.workorder = b.workorder
        //     LEFT JOIN issued_material_details c ON a.item_rm_id = c.item_rm_id AND b.request_no = c.request_no
        //     WHERE a.request_date >= '$filter_cutoff'
        //     GROUP BY a.item_rm_id");
        // HAVING (SUM(a.qty_act) - SUM(c.qty)) > 0
        // $records = $sql->result_array();

        // if (count($records) > 0) {
        echo json_encode(array("theme" => "success"));
        // } else {
        //     echo json_encode(array("theme" => "error"));
        // }
    }

    public function checkMpp()
    {
        $filter_month = base64_decode($this->input->get('filter_month'));
        $filter_year = base64_decode($this->input->get('filter_year'));
        $filter_revision = base64_decode($this->input->get('filter_revision'));
        $filter_cutoff = base64_decode($this->input->get('filter_cutoff'));

        //Select Query
        // $this->db->select('*');
        // $this->db->from('os_wo');
        // $this->db->where("(approved_to = '' or approved_to is null)");
        // $this->db->where('p_month', $filter_month);
        // $this->db->where('p_year', $filter_year);
        // $this->db->like('revision', $filter_revision);
        // $this->db->group_by('item_rm_id');
        // $records = $this->db->get()->result_array();

        // $sql = $this->db->query("SELECT item_rm_id, COALESCE(SUM(qty_act), 0) AS qty
        //     FROM supply_sheets
        //     WHERE request_date >= '$filter_cutoff' GROUP BY item_rm_id");
        // $records = $sql->result_array();

        // if (count($records) > 0) {
        echo json_encode(array("theme" => "success"));
        // } else {
        //     echo json_encode(array("theme" => "error"));
        // }
    }

    public function checkRm()
    {
        $filter_month = base64_decode($this->input->get('filter_month'));
        $filter_year = base64_decode($this->input->get('filter_year'));
        $filter_revision = base64_decode($this->input->get('filter_revision'));
        $filter_cutoff = base64_decode($this->input->get('filter_cutoff'));

        //Select Query
        // $this->db->select('*');
        // $this->db->from('stock_rm');
        // $this->db->where("(approved_to = '' or approved_to is null)");
        // $this->db->where('p_month', $filter_month);
        // $this->db->where('p_year', $filter_year);
        // $this->db->like('revision', $filter_revision);
        // $this->db->group_by('item_rm_id');
        // $records = $this->db->get()->result_array();

        $sql = $this->db->query("SELECT a.id, a.number, a.name, 
            COALESCE(b.qty_receipt, 0) AS qty_receipt, 
            COALESCE(c.qty_out, 0) AS qty_out, 
            COALESCE(d.qty_return, 0) AS qty_return, 
            COALESCE((b.qty_receipt + d.qty_return - c.qty_out), 0) AS qty_out
        FROM item_rm a
        LEFT JOIN (SELECT item_rm_id, SUM(qty_receipt) AS qty_receipt 
                FROM purchase_order_receipts 
                WHERE receipt_date <= '$filter_cutoff' 
                GROUP BY item_rm_id) b ON a.id = b.item_rm_id
        LEFT JOIN (SELECT item_rm_id, SUM(qty) AS qty_out
                FROM issued_material_details 
                WHERE DATE_FORMAT(created_date, '%Y-%m-%d') <= '$filter_cutoff' GROUP BY item_rm_id) c ON a.id = c.item_rm_id
        LEFT JOIN (SELECT item_rm_id, SUM(qty) AS qty_return
                FROM return_materials 
                WHERE DATE_FORMAT(return_date, '%Y-%m-%d') <= '$filter_cutoff' GROUP BY item_rm_id) d ON a.id = d.item_rm_id
        GROUP BY a.id");
        $records = $sql->result_array();

        if (count($records) > 0) {
            echo json_encode(array("theme" => "success"));
        } else {
            echo json_encode(array("theme" => "error"));
        }
    }

    public function checkSupply()
    {
        $filter_month = base64_decode($this->input->get('filter_month'));
        $filter_year = base64_decode($this->input->get('filter_year'));
        $filter_revision = base64_decode($this->input->get('filter_revision'));
        $filter_cutoff = base64_decode($this->input->get('filter_cutoff'));

        //Select Query
        // $sql = $this->db->query("SELECT a.item_rm_id, COALESCE(SUM(a.qty_act) - SUM(c.qty), 0) AS qty
        //     FROM supply_sheets a
        //     LEFT JOIN issued_materials b ON a.item_rm_id = b.item_rm_id AND a.workorder = b.workorder
        //     LEFT JOIN issued_material_details c ON a.item_rm_id = c.item_rm_id AND b.request_no = c.request_no
        //     WHERE a.request_date >= '$filter_cutoff'
        //     GROUP BY a.item_rm_id");
        // $records = $sql->result_array();
        // HAVING (SUM(a.qty_act) - SUM(c.qty)) < 0");

        // if (count($records) > 0) {
        echo json_encode(array("theme" => "success"));
        // } else {
        //     echo json_encode(array("theme" => "error"));
        // }
    }

    public function checkBom()
    {
        $query = $this->db->query("SELECT a.id, a.number as item_rm_number, a.name as item_rm_name, b.item_rm_id as item_bom, c.item_rm_id as item_supplier FROM item_rm a JOIN (select b.item_rm_id from generate_mps a JOIN bom b ON a.item_fg_id = b.item_fg_id GROUP BY b.item_rm_id) b ON a.id = b.item_rm_id LEFT JOIN supplier_items c ON a.id = c.item_rm_id WHERE a.item_category_id = 'C01' and (c.item_rm_id is null) GROUP BY a.id");
        $records = $query->result_array();

        if (count($records) > 0) {
            die(json_encode(array("status" => "NG")));
        } else {
            die(json_encode(array("status" => "OK")));
        }
    }

    public function downloadBom()
    {
        header("Content-type: application/vnd-ms-excel");
        header("Content-Disposition: attachment; filename=notfound_supplier_items_" . time() . ".xls");

        $query = $this->db->query("SELECT a.id as item_rm_id, a.number as item_rm_number, a.name as item_rm_name, b.item_rm_id as item_bom, c.item_rm_id as item_supplier FROM item_rm a JOIN (select b.item_rm_id from generate_mps a JOIN bom b ON a.item_fg_id = b.item_fg_id GROUP BY b.item_rm_id) b ON a.id = b.item_rm_id LEFT JOIN supplier_items c ON a.id = c.item_rm_id WHERE a.item_category_id = 'C01' and (c.item_rm_id is null) GROUP BY a.id");
        $records = $query->result_array();

        $html = '<html><head><title>Print Data</title></head><style>body {font-family: Arial, Helvetica, sans-serif;}#os_fg {border-collapse: collapse;width: 100%;font-size: 12px;}#os_fg td, #os_fg th {border: 1px solid #ddd;padding: 2px;}#os_fg tr:nth-child(even){background-color: #f2f2f2;}#os_fg tr:hover {background-color: #ddd;}#os_fg th {padding-top: 2px;padding-bottom: 2px;text-align: left;color: black;}</style><body>            
        <table id="os_fg" border="1">
            <tr>
                <th width="20">No</th>
                <th>Part No EBWS</th>
                <th>Part No Supplier</th>
                <th>Description</th>
            </tr>';
        $no = 1;
        foreach ($records as $data) {
            $html .= '<tr>
                        <td>' . $no . '</td>
                        <td style="mso-number-format:\@;">' . $data['item_rm_id'] . '</td>
                        <td style="mso-number-format:\@;">' . $data['item_rm_number'] . '</td>
                        <td style="mso-number-format:\@;">' . $data['item_rm_name'] . '</td>
                    </tr>';
            $no++;
        }
        $html .= '</table></body></html>';
        echo $html;
    }

    public function getDataMpp($filter_month, $filter_year, $filter_cutoff, $item_rm_id, $type)
    {

        $query = $this->db->query("SELECT z.item_rm_id,
            SUM(total_date_1) as date_1,
            SUM(total_date_2) as date_2,
            SUM(total_date_3) as date_3,
            SUM(total_date_4) as date_4,
            SUM(total_date_5) as date_5,
            SUM(total_date_6) as date_6,
            SUM(total_date_7) as date_7,
            SUM(total_date_8) as date_8,
            SUM(total_date_9) as date_9,
            SUM(total_date_10) as date_10,
            SUM(total_date_11) as date_11,
            SUM(total_date_12) as date_12,
            SUM(total_date_13) as date_13,
            SUM(total_date_14) as date_14,
            SUM(total_date_15) as date_15,
            SUM(total_date_16) as date_16,
            SUM(total_date_17) as date_17,
            SUM(total_date_18) as date_18,
            SUM(total_date_19) as date_19,
            SUM(total_date_20) as date_20,
            SUM(total_date_21) as date_21,
            SUM(total_date_22) as date_22,
            SUM(total_date_23) as date_23,
            SUM(total_date_24) as date_24,
            SUM(total_date_25) as date_25,
            SUM(total_date_26) as date_26,
            SUM(total_date_27) as date_27,
            SUM(total_date_28) as date_28,
            SUM(total_date_29) as date_29,
            SUM(total_date_30) as date_30,
            SUM(total_date_31) as date_31
        FROM (
            SELECT a.p_month, a.p_year, a.revision, a.item_fg_id, b.item_rm_id,
            (a.date_1 * b.composition) as total_date_1,
            (a.date_2 * b.composition) as total_date_2,
            (a.date_3 * b.composition) as total_date_3,
            (a.date_4 * b.composition) as total_date_4,
            (a.date_5 * b.composition) as total_date_5,
            (a.date_6 * b.composition) as total_date_6,
            (a.date_7 * b.composition) as total_date_7,
            (a.date_8 * b.composition) as total_date_8,
            (a.date_9 * b.composition) as total_date_9,
            (a.date_10 * b.composition) as total_date_10,
            (a.date_11 * b.composition) as total_date_11,
            (a.date_12 * b.composition) as total_date_12,
            (a.date_13 * b.composition) as total_date_13,
            (a.date_14 * b.composition) as total_date_14,
            (a.date_15 * b.composition) as total_date_15,
            (a.date_16 * b.composition) as total_date_16,
            (a.date_17 * b.composition) as total_date_17,
            (a.date_18 * b.composition) as total_date_18,
            (a.date_19 * b.composition) as total_date_19,
            (a.date_20 * b.composition) as total_date_20,
            (a.date_21 * b.composition) as total_date_21,
            (a.date_22 * b.composition) as total_date_22,
            (a.date_23 * b.composition) as total_date_23,
            (a.date_24 * b.composition) as total_date_24,
            (a.date_25 * b.composition) as total_date_25,
            (a.date_26 * b.composition) as total_date_26,
            (a.date_27 * b.composition) as total_date_27,
            (a.date_28 * b.composition) as total_date_28,
            (a.date_29 * b.composition) as total_date_29,
            (a.date_30 * b.composition) as total_date_30,
            (a.date_31 * b.composition) as total_date_31
        FROM generate_mpp a
        JOIN bom b ON a.item_fg_id = b.item_fg_id
        WHERE a.p_month = '$filter_month' and a.p_year = '$filter_year' and b.item_rm_id = '$item_rm_id'
        GROUP BY a.item_fg_id, b.item_rm_id
        ORDER BY a.item_fg_id, b.item_rm_id asc) z
        GROUP BY z.item_rm_id");
        $records = $query->row_array();

        if ($type == "NOW") {
            $mpp = 0;
            for ($i = 1; $i <= date("j", strtotime($filter_cutoff)); $i++) {
                $mpp += $records['date_' . $i];
            }
        } elseif ($type == "WO") {
            $mpp = 0;
            for ($i = date("j", strtotime($filter_cutoff)); $i <= 31; $i++) {
                $mpp += $records['date_' . $i];
            }
        } else {
            $mpp = 0;
            for ($i = 1; $i <= 31; $i++) {
                $mpp += $records['date_' . $i];
            }
        }

        return $mpp;
    }

    public function getDataMps()
    {
        if ($this->input->get()) {
            //Filter Data
            $filter_month = base64_decode($this->input->get('filter_month'));
            $filter_year = base64_decode($this->input->get('filter_year'));
            $filter_revision = base64_decode($this->input->get('filter_revision'));
            $filter_part_no = base64_decode($this->input->get('filter_part_no'));
            $filter_product_family = base64_decode($this->input->get('filter_product_family'));

            //Select Query
            $this->db->select('b.p_month, b.p_year, b.revision, 
                a.item_rm_id,
                b.ltpp_month2 as period, 
                SUM(b.prod_plan) as prodplan,
                a.composition as qpa, 
                ROUND(SUM(b.prod_plan * a.composition), 2) as qty');
            $this->db->from('bom a');
            $this->db->join('generate_mps_details b', 'a.item_fg_id = b.item_fg_id');
            $this->db->join('item_rm c', 'a.item_rm_id = c.id');
            $this->db->where('b.p_month', $filter_month);
            $this->db->where('b.p_year', $filter_year);
            $this->db->where('b.revision', $filter_revision);
            // $this->db->where('product_no', 'ZYM024-081C');
            // $this->db->where('prod_plan >', 0);
            if ($filter_product_family != "") {
                $this->db->where('c.item_family_id', $filter_product_family);
            }
            if ($filter_product_family != "") {
                $this->db->where('c.id', $filter_part_no);
            }
            $this->db->group_by('b.ltpp_month2');
            $this->db->group_by('a.item_rm_id');
            $this->db->having('SUM(b.prod_plan * a.composition) > 0');
            $this->db->order_by('a.item_rm_id', 'asc');
            $this->db->order_by('b.ltpp_month2', 'asc');
            $mpsDetails = $this->db->get()->result_array();

            $mpsDetails['total'] = @count($mpsDetails);
            die(json_encode($mpsDetails));
        } else {
            show_error("Cannot Process your request");
        }
    }

    public function getDataMrp()
    {
        if ($this->input->get()) {
            //Filter Data
            $filter_month = base64_decode($this->input->get('filter_month'));
            $filter_year = base64_decode($this->input->get('filter_year'));
            $filter_revision = base64_decode($this->input->get('filter_revision'));
            $filter_product_family = base64_decode($this->input->get('filter_product_family'));
            $filter_part_no = base64_decode($this->input->get('filter_part_no'));
            $filter_cutoff = base64_decode($this->input->get('filter_cutoff'));
            $month3 = date("Y-m-01", strtotime("-3 month", strtotime($filter_cutoff)));
            $month_3 = date("m", strtotime("-3 month", strtotime($filter_year . "-" . $filter_month . "-01")));
            $year_3 = date("Y", strtotime("-3 month", strtotime($filter_year . "-" . $filter_month . "-01")));
            $month_2 = date("m", strtotime("-2 month", strtotime($filter_year . "-" . $filter_month . "-01")));
            $year_2 = date("Y", strtotime("-2 month", strtotime($filter_year . "-" . $filter_month . "-01")));
            $month_1 = date("m", strtotime("-1 month", strtotime($filter_year . "-" . $filter_month . "-01")));
            $year_1 = date("Y", strtotime("-1 month", strtotime($filter_year . "-" . $filter_month . "-01")));

            $cutoffDate = date("j", strtotime($filter_cutoff));

            //Select Query
            $this->db->select('a.item_rm_id, b.supplier_id, b.share_order, b.safety_stock,
                coalesce(b.mpq, 0) as mpq, 
                coalesce(b.moq, 0) as moq, 
                h.type as supplier_type,
                coalesce((b.leadtime + b.transit), 0) as leadtime,
                coalesce(c.end_stock, 0) as qty_rm, 
                (CASE WHEN e.actual >= 0 THEN coalesce(e.actual, 0) ELSE 0 END) as qty_vendor,
                coalesce(f.actual, 0) as qty_issued');
            $this->db->from('generate_mrp a');
            $this->db->join('item_rm i', 'a.item_rm_id = i.id');
            $this->db->join('supplier_items b', 'a.item_rm_id = b.item_rm_id', 'left');
            $this->db->join("(SELECT
                a.id,
                a.number, 
                a.name, 
                b.name as prodfam, 
                a.uom, 
                COALESCE(0,0) as begin_stock,
                (COALESCE(SUM(c.qty_sto),0) + COALESCE(e.qty_receipt, 0)) as qty_in,
                f.qty as qty_out,
                ((COALESCE(SUM(c.qty_sto),0) + COALESCE(e.qty_receipt, 0) + COALESCE(g.return_qty, 0)) - COALESCE(f.qty, 0)) as end_stock
            FROM item_rm a 
            JOIN item_familys b ON a.item_family_id = b.id and b.number != '006'
            LEFT JOIN (SELECT a.item_rm_id, COALESCE(SUM(b.qty), 0) as qty_sto FROM os_rm a JOIN scan_item_receipts b ON a.id  = b.receipt_id WHERE a.trans_date <= '$filter_cutoff' GROUP BY item_rm_id) c ON a.id = c.item_rm_id
            LEFT JOIN (SELECT a.item_rm_id, COALESCE(SUM(b.qty), 0) as qty_receipt FROM purchase_order_receipts a JOIN scan_item_receipts b ON a.receipt_id  = b.receipt_id WHERE a.receipt_date <= '$filter_cutoff' GROUP BY item_rm_id) e ON a.id = e.item_rm_id
            LEFT JOIN (SELECT item_rm_id, COALESCE(SUM(qty), 0) as qty FROM issued_material_details WHERE DATE_FORMAT(created_date, '%Y-%m-%d') <= '$filter_cutoff' GROUP BY item_rm_id) f ON a.id = f.item_rm_id
            LEFT JOIN (SELECT a.item_rm_id, SUM(c.qty) as return_qty
                FROM return_materials a 
                JOIN return_material_labels b ON a.return_id = b.return_id
                JOIN scan_item_receipts c ON a.return_id = c.receipt_id and b.label_no = c.label_no
                WHERE a.return_date <= '$filter_cutoff'
                GROUP BY a.item_rm_id) g ON a.id = g.item_rm_id
            GROUP BY a.id
            ORDER BY a.number) c", 'a.item_rm_id = c.id', 'left');
            $this->db->join("(SELECT z.id, SUM(z.begin_stock) AS actual FROM (
                SELECT a.id, b.po_no, (COALESCE(SUM(b.qty), 0) - COALESCE(c.qty_receipt, 0)) AS begin_stock
                FROM item_rm a
                JOIN purchase_orders b ON a.id = b.item_rm_id
                LEFT JOIN (SELECT item_rm_id, po_no, SUM(qty_receipt) AS qty_receipt FROM purchase_order_receipts GROUP BY item_rm_id, po_no) c ON a.id = c.item_rm_id AND b.po_no = c.po_no
                WHERE b.status = 0
                GROUP BY a.id, b.po_no) z
                GROUP BY z.id) e", 'a.item_rm_id = e.id', 'left');
            $this->db->join("(SELECT item_rm_id, COALESCE(SUM(qty), 0) AS actual
                FROM issued_material_details
                WHERE created_date between '$month3' and '$filter_cutoff'
                GROUP BY item_rm_id) f", 'a.item_rm_id = f.item_rm_id', 'left');
            $this->db->join('suppliers h', 'b.supplier_id = h.id and h.status = 0');
            //$this->db->where('assy_no', 'ZYM024-081C');
            $this->db->where('a.status', 0);
            $this->db->where('a.p_month', $filter_month);
            $this->db->where('a.p_year', $filter_year);
            $this->db->where('a.revision', $filter_revision);
            $this->db->where('b.share_order >=', 0);
            if ($filter_product_family != "") {
                $this->db->where('i.item_family_id', $filter_product_family);
            }
            if ($filter_part_no != "") {
                $this->db->where('a.item_rm_id', $filter_part_no);
            }
            $this->db->group_by('a.item_rm_id');
            $this->db->group_by('b.supplier_id');
            $this->db->order_by('i.number', 'asc');
            $generates = $this->db->get()->result_array();

            foreach ($generates as $generate) {
                $this->db->select('item_rm_id, period, SUM(qty) as need');
                $this->db->from('generate_mrp');
                $this->db->where('item_rm_id', $generate['item_rm_id']);
                $this->db->where('p_month', $filter_month);
                $this->db->where('p_year', $filter_year);
                $this->db->where('revision', $filter_revision);
                $this->db->group_by('item_rm_id');
                $this->db->group_by('period');
                $this->db->order_by('period', 'asc');
                $periods = $this->db->get()->result_array();

                $mpp_m3 = $this->getDataMpp($month_3, $year_3, $filter_cutoff, $generate['item_rm_id'], "BF");
                $mpp_m2 = $this->getDataMpp($month_2, $year_2, $filter_cutoff, $generate['item_rm_id'], "BF");
                $mpp_m1 = $this->getDataMpp($month_1, $year_1, $filter_cutoff, $generate['item_rm_id'], "BF");
                $mpp = $this->getDataMpp($filter_month, $filter_year, $filter_cutoff, $generate['item_rm_id'], "NOW");
                $qty_wo = $this->getDataMpp($filter_month, $filter_year, $filter_cutoff, $generate['item_rm_id'], "WO");

                //WIP BANSHU
                $balance_wip = $this->crud->read("balance_wip", [], ["item_rm_id" => $generate['item_rm_id'], "p_month" => $filter_month, "p_year" => $filter_year]);

                $supply = ($mpp_m3 + $mpp_m2 + $mpp_m1 + $mpp + @$balance_wip->qty) - $generate['qty_issued'];
                if ($supply > 0) {
                    $qty_supply = round($supply);
                    $qty_wip = 0;
                } else {
                    $qty_supply = 0;
                    $qty_wip = abs(round($supply));
                }

                $total_stock = ($generate['qty_rm'] + $qty_wip + $generate['qty_vendor']);
                $total_wo = ($qty_supply + 0);

                $no = 1;
                $need_1 = 0;
                $need_2 = 0;
                $need_3 = 0;
                $need_4 = 0;
                $need_5 = 0;
                $need_6 = 0;
                $need_11 = 0;

                $balance_1 = 0;
                $balance_2 = 0;
                $balance_3 = 0;
                $balance_4 = 0;
                $balance_5 = 0;
                $balance_6 = 0;
                foreach ($periods as $period) {
                    $item_rm_id = $generate['item_rm_id'];

                    if ($no == 1) {
                        $need_1 += $period['need'];

                        if ($filter_revision == 0) {
                            $need_11 += $period['need'];
                        } else {
                            $need_11 += 0;
                        }

                        $no = 2;
                    } elseif ($no == 2) {
                        $need_2 += $period['need'];
                        $no = 3;
                    } elseif ($no == 3) {
                        $need_3 += $period['need'];
                        $no = 4;
                    } elseif ($no == 4) {
                        $need_4 += $period['need'];
                        $no = 5;
                    } elseif ($no == 5) {
                        $need_5 += $period['need'];
                        $no = 6;
                    } elseif ($no == 6) {
                        $need_6 += $period['need'];
                        $no = 1;
                    }
                }

                $balance_1 = ($total_stock - ($total_wo + $need_11));
                $balance_2 = ($balance_1 - $need_2);
                $balance_3 = ($balance_2 - $need_3);
                $balance_4 = ($balance_3 - $need_4);
                $balance_5 = ($balance_4 - $need_5);
                $balance_6 = ($balance_5 - $need_6);

                if (($generate['leadtime'] + $cutoffDate - 1) <= 30) {
                    if ($generate['supplier_type'] == "LOCAL") {
                        if ($balance_1 > 0) {
                            $total_need = 0;
                        } else {
                            $total_need = abs($balance_1);
                        }
                    } else {
                        if ($balance_2 > 0) {
                            $total_need = 0;
                        } else {
                            $total_need = abs($balance_2);
                        }
                    }
                } elseif (($generate['leadtime'] + $cutoffDate - 1) > 30 && ($generate['leadtime'] + $cutoffDate - 1) <= 60) {
                    if ($generate['supplier_type'] == "LOCAL") {
                        if ($balance_2 > 0) {
                            $total_need = 0;
                        } else {
                            $total_need = abs($balance_2);
                        }
                    } else {
                        if ($balance_3 > 0) {
                            $total_need = 0;
                        } else {
                            $total_need = abs($balance_3);
                        }
                    }
                } elseif (($generate['leadtime'] + $cutoffDate - 1) > 60 && ($generate['leadtime'] + $cutoffDate - 1) <= 90) {
                    if ($generate['supplier_type'] == "LOCAL") {
                        if ($balance_3 > 0) {
                            $total_need = 0;
                        } else {
                            $total_need = abs($balance_3);
                        }
                    } else {
                        if ($balance_4 > 0) {
                            $total_need = 0;
                        } else {
                            $total_need = abs($balance_4);
                        }
                    }
                } elseif (($generate['leadtime'] + $cutoffDate - 1) > 90 && ($generate['leadtime'] + $cutoffDate - 1) <= 120) {
                    if ($generate['supplier_type'] == "LOCAL") {
                        if ($balance_4 > 0) {
                            $total_need = 0;
                        } else {
                            $total_need = abs($balance_4);
                        }
                    } else {
                        if ($balance_5 > 0) {
                            $total_need = 0;
                        } else {
                            $total_need = abs($balance_5);
                        }
                    }
                } elseif (($generate['leadtime'] + $cutoffDate - 1) > 120 and ($generate['leadtime'] + $cutoffDate - 1) <= 150) {
                    if ($generate['supplier_type'] == "LOCAL") {
                        if ($balance_5 > 0) {
                            $total_need = 0;
                        } else {
                            $total_need = abs($balance_5);
                        }
                    } else {
                        if ($balance_6 > 0) {
                            $total_need = 0;
                        } else {
                            $total_need = abs($balance_6);
                        }
                    }
                } else {
                    if ($balance_6 > 0) {
                        $total_need = 0;
                    } else {
                        $total_need = abs($balance_6);
                    }
                }

                $leadtimeMonth = ceil(($generate['leadtime'] + $cutoffDate - 1) / 30);

                switch ($leadtimeMonth) {
                    case 6:
                        $avg_need = (($need_1 + $need_2 + $need_3 + $need_4 + $need_5 + $need_6) / 6);
                        $avg_balance = ($balance_6 - $avg_need);
                        if ($avg_balance > 0) {
                            $total_need = 0;
                        } else {
                            $total_need = abs($avg_balance);
                        }
                        break;
                    case 7:
                        $avg_need = (($need_1 + $need_2 + $need_3 + $need_4 + $need_5 + $need_6) / 6);
                        $avg_balance = ($balance_6 - $avg_need);
                        if ($avg_balance > 0) {
                            $total_need = 0;
                        } else {
                            $total_need = abs($avg_balance);
                        }
                        break;
                    case 8:
                        $avg_need = ((($need_1 + $need_2 + $need_3 + $need_4 + $need_5 + $need_6) / 6) * 2);
                        $avg_balance = ($balance_6 - $avg_need);
                        if ($avg_balance > 0) {
                            $total_need = 0;
                        } else {
                            $total_need = abs($avg_balance);
                        }
                        break;
                    case 9:
                        $avg_need = ((($need_1 + $need_2 + $need_3 + $need_4 + $need_5 + $need_6) / 6) * 3);
                        $avg_balance = ($balance_6 - $avg_need);
                        if ($avg_balance > 0) {
                            $total_need = 0;
                        } else {
                            $total_need = abs($avg_balance);
                        }
                        break;
                    case 10:
                        $avg_need = ((($need_1 + $need_2 + $need_3 + $need_4 + $need_5 + $need_6) / 6) * 4);
                        $avg_balance = ($balance_6 - $avg_need);
                        if ($avg_balance > 0) {
                            $total_need = 0;
                        } else {
                            $total_need = abs($avg_balance);
                        }
                        break;
                    case 11:
                        $avg_need = ((($need_1 + $need_2 + $need_3 + $need_4 + $need_5 + $need_6) / 6) * 5);
                        $avg_balance = ($balance_6 - $avg_need);
                        if ($avg_balance > 0) {
                            $total_need = 0;
                        } else {
                            $total_need = abs($avg_balance);
                        }
                        break;
                    case 12:
                        $avg_need = ((($need_1 + $need_2 + $need_3 + $need_4 + $need_5 + $need_6) / 6) * 6);
                        $avg_balance = ($balance_6 - $avg_need);
                        if ($avg_balance > 0) {
                            $total_need = 0;
                        } else {
                            $total_need = abs($avg_balance);
                        }
                        break;
                    default:
                        $avg_need = 0;
                        $avg_balance = ($balance_6 - $avg_need);
                }

                $share_order_qty = ($total_need * ($generate['share_order'] / 100));
                $safety_stock = round($share_order_qty * ($generate['safety_stock'] / 100));
                $total_need = ($share_order_qty + $safety_stock);

                if ($total_need > 0 && $generate['moq'] > 0) {
                    if ($total_need > $generate['moq']) {
                        $purchase_order = (ceil($total_need / $generate['mpq']) * $generate['mpq']);
                    } else {
                        $purchase_order = (ceil($total_need / $generate['moq']) * $generate['moq']);
                    }
                } else {
                    $purchase_order = 0;
                }

                $arr[] = array(
                    "p_month" => $filter_month,
                    "p_year" => $filter_year,
                    "revision" => $filter_revision,
                    "cutoff" => $filter_cutoff . " " . date("H:i:s"),
                    "item_rm_id" => $generate['item_rm_id'],
                    "supplier_id" => $generate['supplier_id'],
                    "share_order" => $generate['share_order'],
                    "mpq" => $generate['mpq'],
                    "moq" => $generate['moq'],
                    "leadtime" => $generate['leadtime'],
                    "qty_rm" => $generate['qty_rm'],
                    "qty_wip" => $qty_wip,
                    "qty_vendor" => $generate['qty_vendor'],
                    "total_stock" => $total_stock,
                    "qty_supply" => $qty_supply,
                    // "qty_wo" => $qty_wo,
                    "qty_wo" => 0,
                    "total_wo" => $total_wo,
                    "need_1" => $need_1,
                    "need_2" => $need_2,
                    "need_3" => $need_3,
                    "need_4" => $need_4,
                    "need_5" => $need_5,
                    "need_6" => $need_6,
                    "balance_1" => $balance_1,
                    "balance_2" => $balance_2,
                    "balance_3" => $balance_3,
                    "balance_4" => $balance_4,
                    "balance_5" => $balance_5,
                    "balance_6" => $balance_6,
                    "avg_need" => $avg_need,
                    "avg_balance" => $avg_balance,
                    "safety_stock" => $safety_stock,
                    "safety_stock_persen" => $generate['safety_stock'],
                    "share_order_qty" => $share_order_qty,
                    "total_need" => $total_need,
                    "purchase_order" => $purchase_order,
                );
            }

            $arr['total'] = @count($arr);
            die(json_encode($arr));
        } else {
            show_error("Cannot Process your request");
        }
    }

    public function getDataMrpFinals()
    {
        if ($this->input->get()) {
            //Filter Data
            $filter_month = base64_decode($this->input->get('filter_month'));
            $filter_year = base64_decode($this->input->get('filter_year'));
            $filter_revision = base64_decode($this->input->get('filter_revision'));
            $filter_product_family = base64_decode($this->input->get('filter_product_family'));
            $filter_part_no = base64_decode($this->input->get('filter_part_no'));

            //Select Query
            $this->db->select('a.*, b.item_family_id');
            $this->db->from('generate_mrp_finals a');
            $this->db->join('item_rm b', 'a.item_rm_id = b.id');
            $this->db->join('item_familys c', 'b.item_family_id = c.id');
            $this->db->where('a.p_month', $filter_month);
            $this->db->where('a.p_year', $filter_year);
            $this->db->where('a.revision', $filter_revision);
            if ($filter_product_family != "") {
                $this->db->where('b.item_family_id', $filter_product_family);
            }
            if ($filter_part_no != "") {
                $this->db->where('a.item_rm_id', $filter_part_no);
            }
            $this->db->order_by('c.name', 'asc');
            $this->db->order_by('a.`total_need`', 'asc');
            $generates = $this->db->get()->result_array();

            $total_need = 0;
            $product_family = "";
            $arr = array();
            foreach ($generates as $generate) {
                if ($generate['item_family_id'] != $product_family) {
                    $total_need = $generate['total_need'];
                } else {
                    $total_need += $generate['total_need'];
                }

                $this->db->select('c.number, SUM(a.total_need) as total');
                $this->db->from('generate_mrp_finals a');
                $this->db->join('item_rm b', 'a.item_rm_id = b.id');
                $this->db->join('item_familys c', 'b.item_family_id = c.id');
                $this->db->where('a.p_month', $filter_month);
                $this->db->where('a.p_year', $filter_year);
                $this->db->where('a.revision', $filter_revision);
                $this->db->where('b.item_family_id', $generate['item_family_id']);
                $this->db->group_by('b.item_family_id');
                $mrp = $this->db->get()->row();

                if (@$total_need > 0 || @$mrp->total > 0) {
                    $composition = round(($total_need / @$mrp->total) * 100);
                } else {
                    $composition = 0;
                }

                $this->db->select('*');
                $this->db->from('safety_stock');
                $this->db->where("start <= '$composition' and ending >= '$composition'");
                $safety_stock = $this->db->get()->row();

                $arr[] = array(
                    "p_month" => $filter_month,
                    "p_year" => $filter_year,
                    "revision" => $filter_revision,
                    "item_rm_id" => $generate['item_rm_id'],
                    "supplier_id" => $generate['supplier_id'],
                    "need" => $generate['total_need'],
                    "total" => @$mrp->total,
                    "composition" => $composition,
                    "class" => $safety_stock->name,
                    "safety" => $safety_stock->safety,
                    "safety_stock" => round($generate['total_need'] * (@$safety_stock->safety / 100)),
                );

                $product_family = $generate['item_family_id'];
            }

            $arr['total'] = @count($arr);
            die(json_encode($arr));
        }
    }

    public function create()
    {
        if ($this->input->post()) {
            $post = $this->input->post('data');
            $records = $this->crud->reads('generate_mrp', [], [
                "p_month" => $post['p_month'],
                "p_year" => $post['p_year'],
                "revision" => $post['revision'],
                "period" => $post['period'],
                "item_rm_id" => $post['item_rm_id']
            ]);

            if (count($records) > 0) {
                $send = $this->crud->update('generate_mrp', [
                    "p_month" => $post['p_month'],
                    "p_year" => $post['p_year'],
                    "revision" => $post['revision'],
                    "period" => $post['period'],
                    "item_rm_id" => $post['item_rm_id']
                ], $post);

                echo $send;
            } else {
                $send = $this->crud->create('generate_mrp', $post);
                echo $send;
            }
        }
    }

    public function createMrp()
    {
        if ($this->input->post()) {
            $post = $this->input->post('data');
            $item_rm_id = $post['item_rm_id'];

            $item_rm = $this->crud->read("item_rm", [], ["id" => $item_rm_id]);
            $part_no = @$item_rm->number;

            //Select Query
            // $this->db->select('*');
            // $this->db->from('generate_mrp_finals');
            // $this->db->where('p_month', $post['p_month']);
            // $this->db->where('p_year', $post['p_year']);
            // $this->db->where('revision', $post['revision']);
            // $this->db->where('item_rm_id', $post['item_rm_id']);
            // $records = $this->db->get()->result_array();

            // $this->dummy = $this->load->database('dummy', TRUE);

            // $period_1 = date("Ym", strtotime("-1 month", strtotime($post['p_year']."-".$post['p_month']."-01")));
            // $period_2 = date("Ym", strtotime("-2 month", strtotime($post['p_year']."-".$post['p_month']."-01")));
            // $period_3 = date("Ym", strtotime("-3 month", strtotime($post['p_year']."-".$post['p_month']."-01")));
            $period_1 = date("Y-m", strtotime("-1 month", strtotime($post['p_year'] . "-" . $post['p_month'] . "-01")));
            $period_2 = date("Y-m", strtotime("-2 month", strtotime($post['p_year'] . "-" . $post['p_month'] . "-01")));
            $period_3 = date("Y-m", strtotime("-3 month", strtotime($post['p_year'] . "-" . $post['p_month'] . "-01")));

            // $qissued = $this->dummy->query("SELECT b.item_id, SUM(b.qty_need) as need from wip_trx_mpp a
            //     join serial_detail_kanbanrm b ON a.temp_woc_id = b.kanbanrm_woc_id
            //     where a.periode IN ('$period_1','$period_2','$period_3') and b.item_id = '$part_no'
            //     group by b.item_id, a.periode
            //     order by b.item_id, a.periode");

            // $maxRevQuery1 = $this->dummy->query("SELECT max(rev) as revision FROM wip_trx_mpp WHERE periode = '$period_1'");
            // $maxRev1 = $maxRevQuery1->row();
            // $maxRevQuery2 = $this->dummy->query("SELECT max(rev) as revision FROM wip_trx_mpp WHERE periode = '$period_2'");
            // $maxRev2 = $maxRevQuery2->row();
            // $maxRevQuery3 = $this->dummy->query("SELECT max(rev) as revision FROM wip_trx_mpp WHERE periode = '$period_3'");
            // $maxRev3 = $maxRevQuery3->row();
            // $rev1 = @$maxRev1->revision;
            // $rev2 = @$maxRev2->revision;
            // $rev3 = @$maxRev3->revision;

            // $qissued1 = $this->dummy->query("SELECT z.periode, z.bom_com_item, SUM(z.need) as need FROM(
            //     SELECT b.bom_com_item, a.periode, (a.qty * b.bom_qty_perassy) as need from wip_trx_mpp a
            //     JOIN mst_bom b ON b.bom_par_item = a.assy_no
            //     where a.periode = '$period_1' and b.bom_com_item = '$part_no' and a.rev = '$rev1'
            //     order by b.bom_com_item, a.periode) z GROUP BY z.periode, z.bom_com_item ORDER by z.periode asc");
            // $missued1 = $qissued1->result_array();

            // $qissued2 = $this->dummy->query("SELECT z.periode, z.bom_com_item, SUM(z.need) as need FROM(
            //     SELECT b.bom_com_item, a.periode, (a.qty * b.bom_qty_perassy) as need from wip_trx_mpp a
            //     JOIN mst_bom b ON b.bom_par_item = a.assy_no
            //     where a.periode = '$period_2' and b.bom_com_item = '$part_no' and a.rev = '$rev2'
            //     order by b.bom_com_item, a.periode) z GROUP BY z.periode, z.bom_com_item ORDER by z.periode asc");
            // $missued2 = $qissued2->result_array();

            // $qissued3 = $this->dummy->query("SELECT z.periode, z.bom_com_item, SUM(z.need) as need FROM(
            //     SELECT b.bom_com_item, a.periode, (a.qty * b.bom_qty_perassy) as need from wip_trx_mpp a
            //     JOIN mst_bom b ON b.bom_par_item = a.assy_no
            //     where a.periode = '$period_3' and b.bom_com_item = '$part_no' and a.rev = '$rev3'
            //     order by b.bom_com_item, a.periode) z GROUP BY z.periode, z.bom_com_item ORDER by z.periode asc");
            // $missued3 = $qissued3->result_array();

            $qissued1 = $this->db->query("SELECT item_rm_id, COALESCE(SUM(qty_act), 0) AS need FROM supply_sheets WHERE request_date like '%$period_1%' and item_rm_id = '$item_rm_id' GROUP BY item_rm_id");
            $missued1 = $qissued1->result_array();

            $qissued2 = $this->db->query("SELECT item_rm_id, COALESCE(SUM(qty_act), 0) AS need FROM supply_sheets WHERE request_date like '%$period_2%' and item_rm_id = '$item_rm_id' GROUP BY item_rm_id");
            $missued2 = $qissued2->result_array();

            $qissued3 = $this->db->query("SELECT item_rm_id, COALESCE(SUM(qty_act), 0) AS need FROM supply_sheets WHERE request_date like '%$period_3%' and item_rm_id = '$item_rm_id' GROUP BY item_rm_id");
            $missued3 = $qissued3->result_array();

            //Select Query
            $this->db->select('*');
            $this->db->from('generate_mrp_finals');
            $this->db->where('p_month', $post['p_month']);
            $this->db->where('p_year', $post['p_year']);
            $this->db->where('revision', $post['revision']);
            $this->db->where('item_rm_id', $post['item_rm_id']);
            $this->db->where('supplier_id', $post['supplier_id']);
            $records = $this->db->get()->result_array();

            $postFinal = array_merge($post, array(
                "issued_1" => @$missued1[0]['need'],
                "issued_2" => @$missued2[0]['need'],
                "issued_3" => @$missued3[0]['need'],
                "issued_avg" => ((@$missued1[0]['need'] + @$missued2[0]['need'] + @$missued3[0]['need']) / 3),
            ));

            $postFinal = array_merge($post, array(
                "issued_1" => 0,
                "issued_2" => 0,
                "issued_3" => 0,
                "issued_avg" => 0,
            ));

            if (count($records) > 0) {
                $send = $this->crud->update('generate_mrp_finals', [
                    "p_month" => $post['p_month'],
                    "p_year" => $post['p_year'],
                    "revision" => $post['revision'],
                    "item_rm_id" => $post['item_rm_id'],
                    "supplier_id" => $post['supplier_id'],
                ], $postFinal);

                echo $send;
            } else {
                $send = $this->crud->create('generate_mrp_finals', $postFinal);
                echo $send;
            }
        }
    }

    public function createAbc()
    {
        if ($this->input->post()) {
            $post = $this->input->post('data');
            $records = $this->crud->reads('generate_mrp_abcclass', [], [
                "p_month" => $post['p_month'],
                "p_year" => $post['p_year'],
                "revision" => $post['revision'],
                "item_rm_id" => $post['item_rm_id'],
                "supplier_id" => $post['supplier_id'],
            ]);

            if (count($records) > 0) {
                $send = $this->crud->update('generate_mrp_abcclass', [
                    "p_month" => $post['p_month'],
                    "p_year" => $post['p_year'],
                    "revision" => $post['revision'],
                    "item_rm_id" => $post['item_rm_id'],
                    "supplier_id" => $post['supplier_id'],
                ], $post);

                echo $send;
            } else {
                $send = $this->crud->create('generate_mrp_abcclass', $post);
                echo $send;
            }
        }
    }

    public function print($option = "")
    {
        if ($this->input->get()) {
            if ($option == "excel") {
                $format  = date("Ymd");
                header("Content-type: application/vnd-ms-excel");
                header("Content-Disposition: attachment; filename=mrp_$format.xls");
            }

            //Config
            $this->db->select('*');
            $this->db->from('config');
            $config = $this->db->get()->row();

            $filter_month = base64_decode($this->input->get('filter_month'));
            $filter_year = base64_decode($this->input->get('filter_year'));
            $filter_revision = base64_decode($this->input->get('filter_revision'));
            $filter_product_family = base64_decode($this->input->get('filter_product_family'));
            $filter_part_no = trim(base64_decode($this->input->get('filter_part_no')));
            $this->db->select('a.*,c.number as item_rm_number, c.name as item_rm_name, c.hsn_code, b.cutoff, b.created_by');
            $this->db->from('supplier_items a');
            $this->db->join('generate_mrp_finals b', 'a.supplier_id=b.supplier_id and a.item_rm_id=b.item_rm_id', 'left');
            $this->db->join('item_rm c', 'a.item_rm_id=c.id', 'left');
            $this->db->where('b.p_month', $filter_month);
            $this->db->where('b.p_year', $filter_year);
            $this->db->where('b.revision', $filter_revision);
            $this->db->like('c.item_family_id', $filter_product_family);
            $this->db->like('a.item_rm_id', $filter_part_no);
            $this->db->where("(a.mpq = 0 or a.moq = 0 or a.leadtime = 0 or a.share_order = 0 or c.hsn_code ='-')");
            // $this->db->where('leadtime >', 0);
            $this->db->group_by('a.item_rm_id');
            $this->db->group_by('a.supplier_id');
            $this->db->order_by('a.item_rm_id', 'asc');
            // $this->db->limit(10);

            $records = $this->db->get()->result_array();
            // die($this->db->last_query());

            $month_name = date("F", mktime(0, 0, 0, $filter_month, 10));
            if (!empty($filter_product_family)) {
                $item_familys = $this->crud->read("item_familys", [], ["id" => $filter_product_family]);
                $product_family = @$item_familys->name;
            } else {
                $product_family = "ALL";
            }
            if (!empty($filter_part_no)) {
                $item_id = $filter_part_no;
            } else {
                $item_id = "ALL";
            }

            $html = '<html><head><title>Print Data</title></head><style>body {font-family: Arial, Helvetica, sans-serif;}#customers {border-collapse: collapse;width: 100%;font-size: 11px;}#customers td, #customers th {border: 1px solid #ddd;padding: 2px;}#customers tr:nth-child(even){background-color: #f2f2f2;}#customers tr:hover {background-color: #ddd;}#customers th {padding-top: 2px;padding-bottom: 2px;text-align: left;color: black;} 
            .box-green{
                height: 10px;
                width: 10px;
                margin: 10px;
                font-size: 10px;
                background-color: #D6FFCF;
            }

            .box-red{
                height: 10px;
                width: 10px;
                margin: 10px;
                font-size: 10px;
                background-color: #FFCFCF;
            }
            </style>
            <body>
                <center>
                    <div style="float: left; font-size: 12px; text-align: left;">
                        <table style="width: 100%;">
                            <tr>
                                <td width="50" style="font-size: 12px; vertical-align: top; text-align: center; vertical-align:jus margin-right:10px;">
                                    <img src="' . $config->logo . '" width="30">
                                </td>
                                <td style="font-size: 14px; text-align: left; margin:2px;">
                                    <b>' . $config->name . '</b><br>
                                    <small>MRP EXCEPTION REPORT</small><br>
                                    <small>Cutoff Date : ' . @$records[0]['cutoff'] . '</small><br>
                                    <small>Generate By : ' . @$records[0]['created_by'] . '</small><br>
                                    <small>Periode : ' . $month_name . ' ' . $filter_year . '</small><br>
                                    <small>Revision : ' . $filter_revision . '</small><br>
                                    <small>Product Family : ' . $product_family . '</small><br>
                                    <small>Part No : ' . $item_id . '</small>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div style="float: right; font-size: 12px; text-align: right;">
                        Print Date ' . date("d M Y H:m:s") . ' <br>
                        Print By ' . $this->session->username . '  
                    </div>
                    <br><br><br>
                </center>

                <table id="customers" border="1">
                    <tr>
                        <th style="text-align:center;" width="20">No</th>
                        <th style="text-align:center;">PART NO EBWS</th>
                        <th style="text-align:center;">PART NO SUPPLIER</th>
                        <th style="text-align:center;">DESCRIPTION</th>
                        <th style="text-align:center;">MPQ</th>
                        <th style="text-align:center;">MOQ</th>
                        <th style="text-align:center;">LEADTIME<br>(Days)</th>
                        <th style="text-align:center;">SHARE<br>ORDER %</th>
                        <th style="text-align:center;">HSN</th>
                    </tr>';

            $no = 1;
            foreach ($records as $record) {
                if ($record['mpq'] == 0) {
                    $style1 = "background:red; color:white;";
                } else {
                    $style1 = "";
                }
                if ($record['moq'] == 0) {
                    $style2 = "background:red; color:white;";
                } else {
                    $style2 = "";
                }
                if ($record['leadtime'] == 0) {
                    $style3 = "background:red; color:white;";
                } else {
                    $style3 = "";
                }
                if ($record['share_order'] == 0) {
                    $style4 = "background:red; color:white;";
                } else {
                    $style4 = "";
                }
                if ($record['hsn_code'] == '-') {
                    $style5 = "background:red; color:white;";
                } else {
                    $style5 = "";
                }

                $html .= "  <tr>
                                        <td>" . $no . "</td>
                                        <td style='mso-number-format:\@;'>" . trim($record['item_rm_id']) . "</td>
                                        <td style='mso-number-format:\@;'>" . trim($record['item_rm_number']) . "</td>
                                        <td style='mso-number-format:\@;'>" . $record['item_rm_name'] . "</td>
                                        <td style='text-align:center;" . $style1 . "'>" . $record['mpq'] . "</td>
                                        <td style='text-align:center;" . $style2 . "'>" . $record['moq'] . "</td>
                                        <td style='text-align:center;" . $style3 . "'>" . $record['leadtime'] . "</td>
                                        <td style='text-align:center;" . $style4 . "'>" . $record['share_order'] . "</td>
                                        <td style='text-align:left;" . $style5 . "'>" . $record['hsn_code'] . "</td>
                                    </tr>";
                $no++;
            }

            $html .= '</table></body></html>';
            echo $html;
        }
    }
}
