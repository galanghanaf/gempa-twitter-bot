<?php
defined('BASEPATH') or exit('No direct script access allowed');




class M_Twitter extends CI_Model
{

    public function getDataById($table, $column_name, $where)
    {
        $this->db->select("*");
        $this->db->from($table);
        $this->db->where($column_name, $where);
        $query = $this->db->get();
        return $query->result();
    }
    public function getAllData($table)
    {
        $this->db->select("*");
        $this->db->from($table);
        $query = $this->db->get();
        return $query->result();
    }
}
