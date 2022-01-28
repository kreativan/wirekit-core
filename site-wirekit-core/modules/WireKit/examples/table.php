<?php namespace ProcessWire;

$items = $pages->find("template=order, sort=-created, limit=50");

?>

<table class="AdminDataTableSortable ivm-table uk-table uk-table-striped uk-table-middle uk-table-small uk-margin-remove">

  <thead>
    <tr>
      <th class="sorter-false"></th>
      <th>ID</th>
      <th>Status</th>
      <th>Name</th>
      <th>Prod.</th>
      <th>Quant.</th>
      <th>Total</th>
      <th class="uk-text-right">Date</th>
    </tr>
  </thead>

  <tbody>
    <?php if($items->count) :?>
    <?php foreach($items as $item) :?>
      <?php
        $class = $item->isHidden() || $item->isUnpublished() ? "ivm-is-hidden" : "";
      ?>
      <tr class="<?= $class ?>">

        <td class="uk-table-shrink">
          <?php
            $files->include("./inc/drop-menu.php", [
              "item" => $item,
              "helper" => $helper,
            ]);
          ?>
        </td>

        <td>
          <?= $item->id ?>
        </td>

        <td>
          <?= $item->order_status->title ?>
        </td>

        <td>
          <?= $item->first_name ?>
          <?= $item->last_name ?>
        </td>

        <td>
          <?= $item->order_products->count ?>
        </td>

        <td>
          <?php
            $quantity = 0;
            foreach($item->order_products as $product) {
              $quantity = $quantity + $product->quantity;
            }
            echo $quantity;
          ?>
        </td>

        <td>
          <b><?= $item->total(); ?></b>
        </td>

        <td class="uk-text-right">
          <?= date("d F Y h:s:i", $item->created) ?>
        </td>

      </tr>
    <?php endforeach;?>
    <?php endif;?>
  </tbody>

</table>


<?php
// Render Pagination
echo $items->renderPager();
?>

<?php
  $tableSorter = $this->modules->get('JqueryTableSorter');
?>
<script>
$(function() {
  $(".AdminDataTableSortable").tablesorter({
    headers: {
      '.sorter-false' : {
        sorter: false
      }
    }
  });
});
</script>
