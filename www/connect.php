<?php

	$host = "localhost";
	$db_user = "root";
	$db_password = "";
	$db_name = "inwentaryzacja";

?>
<?php
$polaczenie = mysql_connect('localhost', 'root') or die("Brak połączenia: " . mysql_error());
$baza = mysql_select_db('inwentaryzacja',$polaczenie) or exit("Nie wybrano bazy, błąd: " . mysql_error());
?>