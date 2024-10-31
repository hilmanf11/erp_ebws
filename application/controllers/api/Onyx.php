<?php
date_default_timezone_set("Asia/Bangkok");
defined('BASEPATH') or exit('No direct script access allowed');
class Onyx extends CI_Controller
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
    }

    public function index()
    {
        redirect('error_access');
    }

    public function login(){
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
}
