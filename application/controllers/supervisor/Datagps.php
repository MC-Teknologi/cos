<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

class Datagps extends CI_Controller 
{
    public function __construct()
    {
        parent::__construct();
    }

    public function index($idpengguna)
    {
        $data['title'] = 'Pelacakan';
        $idp = $idpengguna;
        $data['id_pengguna'] = $idpengguna;
        $data['user'] = $this->db->get_where('pengguna', ['EMAIL_PENGGUNA' => $this->session->userdata('email')])->row_array();
        
        $this->load->view('templates/header', $data);
        $this->load->view('templates/sidebar', $data);
        $this->load->view('templates/topbar', $data);
        $this->load->view('map/datamap/index', $data);
        $this->load->view('templates/footer');
       
    }
}

/* End of file Login   .php */
