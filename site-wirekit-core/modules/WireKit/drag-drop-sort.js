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