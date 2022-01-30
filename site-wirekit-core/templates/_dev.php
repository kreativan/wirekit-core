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
echo "</div>"; 
foot();
?>
