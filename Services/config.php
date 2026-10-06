<?php

mysqli_report(MYSQLI_REPORT_OFF);

$host = 'localhost';
$user = 'root';
$password = '';
$database = 'db_tokoonline';

$conn = new mysqli($host, $user, $password, $database);

if ($conn->connect_error) {
    error_log('Koneksi database gagal: ' . $conn->connect_error);
    http_response_code(500);
    exit('Koneksi database gagal. Periksa konfigurasi dan pastikan MySQL berjalan.');
}

if (!$conn->set_charset('utf8mb4')) {
    error_log('Gagal mengatur charset database: ' . $conn->error);
    http_response_code(500);
    exit('Tidak dapat menyiapkan koneksi database.');
}
