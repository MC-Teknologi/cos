<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

class Sendgps extends CI_Controller 
{
    public function __construct()
    {
        parent::__construct();
        //$this->load->library('session');
        $this->load->model('api/Api_m', 'api_m');
    }

    public function index()
    {
        if ($this->session->userdata('latitude')) { //penge checkan apabila sdh login tidak bisa ke halaman login kecuali logout dahulu
            //$data['title'] = 'Lacak';

            // $this->load->view('templates/header', $data);
            // $this->load->view('templates/sidebar', $data);
            // $this->load->view('templates/topbar', $data);
            $this->load->view('map/index', $data);
            // $this->load->view('templates/footer');
        }
         $this->load->view('map/index');
       
    }
    public function getgps(){
        //$latt = $this->session->userdata('latitude');
        //echo $longt = $this->session->userdata('longtitude');
        $idp = htmlspecialchars($this->input->post('idpengguna'), true);
        $api = htmlspecialchars($this->input->post('api'), true);
        $lat = htmlspecialchars($this->input->post('myLatitude'), true);
        $long = htmlspecialchars($this->input->post('myLongtitude'), true);
        
         $cek_api_key = $this->api_m->CekApiKey($api);

        if ($cek_api_key->num_rows() > 0) {
            if(!empty($lat)){

        $data = [
            'latitude' => $lat,
            'longtitude' => $long
        ];
        // $this->session->set_userdata($data);
        // $latt = $this->session->userdata('latitude');
        // $longt = $this->session->userdata('longtitude');
        $data2 = array(
            'ID_PENGGUNA'=>$idp,
            'LATITUDE'=>$lat,
            'LONGTITUDE'=>$long
        );

        $this->db->insert('gps',$data2);
        $respon = [
            'status' => true,
             'message' => "Lat :".$lat." -> Long :".$long
            //'message' => "Lat :".$latt
            ];
        }else {
        $respon = [
            'status' => true,
            'message' => "Data Tidak Masuk"
            ];
        }
        }else{
           
         $respon = [
            'status' => true,
            'message' => "Api Tidak Cocok"
            ];
        }
        
        
    
        $json = json_encode($respon);
        echo $json;
    }   
}

/* End of file Login   .php */
