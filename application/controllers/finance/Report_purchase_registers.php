<?php
date_default_timezone_set("Asia/Bangkok");
defined('BASEPATH') or exit('No direct script access allowed');
class Report_purchase_registers extends CI_Controller
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
        $this->form_validation->set_rules('item_id', 'Product No', 'required|min_length[1]|max_length[50]');
    }

    public function index()
    {
        if (empty($this->session->username)) {
            redirect('error_session');
        } elseif ($this->checkuserAccess($this->id_menu()) > 0) {
            $data['button'] = $this->getbutton($this->id_menu());
            $this->load->view('template/header', $data);
            $this->load->view('finance/report_purchase_registers');
        } else {
            redirect('error_access');
        }
    }

    public function readInvoice($supplier_id){
        $supplier_id = base64_decode($supplier_id);
        $query = $this->crud->query("SELECT DISTINCT `invoice_no` FROM purchase_invoices WHERE supplier_id = '$supplier_id' ORDER BY `invoice_no` ASC");
        die(json_encode($query));
    }

    public function readPor($supplier_id){
        $supplier_id = base64_decode($supplier_id);
        $query = $this->crud->query("SELECT DISTINCT `por_no` FROM purchase_invoices WHERE supplier_id = '$supplier_id' ORDER BY `por_no` ASC");
        die(json_encode($query));
    }

    public function readPartNo($supplier_id = ""){
        $post = isset($_POST['q']) ? $_POST['q'] : "";

        $supplier_id = base64_decode($supplier_id);
        if($supplier_id != ""){
            $w_supplier = "and a.supplier_id = '$supplier_id'";
        }else{
            $w_supplier = "";
        }

        $query = $this->crud->query("SELECT DISTINCT item_rm_id, b.number as item_rm_number, b.name as item_rm_name FROM purchase_invoices a JOIN item_rm b ON a.item_rm_id = b.id WHERE (a.item_rm_id like '%$post%' or b.number like '%$post%') $w_supplier ORDER BY b.number ASC");
        die(json_encode($query));
    }

    public function print($option = "")
    {
        if ($option == "excel") {
            $format  = date("Ymd");
            header("Content-type: application/vnd-ms-excel");
            header("Content-Disposition: attachment; filename=report_purchase_registers_$format.xls");
        }

        $filter_from  = base64_decode($this->input->get('filter_from'));
        $filter_to = base64_decode($this->input->get('filter_to'));
        $filter_supplier = base64_decode($this->input->get('filter_supplier'));
        $filter_invoice_no = base64_decode($this->input->get('filter_invoice_no'));
        $filter_por_no = base64_decode($this->input->get('filter_por_no'));
        $filter_item_familys = base64_decode($this->input->get('filter_item_familys'));
        $filter_item_no = base64_decode($this->input->get('filter_item_no'));

        //Config
        $this->db->select('*');
        $this->db->from('config');
        $config = $this->db->get()->row();

        $this->db->select('a.*, b.name as supplier_name, b.state, b.gst, b.tds, b.pen, c.name as journal_type_name, d.receipt_date, e.account_name, 
            f.number as item_rm_number, f.hsn_code, g.igst as igst_rate, g.sgst as sgst_rate, g.cgst as cgst_rate, h.name as product_family');
        $this->db->from('purchase_invoices a');
        $this->db->join('suppliers b', 'a.supplier_id = b.id');
        $this->db->join('journal_types c', 'a.journal_type_id = c.id', 'left');
        $this->db->join('purchase_order_receipts d', 'a.por_no = d.receipt_no', 'left');
        $this->db->join('account_coa e', 'a.account_number = e.account_number', 'left');
        $this->db->join('item_rm f', 'a.item_rm_id = f.id');
        $this->db->join('hsn g', 'f.hsn_code = g.number', 'left');
        $this->db->join('item_familys h', 'f.item_family_id = h.id');
        $this->db->where("a.trans_date between '$filter_from' and '$filter_to'");
        $this->db->like('h.id', $filter_item_familys);
        $this->db->like('a.item_rm_id', $filter_item_no);
        $this->db->like('a.por_no', $filter_por_no);
        $this->db->like('a.supplier_id', $filter_supplier);
        $this->db->like('a.invoice_no', $filter_invoice_no);
        $this->db->group_by('a.id');
        $this->db->order_by('a.supplier_id', 'ASC');
        $this->db->order_by('a.number', 'ASC');
        $records = $this->db->get()->result_array();

        $html = '<html><head><title>Print Data</title></head><style>body {font-family: Arial, Helvetica, sans-serif;}#customers {border-collapse: collapse;width: 250%;font-size: 12px;}#customers td, #customers th {border: 1px solid #ddd;padding: 2px;}#customers tr:nth-child(even){background-color: #f2f2f2;}#customers tr:hover {background-color: #ddd;}#customers th {padding-top: 2px;padding-bottom: 2px;text-align: center;color: black;}</style><body>
            <center>
                <div style="float: left; font-size: 12px; text-align: left;">
                    <table style="width: 100%;">
                        <tr>
                            <td width="50" style="font-size: 12px; vertical-align: top; text-align: center; vertical-align:jus margin-right:10px;">
                                <img src="' . $config->favicon . '" width="30">
                            </td>
                            <td style="font-size: 14px; text-align: left; margin:2px;">
                                <b>' . $config->name . '</b><br>
                                <small>' . $config->description . '</small>
                            </td>
                        </tr>
                    </table>
                </div>
            </center>
            <br><br><br>
            <center>
                <h2 style="margin:0;">PURCHASE REGISTER REPORT</h2>
                <small>PERIOD : '.$filter_from.' To '.$filter_to.'</small>
            </center>
            <br><br>
            <table id="customers" border="1">
                <tr>
                    <th width="20">No</th>
                    <th>Company GST No</th>
                    <th>Name of Supplier</th>
                    <th>Supplier GST No</th>
                    <th>State Code</th>
                    <th>Invoice No</th>
                    <th>Invoice Date</th>
                    <th>Posting Date</th>
                    <th>Part No EBWS</th>
                    <th>Asset Code</th>
                    <th>Part Description</th>
                    <th>Material Type</th>
                    <th>HSN / SAC</th>
                    <th>Quantity of Good</th>
                    <th>Currency</th>
                    <th>Unit Price</th>
                    <th>Rate</th>
                    <th>Taxable Value</th>
                    <th>IGST Rate</th>
                    <th>IGST Amount</th>
                    <th>CGST Rate</th>
                    <th>CGST Amount</th>
                    <th>SGST Rate</th>
                    <th>SGST Amount</th>
                    <th>TCS Amount</th>
                    <th>TDS Amount</th>
                    <th>TDS Section</th>
                    <th>Total Invoice</th>
                    <th>PI No</th>
                    <th>GRN No</th>
                    <th>GRN Date</th>
                    <th>COA No</th>
                    <th>COA Name</th>
                </tr>';
        $no = 1;
        foreach ($records as $data) {
            if($data['igst'] > 0){
                $igst_rate = $data['igst_rate'];
            }else{
                $igst_rate = 0;
            }

            if($data['sgst'] > 0){
                $sgst_rate = $data['sgst_rate'];
            }else{
                $sgst_rate = 0;
            }

            if($data['cgst'] > 0){
                $cgst_rate = $data['cgst_rate'];
            }else{
                $cgst_rate = 0;
            }

            $html .= '  <tr>
                            <td style="text-align:center">' . $no . '</td>
                            <td>' . $config->gst_no . '</td>
                            <td>' . $data['supplier_name'] . '</td>
                            <td>' . $data['gst'] . '</td>
                            <td>' . $data['state'] . '</td>
                            <td>' . $data['invoice_no'] . '</td>
                            <td>' . $data['invoice_date'] . '</td>
                            <td>' . $data['trans_date'] . '</td>
                            <td style="mso-number-format:\@;">' . $data['item_rm_id'] . '</td>
                            <td style="mso-number-format:\@;">' . $data['asset_code'] . '</td>
                            <td style="mso-number-format:\@;">' . $data['item_rm_number'] . '</td>
                            <td>' . $data['product_family'] . '</td>
                            <td>' . $data['hsn_code'] . '</td>
                            <td style="text-align:right;">' . $data['qty'] . '</td>
                            <td style="text-align:center;">' . $data['currency'] . '</td>
                            <td style="text-align:center;">' . $data['price'] . '</td>
                            <td style="text-align:right;">' . $data['rate'] . '</td>
                            <td style="text-align:right;">' . $data['total'] . '</td>
                            <td style="text-align:right;">' . $igst_rate . '</td>
                            <td style="text-align:right;">' . $data['igst'] . '</td>
                            <td style="text-align:right;">' . $cgst_rate . '</td>
                            <td style="text-align:right;">' . $data['cgst'] . '</td>
                            <td style="text-align:right;">' . $sgst_rate . '</td>
                            <td style="text-align:right;">' . $data['sgst'] . '</td>
                            <td style="text-align:right;">' . $data['total_tcs'] . '</td>
                            <td style="text-align:right;">' . $data['total_tds'] . '</td>
                            <td>' . $data['tds'] . '</td>
                            <td style="text-align:right;">' . ($data['total2']) . '</td>
                            <td>' . $data['number'] . '</td>
                            <td>' . $data['por_no'] . '</td>
                            <td>' . $data['receipt_date'] . '</td>
                            <td style="mso-number-format:\@;">' . $data['account_number'] . '</td>
                            <td>' . $data['account_name'] . '</td>
                        </tr>';
            $no++;
        }
        $html .= '</table></body></html>';
        echo $html;
    }
}
