<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

class Login_m extends CI_Model {

    public function login($data)
    {
        $this->db->select('*');
        $this->db->from('pengguna');
        $this->db->where('EMAIL_PENGGUNA', $data['email']);
        $query = $this->db->get();
        return $query;
    }

    public function setLogin($data)
    {
        $this->db->select('
            ID_PENGGUNA, 
            NAMA_PENGGUNA, 
            EMAIL_PENGGUNA, 
            FOTO_PENGGUNA, 
            ID_HAK_AKSES
        ');
        $this->db->from('pengguna');
        $this->db->where('EMAIL_PENGGUNA', $data['email']);
        $query = $this->db->get();
        return $query;
    }

}

/* End of file Login_m.php */
