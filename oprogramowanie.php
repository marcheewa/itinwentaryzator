<?php
include "menu.php";
?>
<?php

<h3>OPROGRAMOWANIE</h3>

<?php

if (isset($_GET['akcja'])) {
	if ($_GET['akcja'] == 'edytuj') {

	$zapytanie = "SELECT * FROM oprogramowanie WHERE id=".$_GET['oprogramowanie_id'];
	$oprogramowanie = mysql_query($zapytanie);
	$rekord = mysql_fetch_assoc($oprogramowanie);
?>
	<p><b>Edytuj Oprogramowanie</b></p>

	<form action="<?php echo $_SERVER['PHP_SELF'] ?>" method="POST">
	
		ID: <input readonly name="oprogramowanie_id" value="<?php echo $rekord['oprogramowanie_id'] ?>" size="2"/>

		Asset Tag: <input name="Asset Tag" value="<?php echo $rekord['asset_tag'] ?>" size="40" />

		System: <input name="System" value="<?php echo $rekord['system'] ?>" size="20" />
		
		Wersja: <input name="Wersja Systemu" value="<?php echo $rekord['wersja_systemu'] ?>" size="20" />
		
		Oprogramowanie 1: <input name="Oprogramowanie 1" value="<?php echo $rekord['oprgramowanie1'] ?>" size="20" />
		
		Licencja 1: <input name="Licencja 1" value="<?php echo $rekord['licencja1'] ?>" size="20" />
		
		Oprogramowanie 2: <input name="Oprogramowanie 2" value="<?php echo $rekord['oprgramowanie2'] ?>" size="20" />
		
		Licencja 2: <input name="Licencja 2" value="<?php echo $rekord['licencja2'] ?>" size="20" />
		
		Oprogramowanie 3: <input name="Oprogramowanie 3" value="<?php echo $rekord['oprgramowanie3'] ?>" size="20" />
		
		Licencja 3: <input name="Licencja 3" value="<?php echo $rekord['licencja3'] ?>" size="20" />
		
		<input type="submit" name="zmien" value="Zmień" />
		<input type="reset" value="Resetuj" />

	</form><br />
	
<?php
}
}

//zmiana istniejącego produktu

if (isset($_POST['zmien'])) {
	$zmien = $_POST['zmien'];
		
	$zapytanie = "UPDATE oprogramowanie SET Asset Tag='".$_POST['asset_tag']."', System=" . $_POST['system'] . "', Wersja Systemu='".$_POST['wersja_systemu']."', 
	Oprogramowanie1='".$_POST['oprogramowanie1']."', Licencja1='".$_POST['licencja1']."', Oprogramowanie2='".$_POST['oprogramowanie2']."', Licencja2='".$_POST['licencja2']."',
    Oprogramowanie3='".$_POST['oprogramowanie3']."', Licencja3='".$_POST['licencja3']."	WHERE id=".$_POST['oprogramowanie_id'];

	$oprogramowanie = mysql_query($zapytanie);

	if ($oprogramowanie)
		echo "<p>Aktualizacja powiodła się</p>";
	else
		echo "<p>Aktualizacja nie powiodła się!</p>";
}


//dodawanie nowego produktu

if (isset($_POST['dodaj'])) {
	$dodaj =$_POST['dodaj'];

	$nowe_oprogramowanie = trim($_POST['asset_tag']);
	$system = trim($_POST['system']);
	$wersja_systemu = trim($_POST['wersja_systemu']);
	$oprogramowanie1 = trim($_POST['oprogramowanie1']);
	$licencja1 = trim($_POST['licencja1']);
	$oprogramowanie2 = trim($_POST['oprogramowanie2']);
	$licencja2 = trim($_POST['licencja2']);
	$oprogramowanie3 = trim($_POST['oprogramowanie3']);
	$licencja3 = trim($_POST['licencja3']);
	
	$zapytanie = "SELECT asset_tag FROM oprogramowanie WHERE nazwa='$nowe_oprogramowanie'";
	$oprogramowanie = mysql_query($zapytanie);

	if (mysql_num_rows($oprogramowanie) > 0)
		echo "<p>Oprogramowanie o takim numerze już istnieje. Podaj inną nazwę.</p>";
	
	else {
		$zapytanie = "INSERT INTO oprgramowanie (asset_tag, system, wersja_systemu, oprgramowanie1, licencja1, oprgramowanie2, licencja2,
		oprogramowanie3, licencja3) VALUES ('$nowe_oprogramowanie', $system, $wersja_systemu, $oprogramowanie1, $licencja1, $oprgramowanie2,
		licencja2, oprgramowanie3, licencja3)";
	  $wstaw = mysql_query($zapytanie);
		
		if ($wstaw)
			echo "<p>Dodano nowe oprogramowanie do bazy</p>";
		else
			echo "<p>Dodanie nowego oprogramowania nie powiodło się</p>";
	}
}

?>

<p><b>Dodaj oprogramowanie</b></p>

<form action="<?php echo $_SERVER['PHP_SELF'];?>" method="POST">
		Asset Tag: <input name="Asset Tag" size="40" />
		System: <input name="System" size="20" />
		Wersja: <input name="Wersja Systemu" size="20" />
		Oprogramowanie 1: <input name="Oprogramowanie 1" size="20" />
		Licencja 1: <input name="Licencja 1" size="20" />
		Oprogramowanie 2: <input name="Oprogramowanie 2" size="20" />
		Licencja 2: <input name="Licencja 2" size="20" />
		Oprogramowanie 3: <input name="Oprogramowanie 3" size="20" />
		Licencja 3: <input name="Licencja 3" size="20" />
	
	<input type="submit" name="dodaj" value="Dodaj" />
	<input type="reset" value="Resetuj" />
</form>
<p />

<?php

$zapytanie = "SELECT * FROM oprogramowanie ORDER BY asset_tag";
$oprogramowanie = mysql_query($zapytanie) or die ('Błąd: ' . mysql_error());

?>
<hr />
<table>
<tr><th>ID</th><th>Asset Tag</th><th>System</th><th>Wersja systemu</th><th>Oprogramowanie1</th><th>Licencja1</th>
<th>Oprogramowanie2</th><th>Licencja2</th><th>Oprogramowanie3</th><th>Licencja3</th><th></th></tr>

<?php
while ($rekord = mysql_fetch_assoc($oprogramowanie)) {
?>
	<tr>
			<td><?php echo $rekord['oprogramowanie_id']; ?></td>
			<td><a href="<?php echo $_SERVER['PHP_SELF'];?>?akcja=edytuj&oprogramowanie_id=<?php echo $rekord['oprogramowanie_id'];?>">
			<?php	echo $rekord['asset_tag'];?></a></td>
			<td><?php echo $rekord['system'];?></td>
			<td><?php echo $rekord['wersja_systemu'];?></td>
			<td><?php echo $rekord['oprogramowanie1'];?></td>
			<td><?php echo $rekord['licencja1'];?></td>
			<td><?php echo $rekord['oprogramowanie2'];?></td>
			<td><?php echo $rekord['licencja2'];?></td>
			<td><?php echo $rekord['oprogramowanie3'];?></td>
			<td><?php echo $rekord['licencja3'];?></td>
	</tr>
<?php
}

?>
</body>
</html>