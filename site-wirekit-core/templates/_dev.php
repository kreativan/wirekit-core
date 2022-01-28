<?php namespace processWire;
// Can run some dev tests here...
// Access it on front-end: example.com/dev/
head([
  "meta_title" => $system->settings("site_name") . " - Development"
]);
echo "<div class='wk-container wk-margin-l'>";
echo "<h1 class='wk-text-center'>{$system->settings("site_name")} - Development</h1>";
?>

<?php
d(mainMenu());
?>

<?php
$email = "denitza.vassileva@codetoile.com";
$grain = 'b14oFmjJ82';
$sel = 'o12Ufd81gzR';
$psw = "codetoile2022";
$hash = hash('sha1', $grain.$psw.$sel);
d($hash);
?>


<?php
echo "</div>"; 
foot();
?>
