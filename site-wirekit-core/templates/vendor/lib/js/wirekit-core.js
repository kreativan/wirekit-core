/**
 *  wirekit 
 *
 *  @method formData - Collect data from form inputs
 *  @method formClear - Clear data from the form inputs
 *  @method toggle - toggle open class on next sibling or target element
 *  @method mobileMenu - init mobile menu
 *  @method htmx - htmx related helpers
 */
 var wirekit = (function () {

	'use strict';

	// Create the methods object
	var methods = {};

  /**
   * Create FormData for use in fetch requests 
   * @param {string} form_id 
   * @param {object} data - custom data eg: {"name": "My Name", "email": "My Email"}
   * @returns {object}
   */
  methods.formData = function(form_id, data = null) {
    let form = document.getElementById(form_id);
    let formData = new FormData();
    let fields = form.querySelectorAll("input, select, textarea");
    if (data) {
      for (const item in data) formData.append(item, data[item]);
    }
    fields.forEach((e) => {
      let name = e.getAttribute("name");
      let value = e.value;
      formData.append(name, value);
    });
    return formData;
  }

  /**
   * Reset/clear all form fields values
   * @param {string} form_id css id 
   */
  methods.formClear = function(form_id) {
    let form = document.getElementById(form_id);
    let fields = form.querySelectorAll("input, select, textarea");
    fields.forEach((e) => {
      e.value = "";
    });
  }

  /**
   *  Load mobile menu inside offcanvas component
   *  @param {Int|String} page_id - current page id
   */
  methods.mobileMenu = function(page_id, mobile_menu_path = cms.mobileMenuPath) {
  event.preventDefault();
    let mobileMenuContainer = document.querySelector("#mobile-menu-container");
    let mobileButton = document.querySelector("#mobile-menu-button");
    mobileButton.classList.toggle("wk-active");
    mobileMenuContainer.classList.toggle("wk-active");
    let isLoaded = mobileMenuContainer.querySelector("#mobile-menu");
    if(!isLoaded) {
      fetch(`${cms.htmx}${mobile_menu_path}?page_id=${page_id}`)
      .then(response => response.text())
      .then(data => {
        mobileMenuContainer.innerHTML = data;
        if (typeof htmx !== 'undefined') htmx.process(mobileMenuContainer);
      }); 
    }
  }

  /**
   *  Function to run with htmx
   *  Usually this function are used inline
   *  @example onclick="wirekit.htmx('menu')"
   */
  methods.htmx = function(arg) {

    // If its a menu item, add aactive class
    if(arg === "menu" || arg === "menu-item") {
      let menuItems =  document.querySelectorAll(".menu-item, .submenu-item");
      // reset all menu items active classes
      menuItems.forEach(e => { e.classList.remove("wk-active")})
      // get clicked menu-item or submenu-item parent node (li)
      // add active class
      let li = event.target.parentNode;
      li.classList.add("wk-active");
      if(li.classList.contains("submenu-item")) {
        let li2 = event.target.closest(".menu-item");
        li2.classList.add("wk-active");
      }
      // Do stuff after htmx Load
      event.target.addEventListener("htmx:afterOnLoad", function() {
        // update browser title
        let title = event.target.getAttribute("title");
        document.title = title;
        // Scroll to top on page change
        window.scroll({top: 0, left: 0});
        // Close mobile menu
        let mobileMenuContainer = document.querySelector("#mobile-menu-container");
        let mobileButton = document.querySelector("#mobile-menu-button");
        if (mobileMenuContainer) mobileMenuContainer.classList.remove("wk-active");
        if (mobileButton) mobileButton.classList.remove("wk-active");
      });
    }

    // Update browser title based on title="" attribute
    // Scroll to top
    if(arg === "page") {
      let title = event.target.getAttribute("data-title");
      event.target.addEventListener("htmx:afterOnLoad", function() {
        document.title = title;
        window.scroll({top: 0, left: 0});
      });
    }
    
  }

	// Expose the public methods
	return methods;

})();