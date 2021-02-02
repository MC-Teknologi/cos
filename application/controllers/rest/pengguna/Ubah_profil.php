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
            if(!empty($this->input->post('picture'))){
            $image = base64_decode($this->input->post("picture"));
            $image_name = $id_pengguna.''.$nama_pengguna;
            $filename = '.'.'jpg';
            $path = "assets/img/profile/".$image_name;

            //hapus file
            $this->load->helper("file");
            delete_files($path.'.jpg');
            
                if ( file_put_contents($path . $filename, $image) ) {
                        $this->profil_m->ubahProfilDanGambar($id_pengguna, $nama_pengguna, $image_name.''.$filename);
                        $respon = [
                            'status' => true,
                            'message' => "Data Profil berhasil diubah"
                        ];
                    } else {
                        $this->profil_m->ubahProfilDanGambar($id_pengguna, $nama_pengguna, $image_name);
                        $respon = [
                            'status' => true,
                            'message' => "Data Profil gagal diubah"
                        ];
                    }
            }else{
                $this->profil_m->ubahProfilDanGambar($id_pengguna, $nama_pengguna);
                    $respon = [
                        'status' => true,
                        'message' => "Data Profil berhasil diubah"
                    ];
            }
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
