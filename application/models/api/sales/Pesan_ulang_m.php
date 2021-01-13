<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

class Pesan_ulang_m extends CI_Model 
{
    public function ambilData($id_pengguna = null)
    {
        return $this->db->query(
                "
                SELECT * FROM pesan_ulang pu 
                JOIN pelanggan p ON p.ID_PELANGGAN = pu.ID_PELANGGAN
                WHERE pu.ID_PENGGUNA = '$id_pengguna'
                "
        );
    }

    public function ambilSatuDatabyIdPesanUlang($id_pesan_ulang = null)
    {
        return $this->db->query(
                "
                SELECT * FROM pesan_ulang pu 
                JOIN pelanggan p ON p.ID_PELANGGAN = pu.ID_PELANGGAN
                WHERE pu.ID_PESAN_ULANG = '$id_pesan_ulang'
                "
        )->row();
    }

    public function detailBarangPesanUlang($id_pesan_ulang = null)
    {
        return $this->db->query(
                "
                SELECT * FROM detail_pesan_ulang dpu 
                JOIN barang b ON b.ID_BARANG = dpu.ID_BARANG
                WHERE dpu.ID_PESAN_ULANG = '$id_pesan_ulang'
                "
        )->result();
    }

}

/* End of file Pesan_ulang_m.php */
