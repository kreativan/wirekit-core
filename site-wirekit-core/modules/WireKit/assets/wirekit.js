/**
 *  wirekit admin helper
 */
 var wirekit = (function () {

	'use strict';

	// Create the methods object
	var methods = {};

  /* =========================================================== 
    Utility
  =========================================================== */

  /**
   *  Display modal confirm
   *  this will redirect to the href attribute on confirm
   *  @example onclick="wirekit.confirm('Are you sure?', 'More text...')"
   */
  methods.confirm = function(title = "Are you sure", text = "") {
    event.preventDefault();
    let e = event.target.getAttribute("href") ? event.target : event.target.parentNode;
    // Close drop menu if exists
    let drop = e.closest(".uk-drop");
    if(drop) UIkit.drop(drop).hide();
    // Set message
    let message = `<div class='uk-h2 uk-text-center uk-margin-remove'>${title}</div>`;
    message += (text != "") ? `<p class='uk-text-center uk-margin-small'>${text}</p>` : "";
    // Show modal
    UIkit.modal.confirm(message).then(function () {
        let thisHref = e.getAttribute('href');
        window.location.replace(thisHref);
        // console.log(e);
    }, function () {
        // console.log('Rejected.')
    });
  }

  /**
   * For Submit
   * @param {*} id 
   * @example onclick="wirekit.submit(my_form_id)"
   */
  methods.submit = function(css_selector, action_name = "js_submit") {
    event.preventDefault();
    const form = document.querySelector(css_selector);
    // add input field so we know what action to process
    let input = document.createElement("INPUT");
    input.setAttribute("type", "hidden");
    input.setAttribute("name", action_name);
    input.setAttribute("value", "1");
    form.appendChild(input);
    form.submit();
  }

  /* =========================================================== 
    Pages
  =========================================================== */

  /**
   * Publish/Unpublish Page
   * @param {int} id PageID
   */
  methods.togglePage = async function(id) {
    event.preventDefault();
    let item = event.target.closest("tr");
    let icon = event.target.closest("i");
    icon.classList.add("cog-spin");
    const req = await fetch(`./?ajax_action=publish&id=${id}`);
    item.classList.toggle("is-hidden");
    icon.classList.remove("cog-spin");
  }

  /**
   * Move page to trash 
   * @param {int} id 
   */
  methods.trashPage = async function(id) {
    event.preventDefault();
    let item = event.target.closest("tr");
    const confirm = await UIkit.modal.confirm('<div class="uk-text-large uk-text-center">Are you sure?</div>').then(function() {
      return true;
    }, function() {
      return false;
    });
    if(confirm) {
      const req = await fetch(`./?ajax_action=trash&id=${id}`);
      item.remove();
    }
  }

  /**
   * Delete page
   * @param {int} id 
   */
  methods.deletePage = async function(id) {
    event.preventDefault();
    let item = event.target.closest("tr");
    const confirm = await UIkit.modal.confirm('<div class="uk-text-large uk-text-center">Are you sure?</div>').then(function() {
      return true;
    }, function() {
      return false;
    });
    if(confirm) {
      const req = await fetch(`./?ajax_action=trash&id=${id}`);
      item.remove();
    }
  }

  /* =========================================================== 
    Bulk
  =========================================================== */
  
  /**
   * Get Checked Checkboxes
   * @returns array
   */
  methods.getCheckboxes = function() {
    let checkboxes = document.querySelectorAll("table input[name='admin_items[]']");
    let checked = [];
    checkboxes.forEach(e => {
      if(e.checked) checked.push(e.value);
    });
    return checked;
  }

  /**
   * Get checkboxes and do bulk action
   * @param {string} action_name 
   */
  methods.bulk = async function(action_name) {
    event.preventDefault();

    let items = getCheckboxes();
    if(items.length < 1) {
      UIkit.notification({
        message: 'No items selected',
        status: 'primary',
        pos: 'top-center',
        timeout: 500
      });
      return;
    }

    const confirm = await UIkit.modal.confirm('<div class="uk-text-large uk-text-center">Are you sure?</div>').then(function() {
      return true;
    }, function() {
      return false;
    });

    if(confirm && items.length > 0) {

      let strArray = JSON.stringify(items);
      console.log(items);
      let formData = new FormData();
      formData.append("ajax_bulk", action_name);
      formData.append("admin_items", strArray);

      const response = await fetch("./", {
        method: "POST",
        body: formData
      })

      const data = await response.json();

      console.log(data)
      console.log(action_name)

      
      items.forEach(e => {

        let input = document.querySelector(`input[value='${e}']`);
        input.checked = false;
        let row = input.closest("tr");

        if(action_name == "publish") {
          row.classList.toggle("is-hidden");
        }

        if (action_name === "delete" || action_name === "trash") {
          row.remove();
          if(data.count < 1) window.location.href = "./";
        }

      });

    }

  }

	// Expose the public methods
	return methods;

})();