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
echo 'test';

?>
