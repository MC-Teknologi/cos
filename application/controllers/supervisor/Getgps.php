<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

class Getgps extends CI_Controller 
{
    public function __construct()
    {
        parent::__construct();
    }

    public function index()
    {
        $data['title'] = 'Pelacakan';
        $data['user'] = $this->db->get_where('pengguna', ['EMAIL_PENGGUNA' => $this->session->userdata('email')])->row_array();
        $data['sales'] = $this->db->get_where('pengguna', ['ID_HAK_AKSES' => '4'])->result();

        $this->load->view('templates/header', $data);
        $this->load->view('templates/sidebar', $data);
        $this->load->view('templates/topbar', $data);
        $this->load->view('map/index', $data);
        $this->load->view('templates/footer');
       
    }
    
    public function map($idpengguna){
        $data['idp'] = $idpengguna;
        $this->load->view('map/map', $data);
    }
   
}

/* End of file Login   .php */
