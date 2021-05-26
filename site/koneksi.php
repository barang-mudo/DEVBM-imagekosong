<?php 
	
	//Koneksi ke Docker
	$severname = "php-to-mysql_db_1"; //container name
	$username = "root";
	$password = "12345";
	$dbname = "db_docker_newUser";
	$port = 3306;

echo "Connecting.. to user_root localhost:8080";
	$conn = new mysqli($severname, $username, $password, $dbname);
	if(!$conn){
		die("koneksi Database gagal" . mysqli_connect_error());
	}
 ?>