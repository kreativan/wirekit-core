$(document).ready(function () {

  /**
   *  Sortable
   *  for all elements wit #sortable cs id
   *  This is only ui sort, not doing any actions
   */
  let dragDropEl = $('.drag-and-drop');
  if(dragDropEl) {
    $(function () {
      dragDropEl.sortable({
        handle: '.handle',
        stop: function (event, ui) {
          // do something
        }
      });
      $('.drag-and-drop').disableSelection();
    });
  }

  let ivmSortable = $('#ivm-sortable');
  if(ivmSortable.length > 0) {
    $(function () {

      ivmSortable.sortable({
        handle: '.handle',
        stop: function (event, ui) {

          $('#ivm-sortable').css('opacity', '0.5');

          var id = $(ui.item).attr('data-id');
          var nextID = $(ui.item).next().attr('data-id');
          var prevID = $(ui.item).prev().attr('data-id');

          var ajaxURL = './';

          $.post(ajaxURL, {
            id: id,
            next_id: nextID,
            prev_id: prevID,
            action: "drag_drop_sort",
          }).done(function (data) {
            // console.log('Data Loaded: ' + data);
            $('#ivm-sortable').css('opacity', '1');
          });

        }
      });

      $('#ivm-sortable').disableSelection();

    });

  }

});

function formSubmit(id) {
  event.preventDefault();
  document.querySelector(id).submit();
}

/* =========================================================== 
  Ajax Actions
=========================================================== */

/**
 * Publish/Unpublish Page
 * @param {int} id 
 */
async function togglePage(id) {
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
async function trashPage(id) {
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
async function deletePage(id) {
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
  Group Actions
=========================================================== */

/**
 * Get Checked Checkboxes
 * @returns array
 */
 function getCheckboxes() {
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
 * @returns 
 */
async function groupAction(action_name) {
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
    formData.append("ajax_group", action_name);
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