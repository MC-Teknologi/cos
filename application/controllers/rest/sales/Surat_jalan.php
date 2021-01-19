<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Surat_jalan extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('api/sales/Surat_jalan_m', 'surat_jalan_m');
        $this->load->model('api/Api_m', 'api_m');
    }

    public function index()
    {
        $idpg = htmlspecialchars($this->input->post('id_pengguna'), true);
        $api_key = htmlspecialchars($this->input->post('API-KEY'), true);
        $cek_api_key = $this->api_m->CekApiKey($api_key);
        if ($cek_api_key->num_rows() > 0) {
            $data = $this->surat_jalan_m->TampilData($idpg);
            $respon = [
                'status' => true,
                'message' => "Data berhasil didapatkan",
                'surat_jalan' => $data->result()
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

    public function detail_surat_jalan()
    {
        $id_surat_jalan = htmlspecialchars($this->input->post('id_surat_jalan'), true);
        $api_key = htmlspecialchars($this->input->post('API-KEY'), true);

        $cek_api_key = $this->api_m->CekApiKey($api_key);
        if ($cek_api_key->num_rows() > 0) {

            $detail_surat_jalan = $this->surat_jalan_m->SuratJalanById($id_surat_jalan);
            $detail_barang_surat_jalan = $this->surat_jalan_m->detailBarangSuratJalan($id_surat_jalan);
            $respon = [
                'status' => true,
                'message' => "Data berhasil didapatkan",
                'detail_surat_jalan' => $detail_surat_jalan->row(),
                'detail_barang_surat_jalan' => $detail_barang_surat_jalan->result(),
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
