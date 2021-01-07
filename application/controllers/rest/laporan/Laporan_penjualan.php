<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

class Laporan_penjualan extends CI_Controller 
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('api/laporan/Laporan_penjualan_m', 'laporan_penjualan_m');
        $this->load->model('api/Api_m', 'api_m');
    }

    public function index()
    {
        $idpg = htmlspecialchars($this->input->post('id_pengguna'), true);
        $tgaw_no_convert = $this->input->post('tgaw');
        $tgak_no_convert = $this->input->post('tgak');
        $api_key = htmlspecialchars($this->input->post('API-KEY'), true);

        $tgaw = date("Y-m-d", strtotime($tgaw_no_convert));
        $tgak = date("Y-m-d", strtotime($tgak_no_convert));

        $cek_api_key = $this->api_m->CekApiKey($api_key);
        if ($cek_api_key->num_rows() > 0) {
            #ambil data penjualan
            $data = $this->laporan_penjualan_m->tampilData($idpg, $tgaw, $tgak);
            if (!$data->num_rows() > 0) {
                $respon = [
                    'status' => false,
                    'message' => "Data kosong"
                ];
            }else {
                $respon = [
                    'status' => true,
                    'message' => "Data berhasil didapatkan",
                    'laporan_penjualan' => $data->result()
                ];
            }

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

/* End of file Laporan_penjualan.php */
