/**
 *  WireKit UI
 *  @method toggle - toggle open class on next sibling or target element
 */
 var wkui = (function () {

	'use strict';

	// Create the methods object
	var methods = {};

  /**
   * Toggle class on a element
   * If target not provided next sibling element will be used 
   * @param {String} target 
   * @param {String} cls 
   */
  methods.toggle = function(target = "", cls = "wk-open") {
    event.preventDefault();
    let e = event.target;
    if(e.nodeName == "A" || e.nodeName == "BUTTON") {
      e.classList.toggle("wk-toggle-on");
      if(target === "") {
        let sub = e.nextElementSibling;
        sub.classList.toggle(cls);
      } else {
        let el = document.querySelector(target);
        el.classList.toggle(cls);
      }
    }
  }

	// Expose the public methods
	return methods;

})();