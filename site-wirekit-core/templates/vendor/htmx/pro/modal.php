<div id="htmx-modal" uk-modal>
  <div class="uk-modal-dialog">

    <button type="button" class="uk-modal-close-default" uk-close></button>

    <div class="uk-modal-header">
      <h2 class="uk-modal-title">Modal Title</h2>
    </div>

    <div class="uk-modal-body">
      <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore
        magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
        consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla
        pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est
        laborum.</p>
    </div>

    <div class="uk-modal-footer uk-text-right">
      <button class="uk-button uk-button-default uk-modal-close" 
        type="button"
        onclick="wirekit.htmx('modal-close')"
      >
        Cancel
      </button>
      <button class="uk-button uk-button-primary" type="button">Save</button>
    </div>

  </div>
</div>