<?php

	$host = "localhost";
	$db_user = "mmadej";
	$db_password = "mariusz123";
	$db_name = "moja";

?>
<?php
$polaczenie = mysql_connect('localhost', 'mmadej', $db_password) or die("Brak połączenia: " . mysql_error());
$baza = mysql_select_db('moja',$polaczenie) or exit("Nie wybrano bazy, błąd: " . mysql_error());
?>