<div id="new-modal" class="uk-flex-top" uk-modal="bg-close:false">
  <div class="uk-modal-dialog uk-margin-auto-vertical">

    <div class="uk-modal-header">
      <h3 class="uk-modal-title">Create Menu Item</h3>
    </div>

    <form action="./" method="POST" class="uk-form-stacked">

      <div class="uk-modal-body">
        
        <div class="uk-margin">
          <input class="uk-hidden" type="text" name="menu" value="<?= $input->get->menu ?>" />
          <input class="uk-input" type="text" name="title" placeholder="Title" required />
        </div>

      </div>
      
      <div class="uk-modal-footer uk-flex uk-flex-between">
        <button class="uk-button uk-button-default uk-modal-close" type="button">Cancel</button>
        <input type="submit" name="submit_new_menu_item" class="uk-button uk-button-primary" value="Submit" />
      </div>

    </form>

  </div>
</div>