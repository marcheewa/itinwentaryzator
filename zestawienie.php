<?php
include "menu.php";
?>
<?php

	session_start();
	
	if (!isset($_SESSION['zalogowany']))
	{
		header('Location: index.php');
		exit();
	}
	
?>


<?php
$polaczenie = mysql_connect('localhost', 'root') or die("Brak połączenia: " . mysql_error());
$baza = mysql_select_db('moja',$polaczenie) or exit("Nie wybrano bazy, błąd: " . mysql_error());
?>
<?php


$zapytanie = 'select * from pracownicy';
$wynik = mysql_query($zapytanie) or die(mysql_error());

while ($rekord = mysql_fetch_assoc($wynik)) {
	echo $rekord['nazwisko'] . " " . $rekord['imie'] . " " . $rekord['stanowisko'] . "</br>";
	

}

	

?>
</body>
</html>