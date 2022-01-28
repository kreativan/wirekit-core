(function($) {

	function initEasyMDE($el) {
		// EasyMDE options from module config
		var easymde_options = JSON.parse(ProcessWire.config.InputfieldEasyMDE.easymde_options);
		// Set autorefresh (in case editor is hidden when Page Edit loads)
		easymde_options.autoRefresh = { delay: 300 };
		// Add classes to deal with fullscreen CSS issues
		easymde_options.onToggleFullScreen = function(is_fullscreen) {
			$('body').toggleClass('easymde-fullscreen', is_fullscreen);
			$el.parents('.InputfieldRepeater').toggleClass('has-easymde-fullscreen', is_fullscreen);
		};
		// For each textarea (multi-language fields contain multiple textareas)
		$el.find('textarea').each(function() {
			// Set element
			easymde_options.element = this;
			// Init EasyMDE
			var easymde = new EasyMDE(easymde_options);
			// Store EasyMDE object on textarea element in case somebody needs it
			$(this).data('easymde', easymde);
		});
	}

	$(document).ready(function() {
		$('.InputfieldEasyMDE').each(function() {
			initEasyMDE($(this));
		});
	});

	$(document).on('reloaded', '.InputfieldEasyMDE', function() {
		initEasyMDE($(this));
	});

}(jQuery));
