<?php namespace processWire;
// Can run some dev tests here...
// Access it on front-end: example.com/dev/
$meta_url = $pages->get("/")->httpUrl."dev/";
head([
  "meta" => [
    "title" => $system->settings("site_name") . " - Development",
    "url" => $meta_url,
    "canonical" => $meta_url,
  ],
]);
echo "<div class='w-container w-margin-l'>";
echo "<h1 class='w-text-center'>{$system->settings("site_name")} - Development</h1>";
?>

<?php
d(mainMenu());
?>

<?php
echo "</div>"; 
foot();
?>
