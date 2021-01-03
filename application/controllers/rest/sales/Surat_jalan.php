<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Surat_jalan extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('sales/Surat_jalan_m', 'surat_jalan_m');
        $this->load->model('api/Api_m', 'api_m');
    }

    public function index()
    {
        $idpg = htmlspecialchars($this->input->post('id_pengguna'), true);
        $api_key = htmlspecialchars($this->input->post('API-KEY'), true);
        $cek_api_key = $this->api_m->CekApiKey($api_key);
        if ($cek_api_key->num_rows() > 0) {
            $respon = [
                'status' => true,
                'message' => "Data berhasil didapatkan",
                'surat_jalan' => $this->db->get_where('surat_jalan', ['ID_PENGGUNA' => $idpg])->result()
            ];
        } else {
            $respon = [
                'status' => false,
                'message' => "Error API Key"
            ];
        }
        $json = json_encode($respon);
        echo $json;
    }
}

/* End of file Surat_jala.php */
