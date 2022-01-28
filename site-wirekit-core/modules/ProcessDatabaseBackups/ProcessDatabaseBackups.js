jQuery(document).ready(function($) {
	
	$('.btn-delete-checked').hide();
	
	$('.delete-checkbox').on('input', function() {
		var numChecked = $('.delete-checkbox:checked').length;
		var $otherButtons = $('.btn-upload, .btn-backup');
		var $deleteButton = $('.btn-delete-checked');
		if(numChecked > 0) {
			$otherButtons.hide();
			$deleteButton.show();
		} else {
			$otherButtons.show();
			$deleteButton.hide();
		}
	});
		
}); 