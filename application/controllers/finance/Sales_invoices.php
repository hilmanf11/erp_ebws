<?php
date_default_timezone_set("Asia/Bangkok");
defined('BASEPATH') or exit('No direct script access allowed');
class Sales_invoices extends CI_Controller
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
        $this->load->library('Convertcurrency');
        //Validasi Form
        $this->form_validation->set_rules('item_id', 'Product No', 'required|min_length[1]|max_length[50]');
    }
    public function index()
    {
        if (empty($this->session->username)) {
            redirect('error_session');
        } elseif ($this->checkuserAccess($this->id_menu()) > 0) {
            $data['button'] = $this->getbutton($this->id_menu());
            $data['menus_id'] = $this->id_menu();
            
            $this->load->view('template/header', $data);
            $this->load->view('finance/sales_invoices');
        } else {
            redirect('error_access');
        }
    }

    public function reads($number)
    {
        $number = base64_decode($number);
        $this->db->select('a.*, f.account_name, c.number as item_fg_number, c.name as item_fg_name, c.number_customer, b.currency');
        $this->db->from('sales_invoices a');
        $this->db->join('customers b', 'a.customer_id = b.id');
        $this->db->join('item_fg c', 'a.item_fg_id = c.id', 'left');
        $this->db->join('account_coa f', 'a.account_number = f.account_number', 'left');
        $this->db->where('a.deleted', 0);
        $this->db->where('a.status', 0);
        $this->db->where('a.number', $number);
        $this->db->order_by('c.number', 'asc');
        $records = $this->db->get()->result_array();

        $total_sub = 0;
        $total_igst = 0;
        $total_sgst = 0;
        $total_cgst = 0;
        $total_local = 0;
        foreach ($records as $record) {
            $total_sub += $record['total'];
            $total_igst += $record['igst'];
            $total_sgst += $record['sgst'];
            $total_cgst += $record['cgst'];
            $total_local += $record['total_local'];
        }

        $datas['rows'] = $records;
        $datas['total_sub'] = $total_sub;
        $datas['total_igst'] = $total_igst;
        $datas['total_sgst'] = $total_sgst;
        $datas['total_cgst'] = $total_cgst;
        $datas['total_grand'] = ($total_sub + $total_igst + $total_sgst + $total_cgst);
        $datas['total_grand_local'] = $total_local;

        die(json_encode($datas));
    }

    public function readApi(){
        $url = 'https://stage-api.irisgst.com/irisgst/mgmt/login';

        $data = array(
            "email" => "bhawani.shankar@ebwsindia.com",
            "password" => "Damien@2128"
        );

        $ch = curl_init($url);
        $payload = json_encode($data);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_HTTPHEADER, array('Content-Type:application/json'));
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $payload);
        $response = curl_exec($ch);

        if($response === false) {
            echo 'Curl error: ' . curl_error($ch);
        } else {
            die($response);
        }

        curl_close($ch);
    }

    public function readExchangeRates()
    {
        $customer_id = $this->input->get('customer_id');

        $records = $this->crud->query("SELECT b.selling
            FROM customers a JOIN exchange_rates b ON a.currency = b.currency_from and b.currency_to = 'INR'
            WHERE a.id = '$customer_id'
            GROUP BY a.currency 
            ORDER BY b.created_date desc");
        echo json_encode($records);
    }

    public function readDelivery()
    {
        $customer_id = base64_decode($this->input->get('customer_id'));

        $records = $this->crud->query("SELECT a.delivery_note_no, a.plant, b.payment_term
            FROM delivery_notes a
            JOIN customer_address b on a.customer_id = b.customer_id and a.plant = b.plant
            WHERE a.customer_id = '$customer_id' and a.status = '0'
            GROUP BY a.delivery_note_no
            ORDER BY a.delivery_note_no desc");
        echo json_encode($records);
    }

    public function readSalesInvoices()
    {
        $data = $this->crud->query("SELECT DISTINCT `number` FROM sales_invoices WHERE `status` = '0' ORDER BY `number` ASC");
        echo json_encode($data);
    }

    public function readDeliveryNote()
    {
        $data = $this->crud->query("SELECT DISTINCT `dn_number` FROM sales_invoices WHERE `status` = '0' ORDER BY `dn_number` ASC");
        echo json_encode($data);
    }

    public function readVoucher()
    {
        $data = $this->crud->query("SELECT DISTINCT `voucher` FROM sales_invoices WHERE `status` = '0' ORDER BY `voucher` ASC");
        echo json_encode($data);
    }

    public function readJournal($journal_type_id)
    {
        $post = isset($_POST['q']) ? $_POST['q'] : "";

        $journal_type_id = base64_decode($journal_type_id);

        $journals = $this->crud->query("SELECT a.*, a.flag, b.account_name FROM journal_setups a 
            JOIN account_coa b ON a.account_number = b.account_number 
            WHERE a.account_number LIKE '%$post%' and a.journal_type_id = '$journal_type_id' ORDER BY a.flag ASC");

        foreach ($journals as $journal) {
            $arr[] = array(
                "account_number" => $journal->account_number,
                "account_name" => $journal->account_name,
                "debit" => "0.00",
                "credit" => "0.00",
                "flag" => $journal->flag,
            );
        }

        echo json_encode($arr);
    }

    // public function readJournalDetail($journal_type_id, $account_number)
    // {

    //     $journal_type_id = base64_decode($journal_type_id);
    //     $account_number = base64_decode($account_number);

    //     $journals = $this->crud->query("SELECT a.*, b.account_name FROM journal_setups a 
    //         JOIN account_coa b ON a.account_number = b.account_number 
    //         WHERE a.account_number = '$account_number' and a.journal_type_id = '$journal_type_id' ORDER BY a.flag ASC");

    //     foreach ($journals as $journal) {
    //         $arr[] = array(
    //             "account_number" => $journal->account_number,
    //             "account_name" => $journal->account_name,
    //             "account_type" => $journal->status,
    //             "flag" => $journal->flag,
    //         );
    //     }

    //     echo json_encode($arr);
    // }

    public function readJournals($number)
    {
        $number = base64_decode($number);
        $reads = $this->crud->reads("sales_invoice_journals", [], ["number" => $number], "", "flag", "asc");
        echo json_encode($reads);
    }

    public function calculateJournal()
    {
        $journals = json_decode(file_get_contents("json/sales_invoice_journals.json"), true);
        // $sales_invoices = array("1121101", "1121102", "1121103");

        if (count($journals) > 0) {
            // $total_ap = 0;

            // foreach ($journals as $journal) {
            //     if ($journal['debit'] > 0) {
            //         $total_ap += $journal['debit'];
            //     }
            // }

            foreach ($journals as $journal) {
                $jsonDatas = json_decode(file_get_contents("json/sales_invoices.json"), true);
                $total_debit = 0;
                $total_credit = 0;
                $total_ap2 = 0;

                foreach ($jsonDatas as $jsonData) {
                    if($jsonData['account_number'] != "5311006"){
                        if ($jsonData['account_number'] == $journal['account_number'] && $jsonData['account_type'] == "DEBIT") {
                            $total_debit += $jsonData['total'];
                        } elseif ($jsonData['account_number'] == $journal['account_number'] && $jsonData['account_type'] == "CREDIT") {
                            $total_credit += $jsonData['total'];
                        }
                    }
                }

                // foreach ($jsonDatas as $jsonData) {
                //     if ($jsonData['account_type'] == "DEBIT") {
                //         $total_ap2 -= $jsonData['total'];
                //     } elseif ($jsonData['account_type'] == "CREDIT") {
                //         $total_ap2 += $jsonData['total'];
                //     }
                // }

                // if (in_array($journal['account_number'], $sales_invoices)) {
                //     $total_debit += $total_ap + $total_ap2;
                // }

                if ($journal['credit'] > 0) {
                    $total_credit = $journal['credit'];
                }

                if ($journal['debit'] > 0) {
                    $total_debit = $journal['debit'];
                }

                $arr[] = array(
                    "account_number" => $journal['account_number'],
                    "account_name" => $journal['account_name'],
                    "debit" => round($total_debit, 4),
                    "credit" => round($total_credit, 4),
                    "flag" => $journal['flag'],
                );
            }
        } else {
            $jsonDatas = json_decode(file_get_contents("json/sales_invoices.json"), true);
            $total = 0;
            $flag = 1;
            $mergedData = array();
            foreach ($jsonDatas as $jsonData) {
                $account_number = $jsonData["account_number"];
                $account_name = $jsonData["account_name"];
                $account_type = $jsonData["account_type"];
                $total = $jsonData["total"];

                if (isset($mergedData[$account_number])) {
                    // Jika nomor akun sudah ada dalam hasil penggabungan, tambahkan nilai total ke nomor akun tersebut
                    if ($jsonData['account_type'] == "DEBIT") {
                        $mergedData[$account_number]["debit"] += $total;
                    } elseif ($jsonData['account_type'] == "CREDIT") {
                        $mergedData[$account_number]["credit"] += $total;
                    }
                } else {
                    // Jika nomor akun belum ada dalam hasil penggabungan, tambahkan data baru
                    if ($jsonData['account_type'] == "DEBIT") {
                        $mergedData[$account_number] = array(
                            "account_number" => $account_number,
                            "account_name" => $account_name,
                            "account_type" => $account_type,
                            "debit" => $total,
                            "credit" => 0,
                            "flag" => $flag,
                        );
                    } elseif ($jsonData['account_type'] == "CREDIT") {
                        $mergedData[$account_number] = array(
                            "account_number" => $account_number,
                            "account_name" => $account_name,
                            "account_type" => $account_type,
                            "debit" => 0,
                            "credit" => $total,
                            "flag" => $flag,
                        );
                    }
                }

                $flag++;
            }

            // Ubah hasil penggabungan menjadi indeks numerik jika diperlukan
            $arr = array_values($mergedData);
        }

        echo json_encode($arr);
    }

    public function readDueDate($trans_date, $payment_term)
    {
        $due_date = date('Y-m-d', strtotime('+' . $payment_term . ' days', strtotime(base64_decode($trans_date))));
        die($due_date);
    }

    // public function number($trans_date, $nickname)
    // {
    //     $datenow    = "SI-" . $nickname . date("Ym", strtotime(base64_decode($trans_date)));
    //     $sqlGetID   = $this->db->query("SELECT max(`number`) as kode FROM sales_invoices WHERE `number` like '%$datenow%'");
    //     $rowID      = $sqlGetID->row();
    //     $kode       = $rowID->kode;
    //     if ($kode == NULL) {
    //         $autoID = sprintf("%04s", $kode + 1);
    //     } else {
    //         $urutan = (int) substr($kode, -4);
    //         $urutan++;
    //         $autoID = sprintf("%04s", $urutan);
    //     }
    //     echo $datenow . "-" . $autoID;
    // }

    public function number($id_menu)
    {
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

            $sqlGetID	= $this->db->query("SELECT max(`number`) as kode FROM sales_invoices WHERE `number` like '%$whereDate%'");
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

            echo $autoNo;
        }
    }

    public function datatablesTemp()
    {
        $dn_number = base64_decode($this->input->get('dn_number'));

        //Config
        $this->db->select('*');
        $this->db->from('config');
        $config = $this->db->get()->row();

        $this->db->select("a.delivery_note_no as dn_number, a.customer_order_no as customer_po, a.sales_order_no as so_number, b.uom,
            a.item_fg_id, b.number_customer, b.number as item_fg_number, b.name as item_fg_name, b.account_number, b.account_name, b.hsn_code, h.bill_state as state,
            ((a.qty * e.price) * COALESCE(f.igst, 0) / 100) as igst,
            ((a.qty * e.price) * COALESCE(f.sgst, 0) / 100) as sgst,
            ((a.qty * e.price) * COALESCE(f.cgst, 0) / 100) as cgst,
            d.currency, a.qty, e.price, (a.qty * e.price) as total,
            COALESCE(g.middle, 0) as rate,
            (CASE WHEN g.middle is null THEN 1 ELSE g.middle END) as rate");
        $this->db->from('delivery_notes a');
        $this->db->join('item_fg b', 'a.item_fg_id = b.id');
        $this->db->join('customer_items c', 'a.customer_id = c.customer_id and c.item_fg_id = a.item_fg_id and a.plant = c.plant');
        $this->db->join('customers d', 'a.customer_id = d.id');
        $this->db->join('sales_orders e', 'a.sales_order_no = e.sales_order_no and a.item_fg_id = e.item_fg_id');
        $this->db->join('hsn f', "b.hsn_code = f.number", 'left');
        $this->db->join('exchange_rates g', "g.start_date = DATE_FORMAT((a.delivery_note_date - INTERVAL '1' MONTH), '%Y-%m-01') and g.currency_from = d.currency", 'left');
        $this->db->join('customer_address h', 'a.customer_id = h.customer_id and a.plant = h.plant', "left");
        $this->db->where('a.delivery_note_no', $dn_number);
        $this->db->group_by('a.id');
        $this->db->order_by('a.delivery_note_no', 'asc');
        $records = $this->db->get()->result_array();

        $total_sub = 0;
        $total_igst = 0;
        $total_cgst = 0;
        $total_sgst = 0;
        $total_local = 0;
        foreach ($records as $record) {
            
            if($record['state'] == ""){
                $igst = 0;
                $cgst = 0;
                $sgst = 0;
                $total2 = $record['total'];
                $total2_local = $record['total'];
                $total_igst += 0;
                $total_cgst += 0;
                $total_sgst += 0;
            }elseif($record['state'] == $config->state){
                $igst = 0;
                $cgst = $record['cgst'];
                $sgst = $record['sgst'];
                $total2 = ($record['total'] + $record['cgst'] + $record['sgst']);
                $total2_local = ($total2 * $record['rate']);
                $total_igst += 0;
                $total_cgst += $record['cgst'];
                $total_sgst += $record['sgst'];
            }else{
                $igst = $record['igst'];
                $cgst = 0;
                $sgst = 0;
                $total2 = ($record['total'] + $record['igst']);
                $total2_local = ($total2 * $record['rate']);
                $total_igst += $record['igst'];
                $total_cgst += 0;
                $total_sgst += 0;
            }

            $total_sub += $record['total'];
            $total_local += $total2_local;

            $obj[] = array(
                "dn_number" => $record['dn_number'],
                "so_number" => $record['so_number'],
                "customer_po" => $record['customer_po'],
                "item_fg_id" => $record['item_fg_id'],
                "item_fg_number" => $record['item_fg_number'],
                "number_customer" => $record['number_customer'],
                "item_fg_name" => $record['item_fg_name'],
                "uom" => $record['uom'],
                "hsn_code" => $record['hsn_code'],
                "currency" => $record['currency'],
                "currency_local" => "INR",
                "qty" => $record['qty'],
                "price" => $record['price'],
                "rate" => $record['rate'],
                "igst" => $igst,
                "sgst" => $sgst,
                "cgst" => $cgst,
                "total" => $record['total'],
                "total2" => $total2,
                "total_local" => $total2_local,
                "account_number" => $record['account_number'],
                "account_name" => $record['account_name'],
                "account_type" => "CREDIT",
            );
        }

        $arr['rows'] = $obj;
        $arr['total_sub'] = round($total_sub, 2);
        $arr['total_igst'] = round($total_igst, 2);
        $arr['total_cgst'] = round($total_cgst, 2);
        $arr['total_sgst'] = round($total_sgst, 2);
        $arr['total_grand'] = round(($total_sub + $total_igst + $total_cgst + $total_sgst), 2);
        $arr['total_local'] = round($total_local, 2);
        die(json_encode($arr));
    }

    public function datatables($details = "")
    {
        $filter_type  = base64_decode($this->input->get('filter_type'));
        $filter_trans_date_from = base64_decode($this->input->get('filter_trans_date_from'));
        $filter_trans_date_to = base64_decode($this->input->get('filter_trans_date_to'));
        $filter_due_date_from = base64_decode($this->input->get('filter_due_date_from'));
        $filter_due_date_to = base64_decode($this->input->get('filter_due_date_to'));
        $filter_sales_invoice = base64_decode($this->input->get('filter_sales_invoice'));
        $filter_dn_number = base64_decode($this->input->get('filter_dn_number'));
        $filter_customer = base64_decode($this->input->get('filter_customer'));
        $filter_status = base64_decode($this->input->get('filter_status'));

        $date_from = date("Y-m-01");
        $date_to = date("Y-m-t");

        if ($details == "") {
            $page = $this->input->post('page');
            $rows = $this->input->post('rows');
            //Pagination 1-10
            $page   = isset($page) ? intval($page) : 1;
            $rows   = isset($rows) ? intval($rows) : 10;
            $offset = ($page - 1) * $rows;
            $result = array();
            //Select Query
            $this->db->select('a.*, c.number as gl_no, b.name as customer_name');
            $this->db->from('sales_invoices a');
            $this->db->join('customers b', 'a.customer_id = b.id');
            $this->db->join('journal_postings c', 'a.number = c.document_no', 'left');
            if ($filter_type == "PID") {
                $this->db->where("a.trans_date between '$filter_trans_date_from' and '$filter_trans_date_to'");
            } elseif ($filter_type == "PAY") {
                $this->db->where("a.due_date between '$filter_due_date_from' and '$filter_due_date_to'");
            } else {
                $this->db->where("a.trans_date between '$date_from' and '$date_to'");
            }
            $this->db->like('a.number', $filter_sales_invoice);
            $this->db->like('a.dn_number', $filter_dn_number);
            $this->db->like('a.customer_id', $filter_customer);
            $this->db->like('a.status', $filter_status);
            $this->db->order_by('a.status', 'ASC');
            $this->db->order_by('a.trans_date', 'DESC');
            $this->db->group_by('a.number');
            //Total Data
            $totalRows = $this->db->count_all_results('', false);
            //Limit 1 - 10
            $this->db->limit($rows, $offset);
        } else {
            $number = base64_decode($this->input->get('number'));

            $this->db->select('a.*, c.number as item_fg_number, c.number_customer, c.name as item_fg_name');
            $this->db->from('sales_invoices a');
            $this->db->join('customers b', 'a.customer_id = b.id');
            $this->db->join('item_fg c', 'a.item_fg_id = c.id');
            $this->db->where('a.number', $number);
            $this->db->order_by('a.status', 'ASC');
            $this->db->order_by('a.trans_date', 'DESC');
            //Total Data
            $totalRows = $this->db->count_all_results('', false);
        }
        //Get Data Array
        $records = $this->db->get()->result_array();
        //Mapping Data
        $result['total'] = $totalRows;
        $result = array_merge($result, ['rows' => $records]);
        echo json_encode($result);
    }

    public function create()
    {
        if ($this->input->post()) {
            $post = $this->input->post();

            if (!empty($post['id'])) {
                $send = $this->crud->update('sales_invoices', ["id" => $post['id']], $post);
                echo $send;
            } else {
                $send = $this->crud->create('sales_invoices', $post);
                $update = $this->crud->update('delivery_notes', ["delivery_note_no" => $post['dn_number'], "sales_order_no" => $post['so_number'], "item_fg_id" => $post['item_fg_id']], ["status" => "1"]);
                echo $send;
            }
        } else {
            show_error("Cannot Process your request");
        }
    }

    public function createJson()
    {
        $jsonData = $this->input->post('jsonData');
        $jsonData2 = $this->input->post('jsonData2');

        // Simpan data JSON ke dalam file
        file_put_contents('json/sales_invoices.json', $jsonData);
        file_put_contents('json/sales_invoice_journals.json', $jsonData2);
    }

    public function createJournals()
    {
        if ($this->input->post()) {
            $post = $this->input->post();
            $purchase_invoice_journals = $this->crud->read('purchase_invoice_journals', [], ["number" => $post['number'], "account_number" => $post['account_number']]);

            if (@$purchase_invoice_journals->id != "") {
                $send = $this->crud->update('sales_invoice_journals', ["number" => $post['number'], "account_number" => $post['account_number']], $post);
                echo $send;
            } else {
                $send = $this->crud->create('sales_invoice_journals', $post);
                echo $send;
            }
        } else {
            show_error("Cannot Process your request");
        }
    }

    public function update()
    {
        if ($this->input->post()) {
            $post = $this->input->post();
            $send = $this->crud->update('sales_invoices', ["number" => $post['number']], $post);
            echo $send;
        } else {
            show_error("Cannot Process your request");
        }
    }

    public function deleteSingle()
    {
        $data = $this->input->post();
        $send = $this->crud->delete('sales_invoices', array("id" => $data['id']));
        echo $send;
    }

    public function deleteJournal()
    {
        $data = $this->input->post();
        $send = $this->crud->delete('sales_invoice_journals', $data);
        echo $send;
    }

    public function delete()
    {
        $data = $this->input->post();
        $packing_lists = $this->crud->reads('packing_lists', [], ["dn_number" => $data['dn_number']]);

        if (count($packing_lists) > 0) {
            echo json_encode(array("theme" => "error", "message" => "Please delete packing list first"));
        } else {
            $send = $this->crud->delete('sales_invoices', $data);
            $this->crud->delete('sales_invoice_journals', ["number" => $data['number']]);
            $update = $this->crud->update('delivery_notes', ["delivery_note_no" => $data['dn_number']], ["status" => "0"]);
            echo $send;
        }
    }

    public function print_commercial($invoice_no)
    {
        $invoice_no = base64_decode($invoice_no);
        $sales_invoices = $this->crud->reads('sales_invoices', [], ["number" => $invoice_no]);
        $sales_invoice = $this->crud->read('sales_invoices', [], ["number" => $invoice_no]);
        $delivery_note = $this->crud->read('delivery_notes', [], ["delivery_note_no" => $sales_invoice->dn_number]);

        $config = $this->db->get('config')->row();
        $config_iso = $this->db->get('config_iso')->row();
        //Config Page
        $rows = 15;
        $page = ceil(count($sales_invoices) / $rows);
        //Generate QRcode
        $this->createQrcode($sales_invoice->number, "assets/image/qrcode/");
        //Header Print
        $html = '<html><head><title>' . $sales_invoice->number . '</title><link rel="icon" href="' . $config->favicon . '" type="image/png" sizes="16x16"></head>';
        $html .= '<style>body {font-family: Arial, Helvetica, sans-serif;}';
        $html .= '#customers {border-collapse: collapse;width: 100%;font-size: 12px;}#customers {border-collapse: collapse;width: 100%;font-size: 12px;}#customers td, #customers th {border: 1px solid black;padding: 2px;}#customers th {padding-top: 2px;padding-bottom: 2px;text-align: center;color: black;}';
        $html .= '@media screen {.print {display: none !important;}} @media print {.noprint {display: none !important;}}</style>';
        $html .= '<body><div style="margin:20%;" class="noprint"><center>
                        <h1>Press CTRL + P for Print</h1>
                        <p>Display pages for 10 rows</p>
                        <p>Paper Size A4, Layout Landscape</p>
                        <p>Margin Default, Scale 98</p>
                    </center></div><div class="print">';
        //Loop Page
        $no = 1;
        $grand_qty = 0;
        $grand_total = 0;
        for ($i = 0; $i < $page; $i++) {
            $this->db->select('a.*, g.ship_by, d.name as customer_name, c.hsn_code, c.number_customer, c.name as item_fg_name, b.bill_address, b.ship_address, b.pan_no, b.gst_no, b.vendor_code, f.igst as p_igst, f.sgst as p_sgst, f.cgst as p_cgst');
            $this->db->from('sales_invoices a');
            $this->db->join('customers d', 'a.customer_id = d.id');
            $this->db->join('customer_address b', 'a.customer_id = b.customer_id and a.plant = b.plant');
            $this->db->join('item_fg c', 'a.item_fg_id = c.id');
            $this->db->join('hsn f', 'c.hsn_code = f.number');
            $this->db->join('delivery_notes g', 'a.dn_number = g.delivery_note_no', 'left');
            $this->db->join('delivery_orders e', 'g.delivery_order_no = e.delivery_order_no', 'left');
            $this->db->where('a.deleted', 0);
            $this->db->where('a.number', $invoice_no);
            $this->db->group_by('a.id');
            $this->db->order_by('a.item_fg_id', 'asc');
            $this->db->limit(15, ($i * 15));
            $records = $this->db->get()->result_array();

            $html .= '  <div style="border: 1px solid black; width:100%; height:auto;">
                            <table style="width:100%; font-size:12px !important;">
                                <tr>
                                    <td style="text-align:center;"> 
                                        <div style="float:left; border:1px solid black; width:12px; height: 12px; margin-left: 30px;"></div>
                                        <div style="float:left; margin-left: 10px;">ORIGINAL FOR RECIPIENT</div>
                                    </td>
                                    <td style="text-align:center;"> 
                                        <div style="float:left; border:1px solid black; width:12px; height: 12px; margin-left: 30px;"></div>
                                        <div style="float:left; margin-left: 10px;">DUPLICATE FOR TRANSPORTER</div>
                                    </td>
                                    <td style="text-align:center;"> 
                                        <div style="float:left; border:1px solid black; width:12px; height: 12px; margin-left: 30px;"></div>
                                        <div style="float:left; margin-left: 10px;">TRIPLICATE FOR SUPPLIER</div>
                                    </td>
                                </tr>
                            </table>
                            <hr>
                            <table style="width:100%;">
                                <tr>
                                    <td width="100"><img src="' . $config->favicon . '" width="150" /></td>
                                    <td width="10" style="vertical-align:top; text-align:center;">
                                        <div style="width: 180px; border:2px solid black; font-size: 20px; padding:5px; text-align:center;"><b>TAX INVOICE</b></div>
                                    </td>
                                    <td width="150">
                                        <div style="border:1px solid black; padding:5px;">
                                            <table style="width:100%; font-size: 12px;">
                                                <tr>
                                                    <td width="100">Invoice Number</td>
                                                    <td width="5">:</td>
                                                    <td>'.@$records[0]['number'].'</td>
                                                </tr>
                                                <tr>
                                                    <td width="100">Invoice Date</td>
                                                    <td width="5">:</td>
                                                    <td>'.@$records[0]['trans_date'].'</td>
                                                </tr>
                                                <tr>
                                                    <td width="100">Order No</td>
                                                    <td width="5">:</td>
                                                    <td>'.@$records[0]['so_number'].'</td>
                                                </tr>
                                                <tr>
                                                    <td width="100">Order Date</td>
                                                    <td width="5">:</td>
                                                    <td>'.@$records[0]['trans_date'].'</td>
                                                </tr>
                                            </table>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                            <hr>
                            <div style="padding:10px;">
                                <table style="width:100%; font-size: 12px;">
                                    <tr>
                                        <td width="300">
                                            <b style="font-size:14px;">' . $config->name . '</b><br>
                                            <span style="font-size:10px;">' . $config->address . '</span><br><br>
                                            <b style="font-size:12px;">CIN NO :</b> '.$config->cin_no.'<br>
                                            <b style="font-size:12px;">GST NO :</b> '.$config->gst_no.'<br>
                                            <b style="font-size:12px;">PAN NO :</b> '.$config->pan_no.'<br>
                                            <b style="font-size:12px;">IRN :</b> <br>
                                        </td>
                                        <td width="200">
                                            <table style="width:100%; font-size: 12px;">
                                                <tr>
                                                    <td width="100"><b>Customer Code</b></td>
                                                    <td width="5">:</td>
                                                    <td width="100">'.@$records[0]['customer_id'].'</td>
                                                </tr>
                                                <tr>
                                                    <td><b>Deliver Doc</b></td>
                                                    <td>:</td>
                                                    <td>'.@$records[0]['dn_number'].'</td>
                                                </tr>
                                                <tr>
                                                    <td><b>PO Number</b></td>
                                                    <td>:</td>
                                                    <td>'.@$records[0]['customer_po'].'</td>
                                                </tr>
                                                <tr>
                                                    <td><b>Ship By</b></td>
                                                    <td>:</td>
                                                    <td>'.@$records[0]['ship_by'].'</td>
                                                </tr>
                                                <tr>
                                                    <td><b>Terms</b></td>
                                                    <td>:</td>
                                                    <td>'.@$records[0]['payment_term'].'</td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td width="100">-</td>
                                    </tr>
                                </table>
                            </div>
                            <hr>
                            <div style="width:100%; float: left; padding: 10px;">
                                <div style="width:46%; height: 120px; float:left; border:1px solid black; font-size:12px !important; padding: 5px; margin-right:20px;">
                                    <b>Details of Consignee (Bill To) :</b><br>
                                    <b>'.@$records[0]['customer_name'].'</b><br>
                                    <span>'.@$records[0]['bill_address'].'</span><br>
                                    <b>PAN NO : </b><span>'.@$records[0]['pan_no'].'</span><br>
                                    <b>GST NO : </b><span>'.@$records[0]['gst_no'].'</span><br>
                                    <b>VENDOR CODE : </b><span>'.@$records[0]['vendor_code'].'</span>
                                </div>
                                <div style="width:46%; height: 120px; float:left; border:1px solid black; font-size:12px !important; padding: 5px;">
                                    <b>Details of Consignee (Ship To) :</b><br>
                                    <b>'.@$records[0]['customer_name'].'</b><br>
                                    <span>'.@$records[0]['ship_address'].'</span><br>
                                    <b>PAN NO : </b><span>'.@$records[0]['pan_no'].'</span><br>
                                    <b>GST NO : </b><span>'.@$records[0]['gst_no'].'</span>
                                </div>
                            </div>
                            <table id="customers">
                                <tr>
                                    <th rowspan="2" width="20">No</th>
                                    <th rowspan="2">Description of Goods</th>
                                    <th rowspan="2">HSN / SAC</th>
                                    <th rowspan="2">Qty</th>
                                    <th rowspan="2" width="60">UOM</th>
                                    <th rowspan="2" width="60">Rate</th>
                                    <th rowspan="2" width="60">Total</th>
                                    <th rowspan="2" width="80">Taxable<br>Value</th>
                                    <th colspan="2" width="60">CGST</th>
                                    <th colspan="2" width="60">SGST / CGST</th>
                                    <th colspan="2" width="60">IGST</th>
                                </tr>
                                <tr>
                                    <th>Rate</th>
                                    <th>Amount</th>
                                    <th>Rate</th>
                                    <th>Amount</th>
                                    <th>Rate</th>
                                    <th>Amount</th>
                                </tr>';
            $sub_qty = 0;
            $sub_total = 0;
            $cgst = 0;
            $sgst = 0;
            $igst = 0;

            for ($a=0; $a < 15; $a++) {
                if(!empty($records[$a]['qty'])){
                    $html .= '  <tr>
                                    <td style="text-align:center; border-top: 0; border-bottom: 0; height:30px;">' . $no . '</td>
                                    <td style="font-size:10px; border-top: 0; border-bottom: 0;">' . $records[$a]['number_customer'] . ' -<br>'.$records[$a]['item_fg_name'].'</td>
                                    <td style="font-size:10px; border-top: 0; border-bottom: 0;">' . $records[$a]['hsn_code'] . '</td>
                                    <td style="text-align:center; border-top: 0; border-bottom: 0;">' . number_format($records[$a]['qty']) . '</td>
                                    <td style="text-align:center; border-top: 0; border-bottom: 0;"><span style="font-size:10px;">' . $records[$a]['uom'] . '</span></td>
                                    <td style="text-align:right; border-top: 0; border-bottom: 0;">' . number_format($records[$a]['price'], 2) . '</td>
                                    <td style="text-align:right; border-top: 0; border-bottom: 0;">' . number_format(($records[$a]['price'] * $records[$a]['qty']), 2) . '</td>
                                    <td style="text-align:right; border-top: 0; border-bottom: 0;">' . number_format((($records[$a]['price'] * $records[$a]['qty']) + $records[$a]['cgst'] + $records[$a]['igst'] + $records[$a]['sgst']), 2) . '</td>
                                    <td style="text-align:right; border-top: 0; border-bottom: 0;">' . number_format($records[$a]['p_cgst'], 2) . ' %</td>
                                    <td style="text-align:right; border-top: 0; border-bottom: 0;">' . number_format($records[$a]['cgst'], 2) . '</td>
                                    <td style="text-align:right; border-top: 0; border-bottom: 0;">' . number_format($records[$a]['p_sgst'], 2) . ' %</td>
                                    <td style="text-align:right; border-top: 0; border-bottom: 0;">' . number_format($records[$a]['sgst'], 2) . '</td>
                                    <td style="text-align:right; border-top: 0; border-bottom: 0;">' . number_format($records[$a]['p_igst'], 2) . ' %</td>
                                    <td style="text-align:right; border-top: 0; border-bottom: 0;">' . number_format($records[$a]['igst'], 2) . '</td>
                                </tr>';

                    $sub_qty += ($records[$a]['qty']);
                    $sub_total += ($records[$a]['price'] * $records[$a]['qty']);
                    $cgst += $records[$a]['cgst'];
                    $sgst += $records[$a]['sgst'];
                    $igst += $records[$a]['igst'];
                }else{
                    $html .= '  <tr>
                                    <td style="text-align:center; border-top: 0; border-bottom: 0; height:30px;">' . $no . '</td>
                                    <td style="text-align:center; border-top: 0; border-bottom: 0;"></td>
                                    <td style="text-align:center; border-top: 0; border-bottom: 0;"></td>
                                    <td style="text-align:center; border-top: 0; border-bottom: 0;"></td>
                                    <td style="text-align:center; border-top: 0; border-bottom: 0;"></td>
                                    <td style="text-align:center; border-top: 0; border-bottom: 0;"></td>
                                    <td style="text-align:center; border-top: 0; border-bottom: 0;"></td>
                                    <td style="text-align:center; border-top: 0; border-bottom: 0;"></td>
                                    <td style="text-align:center; border-top: 0; border-bottom: 0;"></td>
                                    <td style="text-align:center; border-top: 0; border-bottom: 0;"></td>
                                    <td style="text-align:center; border-top: 0; border-bottom: 0;"></td>
                                    <td style="text-align:center; border-top: 0; border-bottom: 0;"></td>
                                    <td style="text-align:center; border-top: 0; border-bottom: 0;"></td>
                                    <td style="text-align:center; border-top: 0; border-bottom: 0;"></td>
                                </tr>';
                }

                $no++;
            }

            $html .= '<tr>
                        <td colspan="3" style="text-align:right"><b>Sub Total</b></td>
                        <td style="text-align:right"><b>' . number_format($sub_qty, 0) . '</b></td>
                        <td style="text-align:right"></td>
                        <td style="text-align:right"></td>
                        <td style="text-align:right"><b>' . number_format($sub_total, 2) . '</b></td>
                        <td style="text-align:right"><b>' . number_format($sub_total, 2) . '</b></td>
                        <td style="text-align:right"></td>
                        <td style="text-align:right"><b>' . number_format($cgst, 2) . '</b></td>
                        <td style="text-align:right"></td>
                        <td style="text-align:right"><b>' . number_format($sgst, 2) . '</b></td>
                        <td style="text-align:right"></td>
                        <td style="text-align:right"><b>' . number_format($igst, 2) . '</b></td>
                    </tr>
                    <tr>
                        <td colspan="9" style="height:50px; padding: 10px;">
                            <b>Total Invoice value in (Words) </b><small>'.$this->convertcurrency->convertCurrencyToWords($sub_total, $records[0]['currency']).'</small><br><br>
                            <div style="float:left; width:50%;">
                                <b>No of Boxes</b><br>
                                <b>Net Weight (KG)</b> : 0.00
                            </div>
                            <div style="float:left; width:50%; text-align:right;">
                                <b>CGST</b> &nbsp; &nbsp; '.number_format($records[0]['p_cgst'], 2).'% &nbsp; &nbsp; '.number_format($cgst, 2).'<br>
                                <b>SGST</b> &nbsp; &nbsp; '.number_format($records[0]['p_sgst'], 2).'% &nbsp; &nbsp; '.number_format($sgst, 2).'
                            </div>
                        </td>
                        <td colspan="5" style="height:50px; padding: 10px;">
                            <div style="float:left; width:50%;">
                                <b>Sub Total</b><br>
                                <b>Total Tax</b><br>
                                <b>Total Invoice Value</b>
                            </div>
                            <div style="float:left; width:50%; text-align:right;">
                                <span>'.number_format($sub_total, 2).'</span><br> 
                                <span>'.number_format($cgst + $sgst + $igst, 2).'</span><br>
                                <span>'.number_format($sub_total + ($cgst + $sgst + $igst), 2).'</span>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="9" style="height:60px; padding: 10px; vertical-align:top;">
                            <b>Comments :</b>
                        </td>
                        <td colspan="5" rowspan="2" style="height:50px; vertical-align:top; padding: 10px;">
                            <b style="font-size:14px;">' . $config->name . '</b>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="9" style="height:100px; vertical-align:top; padding: 10px;">
                            <b>Terms and Condition :</b>
                        </td>
                    </tr>
                </table>';
                

            if ($i + 1 != $page) {
                $html .= '<div style="page-break-after:always;"></div>';
            }
            $html .= '</div></div>';
        }
        $html .= '</div><script>window.print()</script>';
        die($html);
    }

    public function print_dn($invoice)
    {
        $invoice_no = base64_decode($invoice);
        $this->db->select('a.*, b.name as customer_name');
        $this->db->from('sales_invoices a');
        $this->db->join('customers b', 'a.customer_id = b.id');
        $this->db->like('a.number', $invoice_no);
        $this->db->order_by('a.trans_date', 'DESC');
        //$this->db->group_by('a.number');
        $total_invoice = $this->db->get()->result_array();

        $config = $this->db->get('config')->row();
        $config_iso = $this->db->get('config_iso')->row();

        //Config Page
        $rows = 10;
        $page = ceil(count($total_invoice) / $rows);
        //Generate QRcode
        $this->createQrcode(@$invoice_no, "assets/image/qrcode/");
        $html = '<html>
                    <head>
                        <title>' . $invoice_no . '</title>
                        <link rel="icon" href="' . $config->favicon . '" type="image/png" sizes="16x16">
                    </head>
                    <style>
                        body {
                            font-family: Arial, Helvetica, sans-serif;
                        }
                        #customers {
                            border-collapse: collapse;width: 100%;
                            font-size: 12px;
                        }
                        #customers td, #customers th {
                            border: 1px solid black;padding: 2px;
                        }
                        #customers th {
                            padding-top: 2px;
                            padding-bottom: 2px;
                            text-align: center;color: black;
                        }
                        @media screen {
                            .print {
                                display: none !important;
                            }
                        }
            
                        @media print {
                            .noprint {
                                display: none !important;
                            }
                        }
                    </style>
                    <body>
                    <div style="margin:20%;" class="noprint">
                        <center>
                            <h1>Press CTRL + P for Print</h1>
                            <p>Display pages for 10 rows</p>
                            <p>Paper Size A5, Layout Landscape</p>
                            <p>Margin Default, Scale 80</p>
                        </center>
                    </div>
                    <div class="print">';
        $no = 1;
        $hal = 1;
        $subtotal = 0;
        $grand_total_all = 0;
        for ($i = 0; $i < $page; $i++) {
            $this->db->select('a.*, b.name as customer_name, c.number as item_fg_number, c.number_customer, c.name as item_fg_name');
            $this->db->from('sales_invoices a');
            $this->db->join('customers b', 'a.customer_id = b.id');
            $this->db->join('item_fg c', 'a.item_fg_id = c.id');
            $this->db->like('a.number', $invoice_no);
            $this->db->order_by('a.trans_date', 'DESC');
            $this->db->limit(10, ($i * 10));
            $records = $this->db->get()->result_array();

            $html .= '<table style="width:100%;">
                            <tr>
                                <th width="10"><img src="' . $config->favicon . '" width="60" /></th>
                                <td width="450" style="padding:10px;">
                                    <b style="font-size:14px;">' . $config->name . '</b><br>
                                    <span style="font-size:10px;">' . $config->address . '</span><br>
                                </td>
                                <td width="100" style="text-align:right;">
                                    <table style="width:100%; font-size:10px;">
                                        <tr>
                                            <td width="50" rowspan="4"><img src="' . base_url('assets/image/qrcode/' . $invoice_no . '.png') . '" width="60"/></td>
                                            <td width="60">Doc No</td>
                                            <td width="5">:</td>
                                            <td width="100">' . $config_iso->doc_sales_invoice . '</td>
                                        </tr>
                                        <tr>
                                            <td>Form</td>
                                            <td>:</td>
                                            <td>' . $config_iso->form_sales_invoice . '</td>
                                        </tr>
                                        <tr>
                                            <td>Print Date</td>
                                            <td>:</td>
                                            <td>' . date("Y-m-d H:i") . '</td>
                                        </tr>
                                        <tr>
                                            <td>Print By</td>
                                            <td>:</td>
                                            <td>' . $this->session->name . '</td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                        <div style="border: 1px solid black; width:100%;">
                            <div style="padding:10px;">
                                <center>
                                    <h3><u style="padding:5px;">SALES INVOICING</u></h3>
                                </center>
                                <div style="float:left; width:50%;"> 
                                    <table style="width:100%; font-size:12px; margin-bottom:10px;">
                                        <tr>
                                            <td width="150">Customer Name</td>
                                            <td width="30">:</td>
                                            <td><b>' . @$records[0]['customer_name'] . '</b></td>
                                        </tr>
                                        <tr>
                                            <td width="50">Customer PO</td>
                                            <td width="10">:</td>
                                            <td><b>' . @$records[0]['customer_po'] . '</b></td>
                                        </tr>
                                        <tr>
                                            <td width="50">Sales Invoice No</td>
                                            <td width="10">:</td>
                                            <td><b>' . @$invoice_no . '</b></td>
                                        </tr>
                                    </table>
                                </div>
                                <div style="float:left; width:50%;"> 
                                    <table style="width:100%; font-size:12px; margin-bottom:10px;">
                                        <tr>
                                            <td width="100">Date</td>
                                            <td width="30">:</td>
                                            <td><b>' . @date("d F Y", strtotime(@$records[0]['trans_date'])) . '</b></td>
                                        </tr>
                                        <tr>
                                            <td width="100">Payment Term</td>
                                            <td width="30">:</td>
                                            <td><b>' . @$records[0]['payment_term'] . '</b></td>
                                        </tr>
                                        <tr>
                                            <td width="100">Payment Due</td>
                                            <td width="30">:</td>
                                            <td><b>' . @date("d F Y", strtotime(@$records[0]['due_date'])) . '</b></td>
                                        </tr>
                                    </table>
                                </div>
                                <div style="width:100%; text-align: right; font-size:12px;">Page ' . $hal . '/' . $page . '</div>
                                <table id="customers">
                                    <tr>
                                        <th rowspan="2">No</th>
                                        <th rowspan="2">SO No</th>
                                        <th rowspan="2">DN No</th>
                                        <th rowspan="2">Product No</th>
                                        <th rowspan="2">Description</th>
                                        <th rowspan="2">Uom</th>
                                        <th rowspan="2">Qty</th>
                                        <th colspan="7">Original Currency</th>
                                        <th colspan="3">Local Currency</th>
                                    </tr>
                                    <tr>
                                        <th>Currency</th>
                                        <th>Price</th>
                                        <th>Amount</th>
                                        <th>IGST</th>
                                        <th>CGST</th>
                                        <th>SGST</th>
                                        <th>Amount<br>After Tax</th>
                                        <th>Rate</th>
                                        <th>Currency</th>
                                        <th>Amount</th>
                                    </tr>';
            $grand_total = 0;
            $grand_total_local = 0;
            $total_igst = 0;
            $total_sgst = 0;
            $total_cgst = 0;
            foreach ($records as $record) {
                // $grand_total += $record['total'];
                // $grand_total_all += $record['total'];

                $currency = $record['currency'];

                $monthBf = date('Y-m-01', strtotime('-1 month', strtotime($record['trans_date'])));
                $exchange = $this->crud->read('exchange_rates', [], ["start_date" => $monthBf, "currency_from" => $currency, "currency_to" => "INR"]);

                if ($currency != "INR") {
                    if ($exchange) {
                        $price = $exchange->middle;
                    } else {
                        $price = 0;
                    }
                } else {
                    $price = 1;
                }

                $amount = ($record['total_grand_local']);
                if($record['account_type'] == "CREDIT"){
                    $grand_total += $record['total2'];
                    $grand_total_all += $record['total'];
                    $grand_total_local += $amount;
                }else{
                    $grand_total -= $record['total2'];
                    $grand_total_all -= $record['total'];
                    $grand_total_local -= $amount;
                }

                $total_igst += $record['igst'];
                $total_sgst += $record['sgst'];
                $total_cgst += $record['cgst'];

                $html .= '  <tr>
                                <td style="text-align:center">' . $no . '</td>
                                <td>' . $record['so_number'] . '</td>
                                <td>' . $record['dn_number'] . '</td>
                                <td>' . $record['number_customer'] . '</td>
                                <td>' . $record['item_fg_name'] . '</td>
                                <td>' . $record['uom'] . '</td>
                                <td style="text-align:right;">' . @number_format(($record['qty']), 2) . '</td>
                                <td>' . $record['currency'] . '</td>
                                <td style="text-align:right;">' . @number_format($record['price'], 2) . '</td>
                                <td style="text-align:right;">' . @number_format($record['total'], 2) . '</td>
                                <td style="text-align:right;">' . @number_format($record['igst'], 2) . '</td>
                                <td style="text-align:right;">' . @number_format($record['cgst'], 2) . '</td>
                                <td style="text-align:right;">' . @number_format($record['sgst'], 2) . '</td>
                                <td style="text-align:right;">' . @number_format($record['total2'], 2) . '</td>
                                <td style="text-align:right;">' . @number_format($record['rate'], 2) . '</td>
                                <td>INR</td>
                                <td style="text-align:right;">' . @number_format($amount, 2) . '</td>
                            </tr>';
                $no++;
            }

            $html .= '  <tr>
                            <th colspan="13" style="text-align:right">TOTAL</th>
                            <th style="text-align:right">'.number_format($grand_total, 2).'</th>
                            <th></th>
                            <th></th>
                            <th style="text-align:right">'.number_format($grand_total_local, 2).'</th>
                        </tr>
                    </table>';

            if (($i + 1) != $page) {
                $html .= '<div style="page-break-after:always;"></div>';
            }
            $hal++;
        }

        $journals = $this->crud->query("SELECT a.*, b.account_name 
            FROM sales_invoice_journals a 
            JOIN account_coa b ON a.account_number = b.account_number
            WHERE a.number = '$invoice_no' ORDER BY a.flag ASC");

        $html .= '<br><br>
                <div style="width:100%;">
                    <div style="width:50%; float:left;">
                        <table id="customers" style="width:100%; font-size:12px;">
                            <tr>
                                <td style="font-weight:bold;">Account No</td>
                                <td style="font-weight:bold;">Account Name</td>
                                <td style="font-weight:bold;">Debit</td>
                                <td style="font-weight:bold;">Credit</td>
                            </tr>';
        $total_debit = 0;
        $total_credit = 0;
        foreach ($journals as $journal) {

            $total_debit += $journal->debit;
            $total_credit += $journal->credit;

            $html .= '  <tr>
                                <td>' . $journal->account_number . '</td>
                                <td>' . $journal->account_name . '</td>
                                <td style="text-align:right;">' . number_format($journal->debit, 2) . '</td>
                                <td style="text-align:right;">' . number_format($journal->credit, 2) . '</td>
                            </tr>';
        }

        $html .= '      <tr>
                                <td colspan="2">Balance</td>
                                <td style="text-align:right;">' . @number_format($total_debit, 2) . '</td>
                                <td style="text-align:right;">' . @number_format($total_credit, 2) . '</td>
                            </tr>
                        </table>
                    </div>
                    <div style="width:30%; float:left;">
                        &nbsp;
                    </div>
                    <div style="width:20%; float:left;">
                        <table id="customers" style="width:100%; font-size:12px;">
                            <tr>
                                <td style="font-weight:bold;">TAXABLE VALUE</td>
                                <td style="font-weight:bold; text-align:right;">' . @number_format($grand_total_all, 2) . '</td>
                            </tr>
                            <tr>
                                <td style="font-weight:bold;">IGST</td>
                                <td style="font-weight:bold; text-align:right;">' . @number_format(@$total_igst, 2) . '</td>
                            </tr>
                            <tr>
                                <td style="font-weight:bold;">SGST</td>
                                <td style="font-weight:bold; text-align:right;">' . @number_format(@$total_sgst, 2) . '</td>
                            </tr>
                            <tr>
                                <td style="font-weight:bold;">CGST</td>
                                <td style="font-weight:bold; text-align:right;">' . @number_format(@$total_cgst, 2) . '</td>
                            </tr>
                            <tr>
                                <td style="font-weight:bold;">TDS ('.@$records[0]['tds'].')</td>
                                <td style="font-weight:bold; text-align:right;">' . @number_format((($grand_total_all * @$records[0]['individual']) / 100), 2) . '</td>
                            </tr>
                            <tr>
                                <td style="font-weight:bold;">INVOICE VALUE</td>
                                <td style="font-weight:bold; text-align:right;">' . @number_format((@$grand_total_all + $total_igst + $total_sgst + $total_cgst + (($grand_total_all * @$record[0]['tds']) / 100)), 2) . '</td>
                            </tr>
                        </table>
                    </div>
                </div>
                <table style="width:100%; margin-top: 150px; font-size:12px;">
                    <tr>
                        <td style="text-align:center; font-weight:bold;">Prepared By</td>
                        <td style="text-align:center; font-weight:bold;">Checked By</td>
                        <td style="text-align:center; font-weight:bold;">Approved By</td>
                        <td style="text-align:center; font-weight:bold;">Approved By</td>
                    </tr>
                    <tr>
                        <td style="height:60px;"></td>
                        <td style="height:60px;"></td>
                        <td style="height:60px;"></td>
                        <td style="height:60px;"></td>
                    </tr>
                    <tr>
                        <th style="height:20px; text-align:center;">' . $this->session->name . '<hr style="width:60%;margin-left:20%;">User Entry</th>
                        <th style="height:20px; text-align:center;"><br><hr style="width:60%;margin-left:20%;">Purchasing</th>
                        <th style="height:20px; text-align:center;"><br><hr style="width:60%;margin-left:20%;">Accounting Manager</th>
                        <th style="height:20px; text-align:center;"><br><hr style="width:60%;margin-left:20%;">Director</th>
                    </tr>
                </table>
                </div>
            </div>';
        $html .= "</div></div><script>window.print()</script></body>";
        die($html);
    }

    public function print($option = "")
    {
        if ($option == "excel") {
            $format  = date("Ymd");
            header("Content-type: application/vnd-ms-excel");
            header("Content-Disposition: attachment; filename=sales_invoices_$format.xls");
        }

        $filter_type  = base64_decode($this->input->get('filter_type'));
        $filter_trans_date_from = base64_decode($this->input->get('filter_trans_date_from'));
        $filter_trans_date_to = base64_decode($this->input->get('filter_trans_date_to'));
        $filter_due_date_from = base64_decode($this->input->get('filter_due_date_from'));
        $filter_due_date_to = base64_decode($this->input->get('filter_due_date_to'));
        $filter_sales_invoice = base64_decode($this->input->get('filter_sales_invoice'));
        $filter_dn_number = base64_decode($this->input->get('filter_dn_number'));
        $filter_customer = base64_decode($this->input->get('filter_customer'));
        $filter_status = base64_decode($this->input->get('filter_status'));

        //Config
        $this->db->select('*');
        $this->db->from('config');
        $config = $this->db->get()->row();

        $this->db->select('a.*, b.name as customer_name');
        $this->db->from('sales_invoices a');
        $this->db->join('customers b', 'a.customer_id = b.id');
        if ($filter_type == "PID") {
            $this->db->where("a.trans_date between '$filter_trans_date_from' and '$filter_trans_date_to'");
        } elseif ($filter_type == "PAY") {
            $this->db->where("a.due_date between '$filter_due_date_from' and '$filter_due_date_to'");
        }
        $this->db->like('a.number', $filter_sales_invoice);
        $this->db->like('a.dn_number', $filter_dn_number);
        $this->db->like('a.customer_id', $filter_customer);
        $this->db->like('a.status', $filter_status);
        $this->db->order_by('a.status', 'ASC');
        $this->db->order_by('a.trans_date', 'DESC');
        $this->db->group_by('a.number');
        $records = $this->db->get()->result_array();

        $html = '<html><head><title>Print Data</title></head><style>body {font-family: Arial, Helvetica, sans-serif;}#customers {border-collapse: collapse;width: 100%;font-size: 12px;}#customers td, #customers th {border: 1px solid #ddd;padding: 2px;}#customers tr:nth-child(even){background-color: #f2f2f2;}#customers tr:hover {background-color: #ddd;}#customers th {padding-top: 2px;padding-bottom: 2px;text-align: center;color: black;}</style><body>
            <center>
                <div style="float: left; font-size: 12px; text-align: left;">
                    <table style="width: 100%;">
                        <tr>
                            <td width="50" style="font-size: 12px; vertical-align: top; text-align: center; vertical-align:jus margin-right:10px;">
                                <img src="' . $config->favicon . '" width="30">
                            </td>
                            <td style="font-size: 14px; text-align: left; margin:2px;">
                                <b>' . $config->name . '</b><br>
                                <small>REPORT SALES INVOICING</small><br>
                            </td>
                        </tr>
                    </table>
                </div>
                <div style="float: right; font-size: 12px; text-align: right;">
                    Print Date ' . date("d M Y H:i:s") . ' <br>
                    Print By ' . $this->session->username . '  
                </div>
            </center>
            <br><br><br><br>
            
            <table id="customers" border="1">
                <tr>
                    <th width="20">No</th>
                    <th>Customer Invoice</th>
                    <th>Customer Name</th>
                    <th>Trans Date</th>
                    <th>Due Date</th>
                    <th>Sub Total</th>
                    <th>VAT</th>
                    <th>PPH 23</th>
                    <th colspan="3">Grand Total</th>
                </tr>';
        $no = 1;
        foreach ($records as $data) {
            $number = $data['number'];

            $this->db->select('a.*, c.number as item_fg_number, c.number_customer, c.name as item_fg_name');
            $this->db->from('sales_invoices a');
            $this->db->join('customers b', 'a.customer_id = b.id');
            $this->db->join('item_fg c', 'a.item_fg_id = c.id');
            $this->db->where('a.number', $number);
            $this->db->order_by('a.status', 'ASC');
            $this->db->order_by('a.trans_date', 'DESC');
            $details = $this->db->get()->result_array();

            $html .= '  <tr>
                            <td style="text-align:center">' . $no . '</td>
                            <td>' . $data['number'] . '</td>
                            <td>' . $data['customer_name'] . '</td>
                            <td>' . $data['trans_date'] . '</td>
                            <td>' . $data['due_date'] . '</td>
                            <td style="text-align:right;">' . number_format($data['total_sub'], 4) . '</td>
                            <td style="text-align:right;">' . number_format($data['total_vat'], 4) . '</td>
                            <td style="text-align:right;">' . number_format($data['total_pph'], 4) . '</td>
                            <td colspan="3" style="text-align:right;">' . number_format($data['total_grand'], 4) . '</td>
                        </tr>';
            $html .= '  <tr>
                            <td colspan="11" style="background:#D1FFC6;"><b>DETAIL OF ' . $data['number'] . '</b></td>
                        </tr>
                        <tr>
                            <th width="20"></th>
                            <th>DN No</th>
                            <th>SO No</th>
                            <th>Product No EBWS</th>
                            <th>Product No Customer</th>
                            <th>Description</th>
                            <th>Qty</th>
                            <th>UoM</th>
                            <th>Currency</th>
                            <th>Unit Price</th>
                            <th>Amount</th>
                        </tr>';
            foreach ($details as $detail) {
                $html .= '  <tr>
                                <td></td>
                                <td>' . $detail['dn_number'] . '</td>
                                <td>' . $detail['so_number'] . '</td>
                                <td>' . $detail['item_fg_number'] . '</td>
                                <td>' . $detail['number_customer'] . '</td>
                                <td>' . $detail['item_fg_name'] . '</td>
                                <td style="text-align:right">' . number_format($detail['qty'], 2) . '</td>
                                <td>' . $detail['uom'] . '</td>
                                <td>' . $detail['currency'] . '</td>
                                <td style="text-align:right">' . number_format($detail['price'], 4) . '</td>
                                <td style="text-align:right">' . number_format($detail['total'], 4)  . '</td>
                            </tr>';
            }
            $no++;
        }
        $html .= '</table></body></html>';
        echo $html;
    }

    public function printDetail($option = "")
    {
        if ($option == "excel") {
            $format  = date("Ymd");
            header("Content-type: application/vnd-ms-excel");
            header("Content-Disposition: attachment; filename=sales_invoices_details_$format.xls");
        }

        $filter_type  = base64_decode($this->input->get('filter_type'));
        $filter_trans_date_from = base64_decode($this->input->get('filter_trans_date_from'));
        $filter_trans_date_to = base64_decode($this->input->get('filter_trans_date_to'));
        $filter_due_date_from = base64_decode($this->input->get('filter_due_date_from'));
        $filter_due_date_to = base64_decode($this->input->get('filter_due_date_to'));
        $filter_sales_invoice = base64_decode($this->input->get('filter_sales_invoice'));
        $filter_dn_number = base64_decode($this->input->get('filter_dn_number'));
        $filter_customer = base64_decode($this->input->get('filter_customer'));
        $filter_status = base64_decode($this->input->get('filter_status'));

        if ($filter_type == "PID") {
            $periode =  $filter_trans_date_from . ' to ' . $filter_trans_date_to;
            $period_due =  "-";
        } elseif ($filter_type == "PAY") {
            $period_due =  $filter_due_date_from . ' to ' . $filter_due_date_to;
            $periode =  "-";
        }

        //Config
        $this->db->select('*');
        $this->db->from('config');
        $config = $this->db->get()->row();

        $this->db->select('a.*, b.name as customer_name, c.name as journal_type_name, d.total_sub, e.account_name, c.number as item_fg_number, c.number_customer, c.name as item_fg_name');
        $this->db->from('sales_invoices a');
        $this->db->join('customers b', 'a.customer_id = b.id');
        $this->db->join('journal_types c', 'a.journal_type_id = c.id');
        $this->db->join('item_fg c', 'a.item_fg_id = c.id');
        $this->db->join("(SELECT number, SUM(total) as total_sub FROM sales_invoices GROUP BY number) d", 'a.number = d.number');
        $this->db->join('account_coa e', 'a.account_number = e.account_number', 'left');
        if ($filter_type == "PID") {
            $this->db->where("a.trans_date between '$filter_trans_date_from' and '$filter_trans_date_to'");
        } elseif ($filter_type == "PAY") {
            $this->db->where("a.due_date between '$filter_due_date_from' and '$filter_due_date_to'");
        }
        $this->db->like('a.number', $filter_sales_invoice);
        $this->db->like('a.dn_number', $filter_dn_number);
        $this->db->like('a.customer_id', $filter_customer);
        $this->db->like('a.status', $filter_status);
        $this->db->order_by('a.status', 'ASC');
        $this->db->order_by('a.customer_id', 'ASC');
        $this->db->order_by('a.number', 'ASC');
        $records = $this->db->get()->result_array();

        $html = '<html><head><title>Print Data</title></head><style>body {font-family: Arial, Helvetica, sans-serif;}#customers {border-collapse: collapse;width: 100%;font-size: 12px;}#customers td, #customers th {border: 1px solid #ddd;padding: 2px;}#customers tr:nth-child(even){background-color: #f2f2f2;}#customers tr:hover {background-color: #ddd;}#customers th {padding-top: 2px;padding-bottom: 2px;text-align: center;color: black;}</style><body>
            <center>
                <div style="float: left; font-size: 12px; text-align: left;">
                    <table style="width: 100%;">
                        <tr>
                            <td width="50" style="font-size: 12px; vertical-align: top; text-align: center; vertical-align:jus margin-right:10px;">
                                <img src="' . $config->favicon . '" width="30">
                            </td>
                            <td style="font-size: 14px; text-align: left; margin:2px;">
                                <b>' . $config->name . '</b><br>
                            </td>
                        </tr>
                    </table>
                </div>
                <div style="float: right; font-size: 12px; text-align: right;">
                    Print Date ' . date("d M Y H:i:s") . ' <br>
                    Print By ' . $this->session->username . '  
                </div>
            </center>
            <br><br>
            <center>
                <h2>REPORT SALES INVOICE DETAIL</h2>
            </center>
            <br><br>
            <table style="width:50%;">
                <tr>
                    <td width="100">Trans Date</td>
                    <td width="20">:</td>
                    <td>' . $periode . '</td>
                </tr>
                <tr>
                    <td width="100">Payment Due</td>
                    <td width="20">:</td>
                    <td>' . $period_due . '</td>
                </tr>
            </table>
            <br><br>
            
            <table id="customers" border="1">
                <tr>
                    <th width="20">No</th>
                    <th>Journal Type</th>
                    <th>Sales Invoice No</th>
                    <th>Customer Name</th>
                    <th>Trans Date</th>
                    <th>Receipt Due</th>
                    <th>Payment Term</th>
                    <th>Sub Total</th>
                    <th>VAT</th>
                    <th>PPH 23</th>
                    <th>Grand Total</th>
                    <th>Remarks</th>
                    <th>Delivery Note</th>
                    <th>SO No</th>
                    <th>Customer PO</th>
                    <th>Product No EBWS</th>
                    <th>Product No Customer</th>
                    <th>Product Name</th>
                    <th>UoM</th>
                    <th>Qty</th>
                    <th>Currency</th>
                    <th>Unit Price</th>
                    <th>Amount</th>
                    <th>Account No</th>
                    <th>Account Name</th>
                    <th>Debit/Credit</th>
                    <th>Created By</th>
                </tr>';
        $no = 1;
        foreach ($records as $data) {
            $html .= '  <tr>
                            <td style="text-align:center">' . $no . '</td>
                            <td>' . $data['journal_type_name'] . '</td>
                            <td>' . $data['number'] . '</td>
                            <td>' . $data['customer_name'] . '</td>
                            <td>' . $data['trans_date'] . '</td>
                            <td>' . $data['due_date'] . '</td>
                            <td>' . $data['payment_term'] . '</td>
                            <td style="text-align:right;">' . $data['total_sub'] . '</td>
                            <td style="text-align:right;">' . $data['total_vat'] . '</td>
                            <td style="text-align:right;">' . $data['total_pph'] . '</td>
                            <td style="text-align:right;">' . ($data['total_sub'] + $data['total_vat'] - $data['total_pph']) . '</td>
                            <td>' . $data['remarks'] . '</td>
                            <td>' . $data['dn_number'] . '</td>
                            <td>' . $data['so_number'] . '</td>
                            <td>' . $data['customer_po'] . '</td>
                            <td>' . $data['item_fg_number'] . '</td>
                            <td>' . $data['number_customer'] . '</td>
                            <td>' . $data['item_fg_name'] . '</td>
                            <td>' . $data['uom'] . '</td>
                            <td>' . $data['qty'] . '</td>
                            <td>' . $data['currency'] . '</td>
                            <td>' . $data['price'] . '</td>
                            <td>' . $data['total'] . '</td>
                            <td>' . $data['account_number'] . '</td>
                            <td>' . $data['account_name'] . '</td>
                            <td>' . $data['account_type'] . '</td>
                            <td>' . $data['created_by'] . '</td>
                        </tr>';
            $no++;
        }

        $html .= '</table></body></html>';
        echo $html;
    }

    public function printJournal($option = "")
    {
        if ($option == "excel") {
            $format  = date("Ymd");
            header("Content-type: application/vnd-ms-excel");
            header("Content-Disposition: attachment; filename=sales_invoices_journals_$format.xls");
        }

        $filter_type  = base64_decode($this->input->get('filter_type'));
        $filter_trans_date_from = base64_decode($this->input->get('filter_trans_date_from'));
        $filter_trans_date_to = base64_decode($this->input->get('filter_trans_date_to'));
        $filter_due_date_from = base64_decode($this->input->get('filter_due_date_from'));
        $filter_due_date_to = base64_decode($this->input->get('filter_due_date_to'));
        $filter_sales_invoice = base64_decode($this->input->get('filter_sales_invoice'));
        $filter_dn_number = base64_decode($this->input->get('filter_dn_number'));
        $filter_customer = base64_decode($this->input->get('filter_customer'));
        $filter_status = base64_decode($this->input->get('filter_status'));

        if ($filter_type == "PID") {
            $periode =  $filter_trans_date_from . ' to ' . $filter_trans_date_to;
            $period_due =  "-";
        } elseif ($filter_type == "PAY") {
            $period_due =  $filter_due_date_from . ' to ' . $filter_due_date_to;
            $periode =  "-";
        } else {
            $periode =  "-";
            $period_due =  "-";
        }

        //Config
        $this->db->select('*');
        $this->db->from('config');
        $config = $this->db->get()->row();

        $this->db->select('a.*, b.trans_date, b.due_date, b.currency, c.name as customer_name, d.name as journal_type_name, e.account_name');
        $this->db->from('sales_invoice_journals a');
        $this->db->join('sales_invoices b', 'a.number = b.number');
        $this->db->join('customers c', 'b.customer_id = c.id');
        $this->db->join('journal_types d', 'b.journal_type_id = d.id');
        $this->db->join('account_coa e', 'a.account_number = e.account_number', 'left');
        if ($filter_type == "PID") {
            $this->db->where("b.trans_date between '$filter_trans_date_from' and '$filter_trans_date_to'");
        } elseif ($filter_type == "PAY") {
            $this->db->where("b.due_date between '$filter_due_date_from' and '$filter_due_date_to'");
        }
        $this->db->like('b.number', $filter_sales_invoice);
        $this->db->like('b.dn_number', $filter_dn_number);
        $this->db->like('b.customer_id', $filter_customer);
        $this->db->like('b.status', $filter_status);
        $this->db->group_by('a.number');
        $this->db->group_by('a.account_number');
        $this->db->order_by('b.customer_id', 'ASC');
        $this->db->order_by('b.number', 'ASC');
        $this->db->order_by('a.flag', 'ASC');
        $records = $this->db->get()->result_array();

        $html = '<html><head><title>Print Data</title></head><style>body {font-family: Arial, Helvetica, sans-serif;}#customers {border-collapse: collapse;width: 100%;font-size: 12px;}#customers td, #customers th {border: 1px solid #ddd;padding: 2px;}#customers tr:nth-child(even){background-color: #f2f2f2;}#customers tr:hover {background-color: #ddd;}#customers th {padding-top: 2px;padding-bottom: 2px;text-align: center;color: black;}</style><body>
            <center>
                <div style="float: left; font-size: 12px; text-align: left;">
                    <table style="width: 100%;">
                        <tr>
                            <td width="50" style="font-size: 12px; vertical-align: top; text-align: center; vertical-align:jus margin-right:10px;">
                                <img src="' . $config->favicon . '" width="30">
                            </td>
                            <td style="font-size: 14px; text-align: left; margin:2px;">
                                <b>' . $config->name . '</b><br>
                            </td>
                        </tr>
                    </table>
                </div>
                <div style="float: right; font-size: 12px; text-align: right;">
                    Print Date ' . date("d M Y H:i:s") . ' <br>
                    Print By ' . $this->session->username . '  
                </div>
            </center>
            <br><br>
            <center>
                <h2>REPORT SALES INVOICE JOURNAL</h2>
            </center>
            <br><br>
            <table style="width:50%;">
                <tr>
                    <td width="100">Trans Date</td>
                    <td width="20">:</td>
                    <td>' . $periode . '</td>
                </tr>
                <tr>
                    <td width="100">Payment Due</td>
                    <td width="20">:</td>
                    <td>' . $period_due . '</td>
                </tr>
            </table>
            <br><br>
            
            <table id="customers" border="1">
                <tr>
                    <th width="20">No</th>
                    <th>Journal Type</th>
                    <th>Sales Invoice No</th>
                    <th>Customer Name</th>
                    <th>Trans Date</th>
                    <th>Receipt Due</th>
                    <th>Currency</th>
                    <th>Account No</th>
                    <th>Account Name</th>
                    <th>Debit</th>
                    <th>Credit</th>
                </tr>';
        $no = 1;
        foreach ($records as $data) {
            $html .= '  <tr>
                            <td style="text-align:center">' . $no . '</td>
                            <td>' . $data['journal_type_name'] . '</td>
                            <td>' . $data['number'] . '</td>
                            <td>' . $data['customer_name'] . '</td>
                            <td>' . $data['trans_date'] . '</td>
                            <td>' . $data['due_date'] . '</td>
                            <td>' . $data['currency'] . '</td>
                            <td>' . $data['account_number'] . '</td>
                            <td>' . $data['account_name'] . '</td>
                            <td>' . $data['debit'] . '</td>
                            <td>' . $data['credit'] . '</td>
                        </tr>';
            $no++;
        }

        $html .= '</table></body></html>';
        echo $html;
    }
}
