<?php
include 'conn.php';

$name=$_POST['name'];


$conn->query("delete from user_details where name='.$name.'");



?>
