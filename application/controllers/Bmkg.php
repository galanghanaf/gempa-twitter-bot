<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Bmkg extends CI_Controller
{


    public function earthquake()
    {
        $this->db->db_debug = false;

        $content = file_get_contents('https://data.bmkg.go.id/DataMKG/TEWS/autogempa.json');
        $contents = utf8_encode($content);


        $data_earthquake = json_decode($contents, true);
        $key_earthquake = str_replace(':', '', $data_earthquake['Infogempa']['gempa']['Tanggal'] . $data_earthquake['Infogempa']['gempa']['Jam']);
        $id_earthquake = strtoupper(str_replace(' ', '', $key_earthquake));

        $earthquaketweet = "Gempa Bumi terjadi pada " . $data_earthquake['Infogempa']['gempa']['Tanggal'] . " " .
            $data_earthquake['Infogempa']['gempa']['Jam'] . ", di kordinat " .
            $data_earthquake['Infogempa']['gempa']['Lintang'] . " (Lintang Selatan), " .
            $data_earthquake['Infogempa']['gempa']['Bujur'] . " (Bujur Timur). Memiliki kekuatan magnitudo " .
            strtoupper($data_earthquake['Infogempa']['gempa']['Magnitude']) . " dengan kedalaman " .
            strtoupper($data_earthquake['Infogempa']['gempa']['Kedalaman']) . ". " .
            $data_earthquake['Infogempa']['gempa']['Wilayah'] . ". Sumber BMKG.";

        $insert_data = [
            "id_earthquake" =>  $id_earthquake,
            "tanggal" =>  $data_earthquake['Infogempa']['gempa']['Tanggal'],
            "jam" =>  $data_earthquake['Infogempa']['gempa']['Jam'],
            "coordinates" =>  $data_earthquake['Infogempa']['gempa']['Coordinates'],
            "lintang" =>  $data_earthquake['Infogempa']['gempa']['Lintang'],
            "bujur" =>  $data_earthquake['Infogempa']['gempa']['Bujur'],
            "magnitude" =>  $data_earthquake['Infogempa']['gempa']['Magnitude'],
            "kedalaman" =>  $data_earthquake['Infogempa']['gempa']['Kedalaman'],
            "wilayah" =>  $data_earthquake['Infogempa']['gempa']['Wilayah'],
            "potensi" =>  $data_earthquake['Infogempa']['gempa']['Potensi'],
            "dirasakan" =>  $data_earthquake['Infogempa']['gempa']['Dirasakan'],
            "shakemap" =>  $data_earthquake['Infogempa']['gempa']['Shakemap'],
        ];

        if ($this->db->insert('tbl_earthquake', $insert_data) > 0) {

            $data = [
                "id_earthquake" =>  $id_earthquake,
                "earthquaketweet" => $earthquaketweet,

            ];
            $this->db->insert('tbl_earthquaketweet', $data);

            $url = "http://localhost:8080";

            //open connection
            $curl = curl_init($url);

            //set the url, number of POST vars, POST data
            curl_setopt($curl, CURLOPT_POST, true);
            curl_setopt($curl, CURLOPT_POSTFIELDS, http_build_query($data));

            //So that curl_exec returns the contents of the cURL; rather than echoing it
            curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);

            //execute post
            $response = curl_exec($curl);
            curl_close($curl);
            return $response;
            echo $response;
        } else {
            $this->db->error();
        }
    }
}