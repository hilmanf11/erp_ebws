<?php
date_default_timezone_set("Asia/Bangkok");
defined('BASEPATH') or exit('No direct script access allowed');

class Generate_mps extends CI_Controller
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
        $this->form_validation->set_rules('product_no', 'Product No', 'required|min_length[2]|max_length[50]|is_unique[generate_mps.product_no]');
    }

    public function index()
    {
        if (empty($this->session->username)) {
            redirect('error_session');
        } elseif ($this->checkuserAccess($this->id_menu()) > 0) {
            $data['button'] = $this->getbutton($this->id_menu());
            $this->load->view('template/header', $data);
            $this->load->view('planning/generate_mps');
        } else {
            redirect('error_access');
        }
    }

    public function readYears()
    {
        $tahun_before = date('Y', strtotime('-7 year', strtotime(date('Y'))));
        $tahun_next = date('Y', strtotime('+1 year', strtotime(date('Y'))));
        for ($i = $tahun_next; $i >= $tahun_before; $i--) {
            $arr[] = array("id" => $i, "name" => $i);
        }

        echo json_encode($arr);
    }

    public function readMonths()
    {
        $months = array('01' => 'January', '02' => 'February', '03' => 'March', '04' => 'April', '05' => 'May', '06' => 'June', '07' => 'July', '08' => 'August', '09' => 'September', '10' => 'October', '11' => 'November', '12' => 'December');
        foreach ($months as $key => $value) {
            $arr[] = array("id" => $key, "name" => $value);
        }

        echo json_encode($arr);
    }

    public function readRevisions()
    {
        $arr = array(
            ["id" => "0", "name" => "Revision 0"],
            ["id" => "1", "name" => "Revision 1"],
            ["id" => "2", "name" => "Revision 2"],
            ["id" => "3", "name" => "Revision 3"],
            ["id" => "4", "name" => "Revision 4"],
            ["id" => "5", "name" => "Revision 5"],
        );

        echo json_encode($arr);
    }

    public function getData()
    {
        if ($this->input->get()) {
            //Filter Data
            $filter_month = base64_decode($this->input->get('filter_month'));
            $filter_year = base64_decode($this->input->get('filter_year'));
            $filter_cutoff = base64_decode($this->input->get('filter_cutoff'));
            $filter_customer = base64_decode($this->input->get('filter_customer'));
            $filter_product_no = base64_decode($this->input->get('filter_product_no'));
            $filter_revision = base64_decode($this->input->get('filter_revision'));

            $monthBack = date('F Y', strtotime('-1 month', strtotime($filter_year . "-" . $filter_month . "-01")));
            $varBackYear = date('Y', strtotime('+1 month', strtotime($filter_year . "-" . $filter_month . "-01")));
            $varBackMonth = date('m', strtotime('+1 month', strtotime($filter_year . "-" . $filter_month . "-01")));
            $period = date("Y-m-t", strtotime("-1 month", strtotime($filter_year . "-" . $filter_month."-01")));
            $period2 = $filter_year.$filter_month;

            //Configuration Planning
            $this->db->select('*');
            $this->db->from("config");
            $config = $this->db->get()->row();

            //Select Query
            $this->db->select('a.id, a.number, a.name, a.leadtime, b.customer_id,
                COALESCE(c.pp, 0) as pp, 
                COALESCE(c.wc, 0) as wc, 
                COALESCE(c.ha, 0) as ha, 
                COALESCE(c.c, 0) as c,
                COALESCE(c.v, 0) as v,
                COALESCE(c.p, 0) as p,
                COALESCE(c.rfg, 0) as rfg,
                COALESCE(c.pp + c.wc + c.ha + c.c + c.v + c.p + c.rfg, 0) as total_wip, 
                COALESCE(d.qty, 0) as fg, 
                COALESCE(e.qty, 0) as os_mpp, 
                COALESCE(f.outstanding, 0) as os_so');
            $this->db->from('item_fg a');
            $this->db->join('customer_items b', 'a.id = b.item_fg_id');
            $this->db->join('stock_wip c', "a.id = c.item_fg_id and c.p_month = '" . $filter_month . "' and c.p_year = '" . $filter_year . "' and c.revision = '" . $filter_revision . "'", "left");
            $this->db->join("(SELECT b.period, b.item_fg_id, b.customer_id, SUM(a.qty) as qty FROM scan_item_receipts_fg a JOIN production_schedules b ON a.workorder = b.workorder WHERE a.status = 0 GROUP BY b.period, b.item_fg_id) d", "a.id = d.item_fg_id and b.customer_id = d.customer_id and d.period = '$period2'", "left");
            $this->db->join("(SELECT period, item_fg_id, customer_id, SUM(qty) as qty FROM production_schedules GROUP BY period) e", "a.id = e.item_fg_id and b.customer_id = e.customer_id and e.period = '$period2'", "left");
            $this->db->join("(SELECT item_fg_id, customer_id, SUM(outstanding) as outstanding FROM sales_orders WHERE sales_order_date <= '$filter_cutoff' and status = 0 GROUP BY customer_id, item_fg_id) f", "a.id = f.item_fg_id and b.customer_id = f.customer_id", "left");
            if ($filter_customer != "") {
                $this->db->where('b.id', $filter_customer);
            }
            if ($filter_product_no != "") {
                $this->db->where('a.id', $filter_product_no);
            }
            $this->db->group_by('b.customer_id');
            $this->db->group_by('b.item_fg_id');
            $this->db->order_by('a.number', 'asc');
            $records = $this->db->get()->result_array();

            foreach ($records as $data) {
                $totalStock = ($data['total_wip'] + $data['fg'] + $data['os_mpp']);
                if ($data['fg'] == null) {
                    $fg = "0";
                } else {
                    $fg = $data['fg'];
                }

                $i = 1;
                $beginBalance = 0;
                $soData = 0;
                $forecastData = 0;
                $deliveryRate = 0;
                $ito = 0;
                $safetyStock = 0;
                $prodPlan = 0;
                $arrMonth = array();

                $monthStart = strtotime($filter_year . "-" . $filter_month . "-01");
                $monthEnd =  strtotime(date('Y-m-d', strtotime('+5 month', strtotime($varBackYear . "-" . $varBackMonth . "-01"))));

                //Cek Forecasts
                // $item_fg_id = $data['id'];
                // $customer_id = $data['customer_id'];
                // $qForecast = $this->db->query("SELECT *, SUM(month_1) as month_1 FROM forecasts WHERE item_fg_id = '$item_fg_id' and customer_id = '$customer_id' and p_year = '$filter_year' and revision = '$filter_revision'");
                // $forecast = $qForecast->row();
                $forecast = $this->crud->read('forecasts', [], ["item_fg_id" => $data['id'], "customer_id" => $data['customer_id'], "p_month" => $filter_month, "p_year" => $filter_year, "revision" => $filter_revision]);

                while ($monthStart < $monthEnd) {
                    $monthName = date('F Y', $monthStart);
                    $monthName2 = date('Y-m-01', $monthStart);
                    $monthName3 = date("Y-m", $monthStart);

                    // $monthsPlus = strtolower(date('F', strtotime('+1 month', $monthStart)));
                    $start = strtotime(date('Y-m-01', $monthStart));
                    $finish = strtotime(date('Y-m-t', $monthStart));

                    $start2 = strtotime(date('Y-m-01', strtotime('+1 month', $monthStart)));
                    $finish2 = strtotime(date('Y-m-t', strtotime('+1 month', $monthStart)));

                    //Sales Order
                    $sales_order = $this->crud->query("SELECT SUM(qty) as qty FROM sales_orders WHERE item_fg_id = '$data[id]' and customer_id = '$data[customer_id]' and sales_order_date between '$monthName2' and '$filter_cutoff'");

                    //HKW 1
                    $hkw = 0;
                    for ($z = $start; $z <= $finish; $z += (60 * 60 * 24)) {
                        $working_date = date('Y-m-d', $z);

                        $this->db->select('remarks');
                        $this->db->from('calendars');
                        $this->db->where('working_date', $working_date);
                        $holiday = $this->db->get()->row();

                        // if (date('w', $z) !== '0' && date('w', $z) !== '6') {
                            if (@$holiday->remarks != null or @$holiday->remarks != "") {
                                $hkw += 0;
                            } else {
                                $hkw += 1;
                            }
                        // } else {
                            // $hkw += 0;
                        // }
                    }

                    //HKW 2
                    $hkw2 = 0;
                    for ($x = $start2; $x <= $finish2; $x += (60 * 60 * 24)) {
                        $working_date2 = date('Y-m-d', $x);

                        $this->db->select('remarks');
                        $this->db->from('calendars');
                        $this->db->where('working_date', $working_date2);
                        $holiday2 = $this->db->get()->row();

                        // if (date('w', $x) !== '0') {
                            if (@$holiday2->remarks != null or @$holiday2->remarks != "") {
                                $hkw2 += 0;
                            } else {
                                $hkw2 += 1;
                            }
                        // } else {
                        //     $hkw2 += 0;
                        // }
                    }

                    //Bulan Pertama - Keenam
                    if ($i == 1) {
                        $beginBalance = $totalStock - $data['os_so'];
                        $soData = @round($sales_order[0]->qty);
                        $forecastData = @round($forecast->month_1);
                        if($soData > $forecastData){ $qtySoFc = $soData; }else{ $qtySoFc = $forecastData; }
                        $deliveryRate = @round($qtySoFc / $hkw);
                        $ito = @round($beginBalance / $deliveryRate);
                        $safetyStock = @round(((@$data['leadtime'] + $config->fg_ss) / $hkw2) * $forecast->month_2);
                        $prodPlan = @round(($qtySoFc + $safetyStock) - $beginBalance);
                    } else if ($i == 2) {
                        $beginBalance = (($prodPlan + $beginBalance) - $forecastData - $safetyStock);
                        $soData = @round($sales_order[0]->qty);
                        $forecastData = @round($forecast->month_2);
                        if($soData > $forecastData){ $qtySoFc = $soData; }else{ $qtySoFc = $forecastData; }
                        $deliveryRate = @round($qtySoFc / $hkw);
                        $ito = @round($beginBalance / $deliveryRate);
                        $safetyStock = @round(((@$data['leadtime'] + $config->fg_ss) / $hkw2) * $forecast->month_3);
                        $prodPlan = @round(($qtySoFc + $safetyStock) - $beginBalance);
                    } elseif ($i == 3) {
                        $beginBalance = (($prodPlan + $beginBalance) - $forecastData - $safetyStock);
                        $soData = @round($sales_order[0]->qty);
                        $forecastData = @round($forecast->month_3);
                        if($soData > $forecastData){ $qtySoFc = $soData; }else{ $qtySoFc = $forecastData; }
                        $deliveryRate = @round($qtySoFc / $hkw);
                        $ito = @round($beginBalance / $deliveryRate);
                        $safetyStock = @round(((@$data['leadtime'] + $config->fg_ss) / $hkw2) * $forecast->month_4);
                        $prodPlan = @round(($qtySoFc + $safetyStock) - $beginBalance);
                    } elseif ($i == 4) {
                        $beginBalance = (($prodPlan + $beginBalance) - $forecastData - $safetyStock);
                        $soData = @round($sales_order[0]->qty);
                        $forecastData = @round($forecast->month_4);
                        if($soData > $forecastData){ $qtySoFc = $soData; }else{ $qtySoFc = $forecastData; }
                        $deliveryRate = @round($qtySoFc / $hkw);
                        $ito = @round($beginBalance / $deliveryRate);
                        $safetyStock = @round(((@$data['leadtime'] + $config->fg_ss) / $hkw2) * $forecast->month_5);
                        $prodPlan = @round(($qtySoFc + $safetyStock) - $beginBalance);
                    } elseif ($i == 5) {
                        $beginBalance = (($prodPlan + $beginBalance) - $forecastData - $safetyStock);
                        $soData = @round($sales_order[0]->qty);
                        $forecastData = @round($forecast->month_5);
                        if($soData > $forecastData){ $qtySoFc = $soData; }else{ $qtySoFc = $forecastData; }
                        $deliveryRate = @round($qtySoFc / $hkw);
                        $ito = @round($beginBalance / $deliveryRate);
                        $safetyStock = @round(((@$data['leadtime'] + $config->fg_ss) / $hkw2) * $forecast->month_6);
                        $prodPlan = @round(($qtySoFc + $safetyStock) - $beginBalance);
                    } elseif ($i == 6) {
                        $beginBalance = (($prodPlan + $beginBalance) - $forecastData - $safetyStock);
                        $soData = @round($sales_order[0]->qty);
                        $forecastData = @round($forecast->month_6);
                        if($soData > $forecastData){ $qtySoFc = $soData; }else{ $qtySoFc = $forecastData; }
                        $deliveryRate = @round($qtySoFc / $hkw);
                        $ito = @round($beginBalance / $deliveryRate);
                        $safetyStock = @round(((@$data['leadtime'] + $config->fg_ss) / $hkw2) * $forecast->month_6);
                        $prodPlan = @round(($qtySoFc + $safetyStock) - $beginBalance);
                    }

                    if ($prodPlan <= 0) {
                        $prodPlanFinal = 0;
                    } else {
                        $prodPlanFinal = $prodPlan;
                    }

                    $arrMonth[] = array(
                        "p_month" => $filter_month,
                        "p_year" => $filter_year,
                        "revision" => $filter_revision,
                        "customer_id" => $data['customer_id'],
                        "item_fg_id" => $data['id'],
                        "ltpp_month" => strtoupper($monthName),
                        "ltpp_month2" => $monthName2,
                        "hkw" => "$hkw2",
                        "begin_balance" => "$beginBalance",
                        "ito" => "$ito",
                        "so" => "$soData",
                        "forecast" => "$forecastData",
                        "delivery_rate" => "$deliveryRate",
                        "safety_stock" => "$safetyStock",
                        "prod_plan" => "$prodPlanFinal"
                    );

                    $monthStart = strtotime("+1 month", $monthStart);
                    $i++;

                    $beginBalance = $beginBalance;
                    $forecastData = $qtySoFc;
                    $deliveryRate = $deliveryRate;
                    $ito = $ito;
                    $safetyStock = $safetyStock;
                    $prodPlan = $prodPlanFinal;
                    $balance = (($prodPlan + $beginBalance) - $forecastData);
                }

                $arr[] = array(
                    "p_month" => $filter_month,
                    "p_year" => $filter_year,
                    "revision" => $filter_revision,
                    "customer_id" => $data['customer_id'],
                    "item_fg_id" => $data['id'],
                    "wip_month" => strtoupper($monthBack),
                    "pp" => $data['pp'],
                    "wc" => $data['wc'],
                    "ha" => $data['ha'],
                    "c" => $data['c'],
                    "v" => $data['v'],
                    "p" => $data['p'],
                    "rfg" => $data['rfg'],
                    "fg" => $fg,
                    "os_mpp" => $data['os_mpp'],
                    "total_stock" => "$totalStock",
                    "os_so" => $data['os_so'],
                    "balance" => "$balance",
                    "details" => $arrMonth
                );
            }

            $arr['total'] = @count($arr);
            die(json_encode($arr));
        } else {
            show_error("Cannot Process your request");
        }
    }

    public function revision()
    {
        $filter_month = $this->input->post('filter_month');
        $filter_year = $this->input->post('filter_year');

        $this->db->select('revision');
        $this->db->from('generate_mps');
        if ($filter_month != "" or $filter_year != "") {
            $this->db->where('p_month', $filter_month);
            $this->db->where('p_year', $filter_year);
        }
        $this->db->where('deleted', 0);
        $this->db->group_by('revision');
        $this->db->order_by('revision', 'desc');
        $this->db->limit(1);
        $record = $this->db->get()->row();
        echo @$record->revision ? $record->revision : 0;
    }

    public function checkForecast()
    {
        $filter_month = base64_decode($this->input->get('filter_month'));
        $filter_year = base64_decode($this->input->get('filter_year'));
        $filter_revision = base64_decode($this->input->get('filter_revision'));

        //Select Query
        $this->db->select('*');
        $this->db->from('forecasts');
        $this->db->where("approved_to = ''");
        if ($filter_month != "" or $filter_year != "") {
            $this->db->where('p_month', $filter_month);
            $this->db->where('p_year', $filter_year);
        }
        $this->db->like('revision', $filter_revision);
        $records = $this->db->get()->result_array();
        
        if (count($records) > 0) {
            echo json_encode(array("theme" => "success"));
        } else {
            echo json_encode(array("theme" => "error"));
        }
    }

    public function checkFg()
    {
        $filter_month = base64_decode($this->input->get('filter_month'));
        $filter_year = base64_decode($this->input->get('filter_year'));
        $filter_revision = base64_decode($this->input->get('filter_revision'));

        //Select Query
        // $this->db->select('*');
        // $this->db->from('stock_fg');
        // $this->db->where("approved_to = ''");
        // if ($filter_month != "" or $filter_year != "") {
        //     $this->db->where('p_month', $filter_month);
        //     $this->db->where('p_year', $filter_year);
        // }
        // $this->db->like('revision', $filter_revision);
        // $records = $this->db->get()->result_array();

        // if (count($records) > 0) {
            echo json_encode(array("theme" => "success"));
        // } else {
            // echo json_encode(array("theme" => "error"));
        // }
    }

    public function checkOs()
    {
        $filter_month = base64_decode($this->input->get('filter_month'));
        $filter_year = base64_decode($this->input->get('filter_year'));
        $filter_revision = base64_decode($this->input->get('filter_revision'));
        $period = $filter_year . "-" . $filter_month;

        //Select Query
        $this->db->select('*');
        $this->db->from('sales_orders');
        $this->db->where("status", 0);
        $this->db->like("sales_order_date", $period);
        $records = $this->db->get()->result_array();

        if (count($records) > 0) {
            echo json_encode(array("theme" => "success"));
        } else {
            echo json_encode(array("theme" => "error"));
        }
    }

    public function checkOstSo()
    {
        $filter_month = base64_decode($this->input->get('filter_month'));
        $filter_year = base64_decode($this->input->get('filter_year'));
        $filter_revision = base64_decode($this->input->get('filter_revision'));
        $period = date("Y-m-t", strtotime("-1 month", strtotime($filter_year . "-" . $filter_month."-01")));

        //Select Query
        $this->db->select('*');
        $this->db->from('sales_orders');
        $this->db->where("status", 0);
        $this->db->where("sales_order_date <=", $period);
        $records = $this->db->get()->result_array();

        if (count($records) > 0) {
            echo json_encode(array("theme" => "success"));
        } else {
            echo json_encode(array("theme" => "error"));
        }
    }

    public function checkStockWip()
    {
        $filter_month = base64_decode($this->input->get('filter_month'));
        $filter_year = base64_decode($this->input->get('filter_year'));
        $filter_revision = base64_decode($this->input->get('filter_revision'));

        //Select Query
        $this->db->select('*');
        $this->db->from('stock_wip');
        $this->db->where("approved_to = ''");
        if ($filter_month != "" or $filter_year != "") {
            $this->db->where('p_month', $filter_month);
            $this->db->where('p_year', $filter_year);
        }
        $this->db->like('revision', $filter_revision);
        $records = $this->db->get()->result_array();

        if (count($records) > 0) {
            echo json_encode(array("theme" => "success"));
        } else {
            echo json_encode(array("theme" => "error"));
        }
    }

    public function checkOstMpp()
    {
        $filter_month = base64_decode($this->input->get('filter_month'));
        $filter_year = base64_decode($this->input->get('filter_year'));
        $filter_revision = base64_decode($this->input->get('filter_revision'));

        //Select Query
        // $this->db->select('*');
        // $this->db->from('os_mpp');
        // $this->db->where("approved_to = ''");
        // if ($filter_month != "" or $filter_year != "") {
        //     $this->db->where('p_month', $filter_month);
        //     $this->db->where('p_year', $filter_year);
        // }
        // $this->db->like('revision', $filter_revision);
        // $records = $this->db->get()->result_array();

        // if (count($records) > 0) {
            echo json_encode(array("theme" => "success"));
        // } else {
        //     echo json_encode(array("theme" => "error"));
        // }
    }

    public function checkCalendar()
    {
        $filter_month = base64_decode($this->input->get('filter_month'));
        $filter_year = base64_decode($this->input->get('filter_year'));

        $varBackYear = date('Y', strtotime('+1 month', strtotime($filter_year . "-" . $filter_month . "-01")));
        $varBackMonth = date('m', strtotime('+1 month', strtotime($filter_year . "-" . $filter_month . "-01")));

        $monthStart = strtotime($filter_year . "-" . $filter_month . "-01");
        $monthEnd =  strtotime(date('Y-m-d', strtotime('+5 month', strtotime($varBackYear . "-" . $varBackMonth . "-01"))));

        $html = "";
        $no = 1;
        while ($monthStart < $monthEnd) {
            $monthName = date('m/Y', $monthStart);
            $start = strtotime(date('Y-m-01', $monthStart));
            $finish = strtotime(date('Y-m-t', $monthStart));

            //HKW 1
            $hkw = 0;
            for ($z = $start; $z <= $finish; $z += (60 * 60 * 24)) {
                $working_date = date('Y-m-d', $z);

                $this->db->select('remarks');
                $this->db->from('calendars');
                $this->db->where('working_date', $working_date);
                $holiday = $this->db->get()->row();

                // if (date('w', $z) !== '0' && date('w', $z) !== '6') {
                    if (@$holiday->remarks != null or @$holiday->remarks != "") {
                        $hkw += 0;
                    } else {
                        $hkw += 1;
                    }
                // } else {
                //     $hkw += 0;
                // }
            }

            $html .= '  <div style="margin:15px;">
                            HKW ' . $no . ' : ' . $monthName . ' : <b>' . $hkw . '</b>
                        </div>';

            $no++;
            $monthStart = strtotime("+1 month", $monthStart);
        }

        echo $html;
    }

    public function create()
    {
        if ($this->input->post()) {
            $post = $this->input->post('data');
            $postDetails = $post['details'];

            foreach ($postDetails as $postDetail) {
                $generateMpsDetails = $this->crud->reads('generate_mps_details', [], [
                    "p_month" => $postDetail['p_month'],
                    "p_year" => $postDetail['p_year'],
                    "revision" => $postDetail['revision'],
                    "customer_id" => $postDetail['customer_id'],
                    "item_fg_id" => $postDetail['item_fg_id'],
                    "ltpp_month" => $postDetail['ltpp_month']
                ]);

                $postFinalDetail = array(
                    "p_month" => $postDetail['p_month'],
                    "p_year" => $postDetail['p_year'],
                    "revision" => $postDetail['revision'],
                    "customer_id" => $postDetail['customer_id'],
                    "item_fg_id" => $postDetail['item_fg_id'],
                    "ltpp_month" => $postDetail['ltpp_month'],
                    "ltpp_month2" => $postDetail['ltpp_month2'],
                    "hkw" => $postDetail['hkw'],
                    "begin_balance" => $postDetail['begin_balance'],
                    "ito" => $postDetail['ito'],
                    "so" => $postDetail['so'],
                    "forecast" => $postDetail['forecast'],
                    "delivery_rate" => $postDetail['delivery_rate'],
                    "safety_stock" => $postDetail['safety_stock'],
                    "need" => $postDetail['prod_plan'],
                    "prod_plan" => $postDetail['prod_plan']
                );

                if (count($generateMpsDetails) > 0) {
                    $send = $this->crud->update('generate_mps_details', [
                        "p_month" => $postDetail['p_month'],
                        "p_year" => $postDetail['p_year'],
                        "revision" => $postDetail['revision'],
                        "customer_id" => $postDetail['customer_id'],
                        "item_fg_id" => $postDetail['item_fg_id'],
                        "ltpp_month" => $postDetail['ltpp_month']
                    ], $postFinalDetail);
                } else {
                    $this->crud->create('generate_mps_details', $postFinalDetail);
                }
            }

            $generateMps = $this->crud->reads('generate_mps', [], [
                "p_month" => $post['p_month'],
                "p_year" => $post['p_year'],
                "revision" => $post['revision'],
                "customer_id" => $post['customer_id'],
                "item_fg_id" => $post['item_fg_id'],
                "wip_month" => $post['wip_month']
            ]);

            $postFinal = array(
                "p_month" => $post['p_month'],
                "p_year" => $post['p_year'],
                "revision" => $post['revision'],
                "customer_id" => $post['customer_id'],
                "item_fg_id" => $post['item_fg_id'],
                "wip_month" => $post['wip_month'],
                "pp" => $post['pp'],
                "wc" => $post['wc'],
                "ha" => $post['ha'],
                "c" => $post['c'],
                "v" => $post['v'],
                "p" => $post['p'],
                "rfg" => $post['rfg'],
                "fg" => $post['fg'],
                "os_mpp" => $post['os_mpp'],
                "os_so" => $post['os_so'],
                "total_stock" => $post['total_stock'],
                "balance" => $post['balance']
            );

            if (count($generateMps) > 0) {
                $send   = $this->crud->update('generate_mps', [
                    "p_month" => $post['p_month'],
                    "p_year" => $post['p_year'],
                    "revision" => $post['revision'],
                    "customer_id" => $post['customer_id'],
                    "item_fg_id" => $post['item_fg_id'],
                    "wip_month" => $post['wip_month']
                ], $postFinal);
                echo $send;
            } else {
                $send = $this->crud->create('generate_mps', $postFinal);
                echo $send;
            }
        }
    }

    public function uploadclearFailed()
    {
        @unlink('failed/generate_mps.txt');
    }

    public function uploadcreateFailed()
    {
        if ($this->input->post()) {
            $message = $this->input->post('message');
            $textFailed = fopen('failed/generate_mps.txt', 'a');
            fwrite($textFailed, $message . "\n");
            fclose($textFailed);
        }
    }

    public function uploadDownloadFailed()
    {
        $file = "failed/generate_mps.txt";

        header('Content-Description: File Failed');
        header('Content-Disposition: attachment; filename=' . basename($file));
        header('Expires: 0');
        header('Cache-Control: must-revalidate');
        header('Pragma: public');
        header('Content-Length: ' . @filesize($file));
        header("Content-Type: text/plain");
        @readfile($file);
    }

    public function monthName($id)
    {
        if ($id == "01") {
            return "JANUARY";
        } elseif ($id == "02") {
            return "FEBRUARY";
        } elseif ($id == "03") {
            return "MARCH";
        } elseif ($id == "04") {
            return "APRIL";
        } elseif ($id == "05") {
            return "MAY";
        } elseif ($id == "06") {
            return "JUNE";
        } elseif ($id == "07") {
            return "JULY";
        } elseif ($id == "08") {
            return "AUGUST";
        } elseif ($id == "09") {
            return "SEPTEMBER";
        } elseif ($id == "10") {
            return "OCTOBER";
        } elseif ($id == "11") {
            return "NOVEMBER";
        } elseif ($id == "12") {
            return "DECEMBER";
        }
    }

    public function ltpp_no($p_month, $p_year)
    {
        $this->dummy = $this->load->database('dummy', TRUE);
        $datenow    = $p_year. $p_month;
        $sqlGetID   = $this->dummy->query("SELECT max(ltpp_doc) as kode FROM ltpp_header 
            WHERE ltpp_doc like '%$datenow%'");
        $rowID      = $sqlGetID->row();
        $kode       = $rowID->kode;
        if ($kode == NULL) {
            $autoID = sprintf("%03s", $kode + 1);
        } else {
            $urutan = (int) substr($kode, -3);
            $urutan++;
            $autoID = sprintf("%03s", $urutan);
        }

        return $datenow . "/LTPP/" . $autoID;
    }

    public function push_data_check(){
    	//Filter Data
        $filter_month = base64_decode($this->input->get('filter_month'));
        $filter_year = base64_decode($this->input->get('filter_year'));
        $filter_revision = base64_decode($this->input->get('filter_revision'));

        //Select Line No
        $this->db->select('*');
        $this->db->from('generate_mps');
        if ($filter_month != "" or $filter_year != "") {
            $this->db->where('p_month', $filter_month);
            $this->db->where('p_year', $filter_year);
        }
        $this->db->like('revision', $filter_revision);
        $this->db->where('deleted', 0);
        $records = $this->db->get()->result_array();

        if(count($records) > 0){
        	echo json_encode(array("title" => "Success", "message" => "Data Already", "theme" => "success"));
        }else{
        	echo json_encode(array("title" => "Not Ready", "message" => "Data MPS Not Found, Please Generate First", "theme" => "error"));
        }
    }

    public function push_data_header(){
        $this->dummy = $this->load->database('dummy', TRUE);

        if($this->input->get()){
            //Filter Data
            $filter_month = base64_decode($this->input->get('filter_month'));
            $filter_year = base64_decode($this->input->get('filter_year'));
            $filter_revision = base64_decode($this->input->get('filter_revision'));

            //Perhitungan HKW
            $varBackYear = date('Y', strtotime('+1 month', strtotime($filter_year . "-" . $filter_month . "-01")));
            $varBackMonth = date('m', strtotime('+1 month', strtotime($filter_year . "-" . $filter_month . "-01")));

            $monthStart = strtotime($filter_year . "-" . $filter_month . "-01");
            $monthEnd =  strtotime(date('Y-m-d', strtotime('+5 month', strtotime($varBackYear . "-" . $varBackMonth . "-01"))));

            $no = 1;
            while ($monthStart < $monthEnd) {
                $start = strtotime(date('Y-m-01', $monthStart));
                $finish = strtotime(date('Y-m-t', $monthStart));

                //HKW 1
                $hkw = 0;
                for ($z = $start; $z <= $finish; $z += (60 * 60 * 24)) {
                    $working_date = date('Y-m-d', $z);

                    $this->db->select('remarks');
                    $this->db->from('calendars');
                    $this->db->where('working_date', $working_date);
                    $holiday = $this->db->get()->row();

                    // if (date('w', $z) !== '0' && date('w', $z) !== '6') {
                        if (@$holiday->remarks != null or @$holiday->remarks != "") {
                            $hkw += 0;
                        } else {
                            $hkw += 1;
                        }
                    // } else {
                    //     $hkw += 0;
                    // }
                }

                $arrHkw[] = array(
                    "hkw_".$no => $hkw
                );

                $no++;
                $monthStart = strtotime("+1 month", $monthStart);
            }

            $this->dummy->select('*');
            $this->dummy->from("ltpp_header");
            $this->dummy->where("period", $filter_year . $filter_month);
            $this->dummy->where("rev", $filter_revision);
            $ltpp_header = $this->dummy->get()->result_array();

            $arrData = array(
                "ltpp_doc" => $this->ltpp_no($filter_month, $filter_year),
                "period" => $filter_year . $filter_month,
                "date_period" => $filter_year ."-".$filter_month."-01",
                "lt" => "8",
                "hkw_1" => $arrHkw[0]['hkw_1'],
                "hkw_2" => $arrHkw[1]['hkw_2'],
                "hkw_3" => $arrHkw[2]['hkw_3'],
                "hkw_4" => $arrHkw[3]['hkw_4'],
                "hkw_5" => $arrHkw[4]['hkw_5'],
                "hkw_6" => $arrHkw[5]['hkw_6'],
                "rev" => $filter_revision,
                "fc_m4" => "0",
                "upload_user" => $this->session->username,
                "upload_time" => date("Y-m-d H:i:s"),
                "status" => "",
                "approval_sts" => "",
                "remark" => "",
            );

            if(count($ltpp_header) == 0){
                $this->dummy->insert("ltpp_header", $arrData);
                die(json_encode($arrData));
            }else{
                die(json_encode($ltpp_header));
            }
        }
    }

    public function push_data(){
        if($this->input->get()){
            //Filter Data
            $filter_month = base64_decode($this->input->get('filter_month'));
            $filter_year = base64_decode($this->input->get('filter_year'));
            $filter_item_fg = base64_decode($this->input->get('filter_item_fg'));
            $filter_customer = base64_decode($this->input->get('filter_customer'));
            $filter_revision = base64_decode($this->input->get('filter_revision'));

            $this->db->select('a.*, c.number_customer as product_no, c.name as product_name, d.circuit_no');
            $this->db->from('generate_mps a');
            $this->db->join('generate_mps_details b', 'a.p_month = b.p_month and a.p_year = b.p_year and a.revision = b.revision and a.item_fg_id = b.item_fg_id');
            $this->db->join('item_fg c', 'a.item_fg_id = c.id');
            $this->db->join("(SELECT z.item_fg_id, COUNT(z.circuit_no) as circuit_no FROM (SELECT distinct item_fg_id, circuit_no FROM `wos`) z GROUP BY z.item_fg_id) d", 'a.item_fg_id = d.item_fg_id');
            if ($filter_month != "" or $filter_year != "") {
                $this->db->where('a.p_month', $filter_month);
                $this->db->where('a.p_year', $filter_year);
            }
            $this->db->where("(a.pp > 0 or a.wc > 0 or a.ha > 0 or a.c > 0 or a.v > 0 or a.p > 0 or a.fg > 0 or a.os_mpp > 0 or a.os_so > 0)");
            $this->db->where('a.deleted', 0);
            $this->db->like('a.customer_id', $filter_customer);
            $this->db->like('a.revision', $filter_revision);
            $this->db->like('a.item_fg_id', $filter_item_fg);
            $this->db->group_by('a.item_fg_id');
            $records = $this->db->get()->result_array();

            $jsonData = array();
            foreach ($records as $data) {
                $this->db->select('a.*');
                $this->db->from('generate_mps_details a');
                $this->db->where('a.p_month', $data['p_month']);
                $this->db->where('a.p_year', $data['p_year']);
                $this->db->where('a.revision', $data['revision']);
                $this->db->where('a.customer_id', $data['customer_id']);
                $this->db->where('a.item_fg_id', $data['item_fg_id']);
                $this->db->where('a.deleted', 0);
                $this->db->group_by('a.ltpp_month');
                $this->db->order_by('a.id');
                $details2 = $this->db->get()->result_array();

                $nodetail = 1;
                $jsonDataDetail = array();
                foreach ($details2 as $detail2) {
                    $safety_stock = $detail2['safety_stock'];

                    $jsonDataDetail[] = array(
                        "begin_balance_".$nodetail => $detail2['begin_balance'],
                        "ito_".$nodetail => $detail2['ito'],
                        "xbar_".$nodetail => 0,
                        "forecast_".$nodetail => $detail2['forecast'],
                        "delivery_rate_".$nodetail => $detail2['delivery_rate'],
                        "safety_stock_".$nodetail => $safety_stock,
                        "prod_plan_".$nodetail => $detail2['prod_plan']
                    );

                    $nodetail++;
                }

                $jsonData[] = array(
                    "p_month" => $filter_month,
                    "p_year" => $filter_year,
                    "revision" => $filter_revision,
                    "line_no" => "",
                    "product_no" => trim($data['product_no']),
                    "product_name" => trim($data['product_name']),
                    "circuit_no" => $data['circuit_no'],
                    "pp" => $data['pp'],
                    "p1" => $data['wc'],
                    "p2" => $data['ha'],
                    "p3" => $data['c'],
                    "p4" => $data['v'],
                    "p5" => $data['p'],
                    "p6" => 0,
                    "p7" => 0,
                    "p8" => 0,
                    "p9" => 0,
                    "p10" => 0,
                    "stock_tf" => ($data['wc'] + $data['ha'] + $data['c'] + $data['v'] + $data['p']),
                    "rqa" => 0,
                    "hav" => 0,
                    "fg" => $data['fg'],
                    "os_mpp" => $data['os_mpp'],
                    "total_stock" => $data['total_stock'],
                    "os_sales_order" => $data['os_so'],
                    "balance" => $data['balance'],
                    "details" => $jsonDataDetail
                );
            }

            $jsonData['total'] = count($jsonData);
            die(json_encode($jsonData));
        }
    }

    public function push_data_create(){
        if ($this->input->post()) {
            $data = $this->input->post('data');
            $header = $this->input->post('header');

            // $sales_order = $this->crud->read('sales_order', [], [
            //     "p_month" => $data['p_month'],
            //     "p_year" => $data['p_year'],
            //     "revision" => $data['revision'],
            //     "product_no" => $data['product_no']
            // ]);

            $this->dummy = $this->load->database('dummy', TRUE);

            $this->dummy->select('COALESCE(lotqty, 0) as lotqty');
            $this->dummy->from("mst_item");
            $this->dummy->where("item_id", trim($data['product_no']));
            $mst_item = $this->dummy->get()->row();

            $this->dummy->select('*');
            $this->dummy->from("ltpp_generate");
            $this->dummy->where("period", $header[0]['period']);
            $this->dummy->where("assy_no", $data['product_no']);
            $this->dummy->where("rev", $header[0]['rev']);
            $ltpp_generate = $this->dummy->get()->result_array();

            if(count($ltpp_generate) > 0){
                $ltpp_doc = $ltpp_generate[0]['ltpp_doc'];
            }else{
                $ltpp_doc = $header[0]['ltpp_doc'];
            }

            if(@is_nan(ceil($data['details'][0]['prod_plan_1'] / $mst_item->lotqty) * $mst_item->lotqty)){
            	$prod_plan_1 = 0;
            }else{
            	$prod_plan_1 = @(ceil($data['details'][0]['prod_plan_1'] / $mst_item->lotqty) * $mst_item->lotqty);;
            }

            if(@is_nan(ceil($data['details'][1]['prod_plan_2'] / $mst_item->lotqty) * $mst_item->lotqty)){
            	$prod_plan_2 = 0;
            }else{
            	$prod_plan_2 = @(ceil($data['details'][1]['prod_plan_2'] / $mst_item->lotqty) * $mst_item->lotqty);;
            }

            if(@is_nan(ceil($data['details'][2]['prod_plan_3'] / $mst_item->lotqty) * $mst_item->lotqty) ){
            	$prod_plan_3 = 0;
            }else{
            	$prod_plan_3 = @(ceil($data['details'][2]['prod_plan_3'] / $mst_item->lotqty) * $mst_item->lotqty);;
            }

            if(@is_nan(ceil($data['details'][3]['prod_plan_4'] / $mst_item->lotqty) * $mst_item->lotqty)){
            	$prod_plan_4 = 0;
            }else{
            	$prod_plan_4 = @(ceil($data['details'][3]['prod_plan_4'] / $mst_item->lotqty) * $mst_item->lotqty);;
            }

            if(@is_nan(ceil($data['details'][4]['prod_plan_5'] / $mst_item->lotqty) * $mst_item->lotqty)){
            	$prod_plan_5 = 0;
            }else{
            	$prod_plan_5 = @(ceil($data['details'][4]['prod_plan_5'] / $mst_item->lotqty) * $mst_item->lotqty);;
            }

            if(@is_nan(ceil($data['details'][5]['prod_plan_6'] / $mst_item->lotqty) * $mst_item->lotqty)){
            	$prod_plan_6 = 0;
            }else{
            	$prod_plan_6 = @(ceil($data['details'][5]['prod_plan_6'] / $mst_item->lotqty) * $mst_item->lotqty);;
            }

            $postFinal = array(
                "ltpp_doc" => $ltpp_doc,
                "period" => $header[0]['period'],
                "date_period" => $header[0]['date_period'],
                "lt" => $header[0]['lt'],
                "hkw_1" => $header[0]['hkw_1'],
                "hkw_2" => $header[0]['hkw_2'],
                "hkw_3" => $header[0]['hkw_3'],
                "hkw_4" => $header[0]['hkw_4'],
                "hkw_5" => $header[0]['hkw_5'],
                "hkw_6" => $header[0]['hkw_6'],
                "fc_m4" => $header[0]['fc_m4'],
                "rev" => $header[0]['rev'],
                "assy_no" => trim($data['product_no']),
                "item_name" => trim($data['product_name']),
                "cct" => $data['circuit_no'],
                "pp" => $data['pp'],
                "p1" => $data['p1'],
                "p2" => $data['p2'],
                "p3" => $data['p3'],
                "p4" => $data['p4'],
                "p5" => $data['p5'],
                "p6" => $data['p6'],
                "p7" => $data['p7'],
                "p8" => $data['p8'],
                "p9" => $data['p9'],
                "p10" => $data['p10'],
                "rep_qa" => $data['rqa'],
                "hav" => $data['hav'],
                "fg" => $data['fg'],
                "ost_mpp" => $data['os_mpp'],
                "t_stock" => $data['total_stock'],
                "fc1" => $data['details'][0]['forecast_1'],
                "fc2" => $data['details'][1]['forecast_2'],
                "fc3" => $data['details'][2]['forecast_3'],
                "fc4" => $data['details'][3]['forecast_4'],
                "fc5" => $data['details'][4]['forecast_5'],
                "fc6" => $data['details'][5]['forecast_6'],
                "t_fc" => ($data['details'][0]['forecast_1'] + $data['details'][1]['forecast_2'] + $data['details'][2]['forecast_3'] + $data['details'][3]['forecast_4'] + $data['details'][4]['forecast_5'] + $data['details'][5]['forecast_6']),
                // "so_0" => @$sales_order->qty_1,
                // "so_1" => @$sales_order->qty_2,
                // "so_2" => @$sales_order->qty_3,
                // "so_3" => @$sales_order->qty_4,
                // "so_4" => @$sales_order->qty_5,
                // "so_5" => @$sales_order->qty_6,
                "so_0" => "0.0000",
                "so_1" => "0.0000",
                "so_2" => "0.0000",
                "so_3" => "0.0000",
                "so_4" => "0.0000",
                "so_5" => "0.0000",
                "so_6" => "0.0000",
                "bal_1" => $data['details'][0]['begin_balance_1'],
                "bal_2" => $data['details'][1]['begin_balance_2'],
                "bal_3" => $data['details'][2]['begin_balance_3'],
                "bal_4" => $data['details'][3]['begin_balance_4'],
                "bal_5" => $data['details'][4]['begin_balance_5'],
                "bal_6" => $data['details'][5]['begin_balance_6'],
                "ito_1" => $data['details'][0]['ito_1'],
                "ito_2" => $data['details'][1]['ito_2'],
                "ito_3" => $data['details'][2]['ito_3'],
                "ito_4" => $data['details'][3]['ito_4'],
                "ito_5" => $data['details'][4]['ito_5'],
                "ito_6" => $data['details'][5]['ito_6'],
                "del_rate_1" => $data['details'][0]['delivery_rate_1'],
                "del_rate_2" => $data['details'][1]['delivery_rate_2'],
                "del_rate_3" => $data['details'][2]['delivery_rate_3'],
                "del_rate_4" => $data['details'][3]['delivery_rate_4'],
                "del_rate_5" => $data['details'][4]['delivery_rate_5'],
                "del_rate_6" => $data['details'][5]['delivery_rate_6'],
                "s_stock_1" => $data['details'][0]['safety_stock_1'],
                "s_stock_2" => $data['details'][1]['safety_stock_2'],
                "s_stock_3" => $data['details'][2]['safety_stock_3'],
                "s_stock_4" => $data['details'][3]['safety_stock_4'],
                "s_stock_5" => $data['details'][4]['safety_stock_5'],
                "s_stock_6" => $data['details'][5]['safety_stock_6'],
                // "prod_plan_1" => $prod_plan_1,
                // "prod_plan_2" => $prod_plan_2,
                // "prod_plan_3" => $prod_plan_3,
                // "prod_plan_4" => $prod_plan_4,
                // "prod_plan_5" => $prod_plan_5,
                // "prod_plan_6" => $prod_plan_6,
                "prod_plan_1" => $data['details'][0]['prod_plan_1'],
                "prod_plan_2" => $data['details'][1]['prod_plan_2'],
                "prod_plan_3" => $data['details'][2]['prod_plan_3'],
                "prod_plan_4" => $data['details'][3]['prod_plan_4'],
                "prod_plan_5" => $data['details'][4]['prod_plan_5'],
                "prod_plan_6" => $data['details'][5]['prod_plan_6'],
                "need_1" => $data['details'][0]['prod_plan_1'],
                "need_2" => $data['details'][1]['prod_plan_2'],
                "need_3" => $data['details'][2]['prod_plan_3'],
                "need_4" => $data['details'][3]['prod_plan_4'],
                "need_5" => $data['details'][4]['prod_plan_5'],
                "need_6" => $data['details'][5]['prod_plan_6'],
                "bal_end" => $data['balance'],
                "ltpp_date" => date("Y-m-d"),
                "notes" => "",
            );

            $postFinal_rev = array(
                "ltpp_doc" => $ltpp_doc,
                "period" => $header[0]['period'],
                "date_period" => $header[0]['date_period'],
                "lt" => $header[0]['lt'],
                "hkw_1" => $header[0]['hkw_1'],
                "hkw_2" => $header[0]['hkw_2'],
                "hkw_3" => $header[0]['hkw_3'],
                "hkw_4" => $header[0]['hkw_4'],
                "hkw_5" => $header[0]['hkw_5'],
                "hkw_6" => $header[0]['hkw_6'],
                "fc_m4" => $header[0]['fc_m4'],
                "rev" => $header[0]['rev'],
                "assy_no" => trim($data['product_no']),
                "item_name" => trim($data['product_name']),
                "cct" => $data['circuit_no'],
                "pp" => $data['pp'],
                "p1" => $data['p1'],
                "p2" => $data['p2'],
                "p3" => $data['p3'],
                "p4" => $data['p4'],
                "p5" => $data['p5'],
                "p6" => $data['p6'],
                "p7" => $data['p7'],
                "p8" => $data['p8'],
                "p9" => $data['p9'],
                "p10" => $data['p10'],
                "rep_qa" => $data['rqa'],
                "hav" => $data['hav'],
                "fg" => $data['fg'],
                "ost_mpp" => $data['os_mpp'],
                "t_stock" => $data['total_stock'],
                "fc1" => $data['details'][0]['forecast_1'],
                "fc2" => $data['details'][1]['forecast_2'],
                "fc3" => $data['details'][2]['forecast_3'],
                "fc4" => $data['details'][3]['forecast_4'],
                "fc5" => $data['details'][4]['forecast_5'],
                "fc6" => $data['details'][5]['forecast_6'],
                "t_fc" => ($data['details'][0]['forecast_1'] + $data['details'][1]['forecast_2'] + $data['details'][2]['forecast_3'] + $data['details'][3]['forecast_4'] + $data['details'][4]['forecast_5'] + $data['details'][5]['forecast_6']),
                "so_0" => @$sales_order->qty_1,
                "so_1" => @$sales_order->qty_2,
                "so_2" => @$sales_order->qty_3,
                "so_3" => @$sales_order->qty_4,
                "so_4" => @$sales_order->qty_5,
                "so_5" => @$sales_order->qty_6,
                "so_6" => "0.0000",
                "bal_1" => $data['details'][0]['begin_balance_1'],
                "bal_2" => $data['details'][1]['begin_balance_2'],
                "bal_3" => $data['details'][2]['begin_balance_3'],
                "bal_4" => $data['details'][3]['begin_balance_4'],
                "bal_5" => $data['details'][4]['begin_balance_5'],
                "bal_6" => $data['details'][5]['begin_balance_6'],
                "ito_1" => $data['details'][0]['ito_1'],
                "ito_2" => $data['details'][1]['ito_2'],
                "ito_3" => $data['details'][2]['ito_3'],
                "ito_4" => $data['details'][3]['ito_4'],
                "ito_5" => $data['details'][4]['ito_5'],
                "ito_6" => $data['details'][5]['ito_6'],
                "del_rate_1" => $data['details'][0]['delivery_rate_1'],
                "del_rate_2" => $data['details'][1]['delivery_rate_2'],
                "del_rate_3" => $data['details'][2]['delivery_rate_3'],
                "del_rate_4" => $data['details'][3]['delivery_rate_4'],
                "del_rate_5" => $data['details'][4]['delivery_rate_5'],
                "del_rate_6" => $data['details'][5]['delivery_rate_6'],
                "s_stock_1" => $data['details'][0]['safety_stock_1'],
                "s_stock_2" => $data['details'][1]['safety_stock_2'],
                "s_stock_3" => $data['details'][2]['safety_stock_3'],
                "s_stock_4" => $data['details'][3]['safety_stock_4'],
                "s_stock_5" => $data['details'][4]['safety_stock_5'],
                "s_stock_6" => $data['details'][5]['safety_stock_6'],
                // "prod_plan_1" => $prod_plan_1,
                // "prod_plan_2" => $prod_plan_2,
                // "prod_plan_3" => $prod_plan_3,
                // "prod_plan_4" => $prod_plan_4,
                // "prod_plan_5" => $prod_plan_5,
                // "prod_plan_6" => $prod_plan_6,
                "prod_plan_1" => $data['details'][0]['prod_plan_1'],
                "prod_plan_2" => $data['details'][1]['prod_plan_2'],
                "prod_plan_3" => $data['details'][2]['prod_plan_3'],
                "prod_plan_4" => $data['details'][3]['prod_plan_4'],
                "prod_plan_5" => $data['details'][4]['prod_plan_5'],
                "prod_plan_6" => $data['details'][5]['prod_plan_6'],
                "need_1" => $data['details'][0]['prod_plan_1'],
                "need_2" => $data['details'][1]['prod_plan_2'],
                "need_3" => $data['details'][2]['prod_plan_3'],
                "need_4" => $data['details'][3]['prod_plan_4'],
                "need_5" => $data['details'][4]['prod_plan_5'],
                "need_6" => $data['details'][5]['prod_plan_6'],
                "bal_end" => $data['balance'],
                "ltpp_date" => date("Y-m-d"),
                "notes" => "",
                "revisi_update" => "1",
                "update_date" => date("Y-m-d H:i:s"),
                "update_user" => $this->session->username,
            );

            if (count($ltpp_generate) > 0) {
                $this->dummy->where([
                    "period" => $header[0]['period'],
                    "assy_no" => $data['product_no'],
                    "rev" => $header[0]['rev']
                ]);

                if($this->dummy->update('ltpp_generate', $postFinal)){
                    $this->dummy->update('ltpp_generate_rev', $postFinal_rev, [
                        "period" => $header[0]['period'],
                        "assy_no" => $data['product_no'],
                        "rev" => $header[0]['rev']
                    ]);
                    echo json_encode(array("title" => "Good Job", "message" => $data['product_no'] . " | " . $data['product_name'] . " | Data Updated Successfully", "theme" => "success"));
                }else{
                    echo json_encode(array("title" => "Error", "message" => $data['product_no'] . " | " . $data['product_name'] . " | Data Unupdate", "theme" => "error"));
                }
            } else {
                if ($this->dummy->insert('ltpp_generate', $postFinal)) {
                    $this->dummy->insert('ltpp_generate_rev', $postFinal_rev);
                    echo json_encode(array("title" => "Good Job", "message" => $data['product_no'] . " | " . $data['product_name'] . " | Data Saved Successfully", "theme" => "success"));
                } else {
                    echo json_encode(array("title" => "Error", "message" => $data['product_no'] . " | " . $data['product_name'] . " | Data Unsaved", "theme" => "error"));
                }
            }
        }
    }

    public function print($option = "")
    {
        if ($option == "excel") {
            $format  = date("Ymd");
            header("Content-type: application/vnd-ms-excel");
            header("Content-Disposition: attachment; filename=generate_mps_$format.xls");
        }

        //Config
        $this->db->select('*');
        $this->db->from('config');
        $config = $this->db->get()->row();

        //Filter Data
        $filter_month = base64_decode($this->input->get('filter_month'));
        $filter_year = base64_decode($this->input->get('filter_year'));
        $filter_customer = base64_decode($this->input->get('filter_customer'));
        $filter_product_no = base64_decode($this->input->get('filter_product_no'));
        $filter_revision = base64_decode($this->input->get('filter_revision'));
        $period = $filter_year . "-" . $filter_month;

        //Select Customer
        $this->db->select('a.*, b.name as customer_name');
        $this->db->from('generate_mps a');
        $this->db->join('customers b', 'a.customer_id = b.id');
        if ($filter_month != "" or $filter_year != "") {
            $this->db->where('a.p_month', $filter_month);
            $this->db->where('a.p_year', $filter_year);
        }
        $this->db->like('a.customer_id', $filter_customer);
        $this->db->like('a.revision', $filter_revision);
        $this->db->like('a.item_fg_id', $filter_product_no);
        $this->db->group_by('a.customer_id');
        $this->db->order_by('b.name', 'asc');
        $customers = $this->db->get()->result_array();

        $header = "";
        $headerDetails = "";

        $varBackYear = date('Y', strtotime('+1 month', strtotime($filter_year . "-" . $filter_month . "-01")));
        $varBackMonth = date('m', strtotime('+1 month', strtotime($filter_year . "-" . $filter_month . "-01")));

        $monthStart = strtotime($filter_year . "-" . $filter_month . "-01");
        $monthEnd =  strtotime(date('Y-m-d', strtotime('+5 month', strtotime($varBackYear . "-" . $varBackMonth . "-01"))));
        $monthNameStart = date('F Y', $monthStart);

        $no = 1;
        while ($monthStart < $monthEnd) {
            $monthName = date('F Y', $monthStart);

            // if ($no == 1) {
                $xbar = '<th style="text-align:center;" rowspan="2">SO</th>';
                $colspan = '6';
            // } else {
            //     $xbar = "";
            //     $colspan = '8';
            // }

            $header .= '<th style="text-align:center;" colspan="' . $colspan . '" width="50">' . strtoupper($monthName) . '</th>';
            $headerDetails .= ' <th style="text-align:center;" rowspan="2">BEGIN <br> BALANCE</th>
                                    ' . $xbar . '
                                    <th style="text-align:center;" rowspan="2">FC</th>
                                    <th style="text-align:center;" rowspan="2">SAFETY <br> STOCK</th>
                                    <th style="text-align:center;" rowspan="2">NEED</th>
                                    <th style="text-align:center;" rowspan="2">PROD <br> PLAN</th>';
            $no++;
            $monthStart = strtotime("+1 month", $monthStart);
        }

        $html = '<html><head><title>Print Data</title></head><style>body {font-family: Arial, Helvetica, sans-serif;}#customers {border-collapse: collapse;width: 100%;font-size: 10px;}#customers td, #customers th {border: 1px solid #ddd;padding: 2px;}#customers tr:nth-child(even){background-color: #f2f2f2;}#customers tr:hover {background-color: #ddd;}#customers th {padding-top: 2px;padding-bottom: 2px;text-align: left;color: black;}</style><body>
        <div style="width:2500px;">
        <table style="width: 100%;">
            <td width="50" style="font-size: 12px; vertical-align: top; text-align: center; vertical-align:jus margin-right:10px;">
                <img src="' . $config->logo . '" width="30">
            </td>
            <td style="font-size: 14px; text-align: left; margin:2px;">
                <b>' . $config->name . '</b><br>
                <small>PPC DEPARTEMENT</small>
            </td>
        </table>
        <center>
            <b style="font-size:18px;">MASTER PRODUCTION SCHEDULES</b>
        </center>
        <p style="font-size:12px; margin:0;">PERIOD ' . $this->monthName($filter_month) . ' ' . $filter_year . '</p>
        <p style="font-size:12px; margin:0;">REVISION ' . $filter_revision . '</p>
        <p style="font-size:12px; margin:0;">PRINT DATE ' . date("d M Y H:m:s") . '</p>
        <p style="font-size:12px; margin:0;">PRINT BY ' . $this->session->username . '</p>
        <br>
        <table id="customers" border="1">';
        $html .= '<tr>
                <th style="text-align:center;" rowspan="3" width="50">No</th>
                <th style="text-align:center;" rowspan="3" width="150">PRODUCT EBWS</th>
                <th style="text-align:center;" rowspan="3" width="150">PRODUCT CUSTOMER</th>
                <th style="text-align:center;" rowspan="3" width="150">DESCRIPTION</th>
                <th style="text-align:center;" colspan="7">' . strtoupper($monthNameStart) . '</th>
                <th style="text-align:center;" rowspan="3" width="50">FG</th>
                <th style="text-align:center;" rowspan="3" width="50">OST<br>MPP</th>
                <th style="text-align:center;" rowspan="3" width="50">TOTAL<br>STOCK</th>
                <th style="text-align:center;" rowspan="3" width="50">OST<br>SO</th>';
        $html .= $header;
        $html .= '
                <th style="text-align:center;" rowspan="3" width="50">BAL</th>
            </tr>
            <tr>
                <th style="text-align:center;" colspan="7">STOCK WIP</th>';
        $html .= $headerDetails;
        $html .= '</tr>
            <tr>
                <th style="text-align:center;" width="50">PP</th>
                <th style="text-align:center;" width="50">WC</th>
                <th style="text-align:center;" width="50">HA</th>
                <th style="text-align:center;" width="50">C</th>
                <th style="text-align:center;" width="50">V</th>
                <th style="text-align:center;" width="50">P</th>
                <th style="text-align:center;" width="50">RFG</th>
            </tr>';

        foreach ($customers as $customer) {
            if ($customer['customer_name'] == "") {
                $customer_name = "No Customer";
            } else {
                $customer_name = $customer['customer_name'];
            }

            $html .= '  <tr>
                            <th colspan="100" style="text-align:left;"><b>' . $customer_name . '</b></th>
                        </tr>';
            //Select Full
            $this->db->select('a.*, c.name as customer_name, e.number as item_fg_number, e.name as item_fg_name, e.number_customer');
            $this->db->from('generate_mps a');
            $this->db->join('generate_mps_details b', 'a.p_month = b.p_month and a.p_year = b.p_year and a.revision = b.revision and a.item_fg_id = b.item_fg_id');
            $this->db->join('customers c', 'a.customer_id = c.id');
            $this->db->join('customer_items d', 'a.customer_id = d.customer_id and a.item_fg_id = d.item_fg_id');
            $this->db->join('item_fg e', 'a.item_fg_id = e.id');
            if ($filter_month != "" or $filter_year != "") {
                $this->db->where('a.p_month', $filter_month);
                $this->db->where('a.p_year', $filter_year);
            }
            $this->db->where('a.customer_id', $customer['customer_id']);
            $this->db->where("(a.pp > 0 or a.wc > 0 or a.ha > 0 or a.c > 0 or a.v > 0 or a.p > 0 or a.rfg or a.fg > 0 or a.os_mpp > 0 or a.os_so > 0 or a.total_stock > 0 or a.balance > 0 or 
                b.begin_balance > 0 or b.ito > 0 or b.forecast > 0 or b.delivery_rate > 0 or b.safety_stock > 0 or b.prod_plan > 0)");
            $this->db->like('a.revision', $filter_revision);
            $this->db->like('a.item_fg_id', $filter_product_no);
            $this->db->group_by('a.item_fg_id');
            $records = $this->db->get()->result_array();

            $no = 1;
            foreach ($records as $data) {
                $html .= '  <tr>
                            <td style="text-align:center;">' . $no . '</td>
                            <td style="mso-number-format:\@;">' . $data['item_fg_number'] . '</td>
                            <td style="mso-number-format:\@;">' . $data['number_customer'] . '</td>
                            <td>' . $data['item_fg_name'] . '</td>
                            <td style="text-align:center;">' . $data['pp'] . '</td>
                            <td style="text-align:center;">' . $data['wc'] . '</td>
                            <td style="text-align:center;">' . $data['ha'] . '</td>
                            <td style="text-align:center;">' . $data['c'] . '</td>
                            <td style="text-align:center;">' . $data['v'] . '</td>
                            <td style="text-align:center;">' . $data['p'] . '</td>
                            <td style="text-align:center;">' . $data['rfg'] . '</td>
                            <td style="text-align:center;">' . $data['fg'] . '</td>
                            <td style="text-align:center;">' . $data['os_mpp'] . '</td>
                            <td style="text-align:center;">' . $data['total_stock'] . '</td>
                            <td style="text-align:center;">' . $data['os_so'] . '</td>';

                $this->db->select('a.*');
                $this->db->from('generate_mps_details a');
                $this->db->where('a.p_month', $data['p_month']);
                $this->db->where('a.p_year', $data['p_year']);
                $this->db->where('a.revision', $data['revision']);
                $this->db->where('a.customer_id', $data['customer_id']);
                $this->db->where('a.item_fg_id', $data['item_fg_id']);
                $this->db->where('a.deleted', 0);
                $this->db->group_by('a.ltpp_month');
                $this->db->order_by('a.id');
                $details2 = $this->db->get()->result_array();

                $nodetail = 1;
                foreach ($details2 as $detail2) {
                    // if ($nodetail == 1) {
                        // if ($detail2['qty'] == "") {
                        //     $xbarQty = 0;
                        // } else {
                        //     $xbarQty = $detail2['qty'];
                        // }

                        // $xbar2 = '<td style="text-align:center;">' . $xbarQty . '</td>';
                    // } else {
                    //     $xbar2 = "";
                    // }

                    $html .= '  <td style="text-align:center;">' . $detail2['begin_balance'] . '</td>
                                <td style="text-align:center;">' . $detail2['so'] . '</td>
                                <td style="text-align:center;">' . $detail2['forecast'] . '</td>
                                <td style="text-align:center;">' . $detail2['safety_stock'] . '</td>
                                <td style="text-align:center;">' . $detail2['need'] . '</td>
                                <td style="text-align:center;">' . $detail2['prod_plan'] . '</td>';
                    $nodetail++;
                }
                $html .= '<td style="text-align:center;">' . $data['balance'] . '</td>
            </tr>';
                $no++;
            }
        }

        $html .= '</table></div></body></html>';
        echo $html;
    }
}
