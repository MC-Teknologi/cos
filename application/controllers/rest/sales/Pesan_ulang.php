<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

class Pesan_ulang extends CI_Controller 
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('api/sales/Pesan_ulang_m', 'pesan_ulang_m');
        $this->load->model('api/Api_m', 'api_m');
    }

    public function index()
    {
        $idpg = htmlspecialchars($this->input->post('id_pengguna'), true);
        $api_key = htmlspecialchars($this->input->post('API-KEY'), true);

        $cek_api_key = $this->api_m->CekApiKey($api_key);
        if ($cek_api_key->num_rows() > 0) {
            $data = $this->pesan_ulang_m->ambilData($idpg);
            $respon = [
                'status' => true,
                'message' => "Data berhasil didapatkan",
                'pesan_ulang' => $data->result()
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

    public function detail()
    {
        $id_pesan_ulang = htmlspecialchars($this->input->post('id_pesan_ulang'), true);
        $api_key = htmlspecialchars($this->input->post('API-KEY'), true);

        $cek_api_key = $this->api_m->CekApiKey($api_key);
        if ($cek_api_key->num_rows() > 0) {

            $data_detail = $this->pesan_ulang_m->ambilSatuDatabyIdPesanUlang($id_pesan_ulang);
            $data_detail_barang = $this->pesan_ulang_m->detailBarangPesanUlang($id_pesan_ulang);

            $respon = [
                'status' => true,
                'message' => "Data berhasil didapatkan",
                'pesan_ulang_detail' => $data_detail,
                'detail_barang' => $data_detail_barang
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

/* End of file Pesan_ulang.php */
