<?php namespace ProcessWire; ?>

<form id="test-form" action="/ajax/form-test/">

  <div class="uk-margin">
    <input type="text" name="name" class="uk-input" />
  </div>

  <div class="uk-margin">
    <input type="email" name="email" class="uk-input" />
  </div>

  <div class="uk-margin">
    <textarea rows="5" name="message" class="uk-textarea"></textarea>
  </div>

  <button class="uk-button uk-button-primary uk-width-small" type="button" 
    onclick="wirekit.formSubmit('test-form')"
  >
    <span>Submit</span>
    <span class="uk-hidden" uk-spinner="ratio: 0.8"></span>
  </button>

</form>