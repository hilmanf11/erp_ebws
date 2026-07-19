<?php
defined('BASEPATH') or exit('No direct script access allowed');
class Master extends CI_Controller
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
        $this->form_validation->set_rules('number', 'Code', 'required|min_length[1]|max_length[20]|is_unique[plants.number]');
    }

    //HALAMAN UTAMA
    public function index()
    {
        redirect('error_access');
    }

    function autoid($table)
    {
        $date = date("Ymd");
        $sql = $this->db->query("SELECT max(`id`) as kode FROM $table WHERE id like '%$date%'");
        $row = $sql->row();
        $kode = $row->kode;

        if ($kode == NULL) {
            $autoid = $date . sprintf("%06s", $kode + 1);
        } else {
            $autoid = (int) $kode + 1;
        }

        return $autoid;
    }

    //CREATE DATA
    public function creates($table)
    {
        $data = $this->input->post();

        // if ($data) {
        //     $id = $this->autoid($table);
        //     $dataFinal = array_merge($values, [
        //         "id" => $id,
        //         "created_by" => "admin",
        //         "created_date" => date('Y-m-d H:i:s')
        //     ]);

        //     $this->db->insert($table, $dataFinal);
        //     $response = array("status" => "success", "message" => "Data Create Successfully");
        // } else {
        //     $response = array("status" => "error", "message" => "Data Create Failed");
        // }

        // Output JSON response
        // header('Content-Type: application/json');
        echo json_encode($data);

    }
    
    //UPDATE DATA
    public function updates()
    {
        if ($this->input->post()) {
            $id   = base64_decode($this->input->get('id'));
            $post = $this->input->post();
            $send = $this->crud->update('plants', ["id" => $id], $post);
            echo $send;
        } else {
            show_error("Cannot Process your request");
        }
    }

    //DELETE DATA
    public function deletes()
    {
        $data = $this->input->post();
        $send = $this->crud->delete('plants', $data);
        echo $send;
    }
}
