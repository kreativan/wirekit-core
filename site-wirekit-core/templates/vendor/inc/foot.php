<?php namespace ProcessWire; 
// Footer
// You can override path to the footer layout file in setting()
$footer = setting("footer") ? setting("footer") : "layout/base/footer.php";
?>

</main><!-- main end -->

<?php
  if($footer != "/") render($footer);
?>

<?php
// Scripts in Footer
echo $system->scripts_in_footer;

// Dynamic js/css files
if(setting("dynamic_assets")) {
  foreach ($config->styles->unique() as $file) {
    echo "<link rel='stylesheet' type='text/css' href='$file' />";
  }
  foreach ($config->scripts->unique() as $file) {
    echo "<script type='text/javascript' src='$file'></script>";
  }
}
?>

</body>
</html>
