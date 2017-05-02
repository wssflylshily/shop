<?php
$dbhost='192.168.1.180';
$dbuser='root';
$dbpwd='';
$dbname='famall_v1.1.1';
$mysqliObj = new mysqli($dbhost,$dbuser,$dbpwd,$dbname);
//var_dump($mysqliObj);exit;
$mysqliObj->query("set name utf8");

$conn=mysql_connect($dbhost, $dbuser,$dbpwd);
mysql_select_db($dbname);
mysql_query("set names utf8");
?>