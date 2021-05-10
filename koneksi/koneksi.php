<?php 
$koneksi = mysqli_connect("localhost","root","","himmasi"); 
// cek koneksi 
if (!$koneksi){ 
  die("Error koneksi: " . mysqli_connect_errno()); 
} 
?> 