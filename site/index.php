<?php
include 'koneksi.php';
echo "Database berhasil connected";
echo "<br>";
$qry=mysqli_fetch_array(mysqli_query($conn,"SELECT*FROM `tb_angka`;"));
$denc_Key=$qry['value'];
echo "Data From DB Docker: ";
echo $denc_Key;
?>