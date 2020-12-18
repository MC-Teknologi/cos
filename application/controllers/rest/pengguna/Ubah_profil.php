<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

class Ubah_profil extends CI_Controller 
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('api/pengguna/Profil_m', 'profil_m');
        $this->load->model('api/Api_m', 'api_m');
    }

    public function index()
    {
        $id_pengguna = htmlspecialchars($this->input->post('id_pengguna'), true);
        $nama_pengguna = htmlspecialchars($this->input->post('nama_pengguna'), true);
        $api_key = htmlspecialchars($this->input->post('API-KEY'), true);

        $cek_api_key = $this->api_m->CekApiKey($api_key);

        if ($cek_api_key->num_rows() > 0) {
            $this->profil_m->ubahProfil($id_pengguna, $nama_pengguna);
            $respon = [
                'status' => true,
                'message' => "Data Profil berhasil diubah"
            ];
        }else {
            $respon = [
                'status' => false,
                'message' => "Error API Key"
            ];
        }

        $json = json_encode($respon);
        echo $json;
    }

}

/* End of file Ubah_profil.php */
