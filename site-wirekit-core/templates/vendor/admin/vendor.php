<?php
/**
 *  Vendor Info
 *  @author Ivan Milincic <kreativan.dev@gmail.com>
 *  @link http://www.kraetivan.dev
*/
?>

<table class="uk-table uk-table-middle uk-table-small uk-table-striped">
  <tbody>
    <?php foreach($system->vendor() as $key => $value) : ?>
      <tr>
        <td>
          <?php
            $key = str_replace("_", " ", $key);
            echo ucfirst($key);
          ?>
        </td>
        <td><?= $value ?></td>
      </tr>
    <?php endforeach;?>
  </tbody>
</table>