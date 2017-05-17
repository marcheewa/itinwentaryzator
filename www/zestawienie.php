<?php
include "menu.htm";
include "connect.php";
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

$zapytanie = 'select * from users';
$wynik = mysql_query($zapytanie) or die(mysql_error());

while ($rekord = mysql_fetch_assoc($wynik)) {
	echo $rekord['lastname'] . " " . $rekord['firstname'] . " " . $rekord['email'] . " " . $rekord['phone'] . "</br>";
	

}

	

?>
