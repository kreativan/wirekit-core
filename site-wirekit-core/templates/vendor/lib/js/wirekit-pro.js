/**
 *  wirekit 
 *
 *  @method formData - Collect data from form inputs
 *  @method formClear - Clear data from the form inputs
 *  @method formSubmit - submit forms using wirekit.formSubmit("form_css_id")
 *  @method ajaxReq - send fetch request to provided /ajax/* url
 *  @method mobileMenu - init mobile menu offcanvas
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
   * Submit Form Data to the form action url
   * This should be like: /ajax/example/
   * @param {string} form_id 
   */
  methods.formSubmit = async function(form_id) {
    event.preventDefault();
    let form = document.getElementById(form_id);
    let spinner = form.querySelector(".uk-spinner");
    let span = form.querySelector(".uk-button > span");
    if (span) span.classList.add("uk-hidden");
    if (spinner) spinner.classList.remove("uk-hidden");
    let ajaxUrl = form.getAttribute("action");
    let formData = wirekit.formData(form_id);
    let request = await fetch(ajaxUrl, {
      method: 'POST',
      cache: 'no-cache',
      body: formData
    });
    let response = await request.json();
    if(cms.debug) console.log(response);
    if(response.reset_form) wirekit.formClear(form_id);
    if (response.modal) {
      UIkit.modal.alert(response.modal).then(function () {
        if(response.redirect) window.location.href = response.redirect;
      });
    } else if (response.notification) {
      UIkit.notification({
        message: response.notification,
        status: response.status ? response.status : 'primary',
        pos: 'top-center',
        timeout: 3000
      });
    } else if (response.redirect) {
      window.location.href = response.redirect;
    }
    if (spinner) span.classList.remove("uk-hidden");
    if (spinner) spinner.classList.add("uk-hidden");
  }

  /**
   * Ajax Request on given URl
   * send ajax request on given url and
   * trigger notification/modal if avalable
   * @param {string} url 
   */
  methods.ajaxReq = async function(url) {
    event.preventDefault();
    let request = await fetch(url);
    let response = await request.json();
    if(cms.debug) console.log(response);
    if (response.modal) {
      UIkit.modal.alert(response.modal).then(function () {
        if(response.redirect) window.location.href = response.redirect;
      });
    } else if (response.notification) {
      UIkit.notification({
        message: response.notification,
        status: response.status ? response.status : 'primary',
        pos: 'top-center',
        timeout: 3000
      });
    } else if (response.redirect) {
      window.location.href = response.redirect;
    }
  }

  /**
   *  Load mobile menu inside offcanvas component
   *  @param {Int|String} page_id - current page id
   */
  methods.mobileMenu = function(page_id, mobile_menu_path = cms.mobileMenuPath) {
    event.preventDefault();
    let mobileMenu = document.querySelector("#mobile-menu");
    let isLoaded = mobileMenu.querySelector(".uk-offcanvas-close");
    UIkit.offcanvas(mobileMenu).show();
    if(!isLoaded) {
      fetch(`${cms.htmx}${mobile_menu_path}?page_id=${page_id}`)
      .then(response => response.text())
      .then(data => {
        let mobileMenuBar = mobileMenu.querySelector(".uk-offcanvas-bar");
        mobileMenuBar.innerHTML = data;
        if (typeof htmx !== 'undefined') htmx.process(mobileMenuBar);
      }); 
    }
  }

  /**
   *  Function to run along with htmx
   *  Usually this functions are used inline
   *  @example onclick="wirekit.htmx('menu')"
   */
  methods.htmx = function(arg) {

    // If its a menu item, add active class
    if(arg === "menu" || arg === "menu-item") {
      let menuItems =  document.querySelectorAll(".menu-item, .submenu-item");
      // reset all menu items active classes
      menuItems.forEach(e => { e.classList.remove("uk-active")})
      // get clicked menu-item or submenu-item parent node (li)
      // add active class
      let li = event.target.parentNode;
      li.classList.add("uk-active");
      if(li.classList.contains("submenu-item")) {
        let li2 = event.target.closest(".menu-item");
        li2.classList.add("uk-active");
      }
      // close and remove htmx-offcanvas if exists
      let offcanvas = window.document.getElementById("htmx-offcanvas");
      if(offcanvas) {
        UIkit.offcanvas(offcanvas).hide();
        UIkit.util.on('#htmx-offcanvas', 'hidden', function () {
          offcanvas.remove();
        });
      }
      // Close open offcanvas if any
      let open_offcanvas = window.document.querySelector(".uk-offcanvas.uk-open");
      if (open_offcanvas) UIkit.offcanvas(open_offcanvas).hide();
      // Do stuff after htmx Load
      event.target.addEventListener("htmx:afterOnLoad", function() {
        // Update browser 
        let title = event.target.getAttribute("title");
        document.title = title;
        // Scroll to top on page change
        window.scroll({top: 0, left: 0});
      });
    }

    /**
     * UIkit Modal with htmx
     * Load modal from custom /htmx/my-modal/ url
     * On close, remove it from the dom using uikit hidden event 
     */
    if(arg === "modal") {
      let isHtmxElement = event.target.hasAttribute("hx-target") ? true : false;
      let htmxEl = isHtmxElement ? event.target : event.target.closest("[hx-target]");
      htmxEl.addEventListener("htmx:afterOnLoad", function() {
        let modal = window.document.getElementById("htmx-modal");
        UIkit.modal(modal).show();
        UIkit.util.on('#htmx-modal', 'hidden', function () {
          modal.remove();
        });
      })
    }

    /**
     * UIkit Offcanvas with htmx
     * Laod offcanvas from custom /htmx/my-offcanvas/ url
     * On close, remove it from the dom using uikit hidden event 
     */
     if(arg === "offcanvas") {
      let isHtmxElement = event.target.hasAttribute("hx-target") ? true : false;
      let htmxEl = isHtmxElement ? event.target : event.target.closest("[hx-target]");
      htmxEl.addEventListener("htmx:afterOnLoad", function() {
        let offcanvas = window.document.getElementById("htmx-offcanvas");
        UIkit.offcanvas(offcanvas).show();
        UIkit.util.on('#htmx-offcanvas', 'hidden', function () {
          offcanvas.remove();
        });
      })
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