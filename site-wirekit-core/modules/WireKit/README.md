# WireKit Module

## Less
```
$less_files = [
  $config->paths->templates . "assets/less/main.less"
];
<link rel="stylesheet" type="text/css" href="<?= $wirekit->css($less_files); ?>">
```