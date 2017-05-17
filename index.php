<?php
include "menu.php";
?>
<?php
	session_start();
	
	if ((isset($_SESSION['zalogowany'])) && ($_SESSION['zalogowany']==true))
	{
		header('Location: zestawienie.php');
		exit();
	}

?>


		
	<a href="rejestracja.php">Rejestracja - załóż konto!</a>
	<br /><br />
	
	<form action="zaloguj.php" method="post">
	
		Login: <br /> <input type="text" name="Nazwa użytkownika" /> <br />
		Hasło: <br /> <input type="password" name="Hasło" /> <br /><br />
		<input type="submit" value="Zaloguj się" />
	
	</form>
	
<?php
	if(isset($_SESSION['blad']))	echo $_SESSION['blad'];
?>

