<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

class Surat_jalan_m extends CI_Model 
{
    public function TampilData($id_pengguna = null)
    {
        $this->db->from('surat_jalan');
        if ($id_pengguna != null) {
            $this->db->where('ID_PENGGUNA ', $id_pengguna);
        }
        $this->db->order_by("ID_SURAT_JALAN", "DESC");
        $query = $this->db->get();
        return $query;
    }
}

/* End of file Surat_jalan_m.php */
