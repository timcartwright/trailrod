// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require jquery-ui/autocomplete
//= require autocomplete-rails
//= require materialize-sprockets
//= require turbolinks
//= require nprogress
//= require nprogress-turbolinks
//= require_tree .

/*!
 * imagesLoaded PACKAGED v4.1.0
 * JavaScript is all like "You images are done yet or what?"
 * MIT License
 */

!function(t,e){"function"==typeof define&&define.amd?define("ev-emitter/ev-emitter",e):"object"==typeof module&&module.exports?module.exports=e():t.EvEmitter=e()}(this,function(){function t(){}var e=t.prototype;return e.on=function(t,e){if(t&&e){var i=this._events=this._events||{},n=i[t]=i[t]||[];return-1==n.indexOf(e)&&n.push(e),this}},e.once=function(t,e){if(t&&e){this.on(t,e);var i=this._onceEvents=this._onceEvents||{},n=i[t]=i[t]||[];return n[e]=!0,this}},e.off=function(t,e){var i=this._events&&this._events[t];if(i&&i.length){var n=i.indexOf(e);return-1!=n&&i.splice(n,1),this}},e.emitEvent=function(t,e){var i=this._events&&this._events[t];if(i&&i.length){var n=0,o=i[n];e=e||[];for(var r=this._onceEvents&&this._onceEvents[t];o;){var s=r&&r[o];s&&(this.off(t,o),delete r[o]),o.apply(this,e),n+=s?0:1,o=i[n]}return this}},t}),function(t,e){"use strict";"function"==typeof define&&define.amd?define(["ev-emitter/ev-emitter"],function(i){return e(t,i)}):"object"==typeof module&&module.exports?module.exports=e(t,require("ev-emitter")):t.imagesLoaded=e(t,t.EvEmitter)}(window,function(t,e){function i(t,e){for(var i in e)t[i]=e[i];return t}function n(t){var e=[];if(Array.isArray(t))e=t;else if("number"==typeof t.length)for(var i=0;i<t.length;i++)e.push(t[i]);else e.push(t);return e}function o(t,e,r){return this instanceof o?("string"==typeof t&&(t=document.querySelectorAll(t)),this.elements=n(t),this.options=i({},this.options),"function"==typeof e?r=e:i(this.options,e),r&&this.on("always",r),this.getImages(),h&&(this.jqDeferred=new h.Deferred),void setTimeout(function(){this.check()}.bind(this))):new o(t,e,r)}function r(t){this.img=t}function s(t,e){this.url=t,this.element=e,this.img=new Image}var h=t.jQuery,a=t.console;o.prototype=Object.create(e.prototype),o.prototype.options={},o.prototype.getImages=function(){this.images=[],this.elements.forEach(this.addElementImages,this)},o.prototype.addElementImages=function(t){"IMG"==t.nodeName&&this.addImage(t),this.options.background===!0&&this.addElementBackgroundImages(t);var e=t.nodeType;if(e&&d[e]){for(var i=t.querySelectorAll("img"),n=0;n<i.length;n++){var o=i[n];this.addImage(o)}if("string"==typeof this.options.background){var r=t.querySelectorAll(this.options.background);for(n=0;n<r.length;n++){var s=r[n];this.addElementBackgroundImages(s)}}}};var d={1:!0,9:!0,11:!0};return o.prototype.addElementBackgroundImages=function(t){var e=getComputedStyle(t);if(e)for(var i=/url\((['"])?(.*?)\1\)/gi,n=i.exec(e.backgroundImage);null!==n;){var o=n&&n[2];o&&this.addBackground(o,t),n=i.exec(e.backgroundImage)}},o.prototype.addImage=function(t){var e=new r(t);this.images.push(e)},o.prototype.addBackground=function(t,e){var i=new s(t,e);this.images.push(i)},o.prototype.check=function(){function t(t,i,n){setTimeout(function(){e.progress(t,i,n)})}var e=this;return this.progressedCount=0,this.hasAnyBroken=!1,this.images.length?void this.images.forEach(function(e){e.once("progress",t),e.check()}):void this.complete()},o.prototype.progress=function(t,e,i){this.progressedCount++,this.hasAnyBroken=this.hasAnyBroken||!t.isLoaded,this.emitEvent("progress",[this,t,e]),this.jqDeferred&&this.jqDeferred.notify&&this.jqDeferred.notify(this,t),this.progressedCount==this.images.length&&this.complete(),this.options.debug&&a&&a.log("progress: "+i,t,e)},o.prototype.complete=function(){var t=this.hasAnyBroken?"fail":"done";if(this.isComplete=!0,this.emitEvent(t,[this]),this.emitEvent("always",[this]),this.jqDeferred){var e=this.hasAnyBroken?"reject":"resolve";this.jqDeferred[e](this)}},r.prototype=Object.create(e.prototype),r.prototype.check=function(){var t=this.getIsImageComplete();return t?void this.confirm(0!==this.img.naturalWidth,"naturalWidth"):(this.proxyImage=new Image,this.proxyImage.addEventListener("load",this),this.proxyImage.addEventListener("error",this),this.img.addEventListener("load",this),this.img.addEventListener("error",this),void(this.proxyImage.src=this.img.src))},r.prototype.getIsImageComplete=function(){return this.img.complete&&void 0!==this.img.naturalWidth},r.prototype.confirm=function(t,e){this.isLoaded=t,this.emitEvent("progress",[this,this.img,e])},r.prototype.handleEvent=function(t){var e="on"+t.type;this[e]&&this[e](t)},r.prototype.onload=function(){this.confirm(!0,"onload"),this.unbindEvents()},r.prototype.onerror=function(){this.confirm(!1,"onerror"),this.unbindEvents()},r.prototype.unbindEvents=function(){this.proxyImage.removeEventListener("load",this),this.proxyImage.removeEventListener("error",this),this.img.removeEventListener("load",this),this.img.removeEventListener("error",this)},s.prototype=Object.create(r.prototype),s.prototype.check=function(){this.img.addEventListener("load",this),this.img.addEventListener("error",this),this.img.src=this.url;var t=this.getIsImageComplete();t&&(this.confirm(0!==this.img.naturalWidth,"naturalWidth"),this.unbindEvents())},s.prototype.unbindEvents=function(){this.img.removeEventListener("load",this),this.img.removeEventListener("error",this)},s.prototype.confirm=function(t,e){this.isLoaded=t,this.emitEvent("progress",[this,this.element,e])},o.makeJQueryPlugin=function(e){e=e||t.jQuery,e&&(h=e,h.fn.imagesLoaded=function(t,e){var i=new o(this,t,e);return i.jqDeferred.promise(h(this))})},o.makeJQueryPlugin(),o});

$(document).ready(function() {

  // jquery helpers
  $.fn.isAfter = function(sel){
      return this.prevAll().filter(sel).length !== 0;
  };

  $.fn.isBefore = function(sel){
      return this.nextAll().filter(sel).length !== 0;
  };

  function navigation() {
    // nav
    $(".button-collapse").sideNav();

    $(".openNav").click(function() {
      $("body").toggleClass("navOpen");
      $("nav").toggleClass("open");
      $(".wrapper").toggleClass("open");
      $(this).toggleClass("open");
    });
  };

  function animate() {
    // animation of tile positions
    var speed = 2000;
    var container =  $('.display-animation');
    container.each(function() {
      var elements = $(this).children();
      elements.each(function() {
        if (!$(this).hasClass('do-not-animate')) {
          var elementOffset = $(this).offset();
          var offset = elementOffset.left*0.8 + elementOffset.top;
          var delay = parseFloat(offset/speed).toFixed(2);
          $(this)
            .css("-webkit-animation-delay", delay+'s')
            .css("-o-animation-delay", delay+'s')
            .css("animation-delay", delay+'s')
            .addClass('animated');
          };
      });
    });
  };

  function rippleEffect() {
    // ripple effect on click
    $(".ripple-effect").click(function(e){
      var rippler = $(this);

      // create .ink element if it doesn't exist
      if(rippler.find(".ink").length == 0) {
          rippler.append("<span class='ink'></span>");
      }

      var ink = rippler.find(".ink");

      // prevent quick double clicks
      ink.removeClass("animate");

      // set .ink diametr
      if(!ink.height() && !ink.width())
      {
          var d = Math.max(rippler.outerWidth(), rippler.outerHeight());
          ink.css({height: d, width: d});
      }

      // get click coordinates
      var x = e.pageX - rippler.offset().left - ink.width()/2;
      var y = e.pageY - rippler.offset().top - ink.height()/2;

      // set .ink position and add class .animate
      ink.css({
          top: y+'px',
          left:x+'px'
      }).addClass("animate");
    });
  };

  function changeBoxOrder() {
    // Swap divs for mobile layout
    if (window.matchMedia("(max-width: 900px)").matches) {
      if ($('.swap-me').isBefore($('.swap-me-with'))) {
        $('.swap-me').remove().insertAfter($('.swap-me-with'));
      }
    }
    else
    {
      if ($('.swap-me').isAfter($('.swap-me-with'))) {
        $('.swap-me').remove().insertBefore($('.swap-me-with'));
      }
    }
  };
  
  function materializeInit() {
    $('.dashboard .outside-dashboard').remove().insertAfter($('.dashboard'));

    $('.dateofbirthpicker').pickadate({
      selectMonths: true, // Creates a dropdown to control month
      selectYears: 100, // Creates a dropdown of 100 years to control year
      formatSubmit: 'yyyy-mm-dd',
      hiddenName: true,
      max: -1500
    });

    $('.datepicker').pickadate({
      selectMonths: true, // Creates a dropdown to control month
      selectYears: true // Creates a dropdown of 15 years to control year
    });

    $('select').material_select();
    
    $('.modal-trigger').leanModal();
  };

  //on load
  NProgress.start();
  navigation();
  changeBoxOrder();
  rippleEffect();
  materializeInit();
  

  $('.load-first').imagesLoaded({ background: true })
    .always( function( instance ) {
      console.log('all images loaded');
      NProgress.done();
      animate();
    })
    .progress( function( instance, image ) {
      var result = image.isLoaded ? 'loaded' : 'broken';
      console.log( 'image is ' + result + ' for ' + image.img.src );
    });

  //on resize
  window.addEventListener('resize', changeBoxOrder );
});

