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
//= require_tree .

$(document).ready(function() {

  // nav
  $(".button-collapse").sideNav();

  $(".openNav").click(function() {
    $("body").toggleClass("navOpen");
    $("nav").toggleClass("open");
    $(".wrapper").toggleClass("open");
    $(this).toggleClass("open");
  });

  // animation of tile positions on load
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

  // Swap divs for mobile layout

  function responsive_change_box_order() {
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
  
  $.fn.isAfter = function(sel){
      return this.prevAll().filter(sel).length !== 0;
  };

  $.fn.isBefore = function(sel){
      return this.nextAll().filter(sel).length !== 0;
  };

  //on load
  responsive_change_box_order();

  //on resize
  window.addEventListener('resize', responsive_change_box_order );

  function materialize_init() {
    $('.dateofbirthpicker').pickadate({
      selectMonths: true, // Creates a dropdown to control month
      selectYears: 100, // Creates a dropdown of 15 years to control year
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

  $('.dashboard .outside-dashboard').remove().insertAfter($('.dashboard'));

  materialize_init();
});