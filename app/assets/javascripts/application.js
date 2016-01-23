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
//= require materialize-sprockets
//= require turbolinks
//= require_tree .

/*! waitForImages jQuery Plugin 2015-06-02 */
!function(a){"function"==typeof define&&define.amd?define(["jquery"],a):a(jQuery)}(function(a){var b="waitForImages";a.waitForImages={hasImageProperties:["backgroundImage","listStyleImage","borderImage","borderCornerImage","cursor"],hasImageAttributes:["srcset"]},a.expr[":"]["has-src"]=function(b){return a(b).is('img[src][src!=""]')},a.expr[":"].uncached=function(b){return a(b).is(":has-src")?!b.complete:!1},a.fn.waitForImages=function(){var c,d,e,f=0,g=0,h=a.Deferred();if(a.isPlainObject(arguments[0])?(e=arguments[0].waitForAll,d=arguments[0].each,c=arguments[0].finished):1===arguments.length&&"boolean"===a.type(arguments[0])?e=arguments[0]:(c=arguments[0],d=arguments[1],e=arguments[2]),c=c||a.noop,d=d||a.noop,e=!!e,!a.isFunction(c)||!a.isFunction(d))throw new TypeError("An invalid callback was supplied.");return this.each(function(){var i=a(this),j=[],k=a.waitForImages.hasImageProperties||[],l=a.waitForImages.hasImageAttributes||[],m=/url\(\s*(['"]?)(.*?)\1\s*\)/g;e?i.find("*").addBack().each(function(){var b=a(this);b.is("img:has-src")&&j.push({src:b.attr("src"),element:b[0]}),a.each(k,function(a,c){var d,e=b.css(c);if(!e)return!0;for(;d=m.exec(e);)j.push({src:d[2],element:b[0]})}),a.each(l,function(c,d){var e,f=b.attr(d);return f?(e=f.split(","),void a.each(e,function(c,d){d=a.trim(d).split(" ")[0],j.push({src:d,element:b[0]})})):!0})}):i.find("img:has-src").each(function(){j.push({src:this.src,element:this})}),f=j.length,g=0,0===f&&(c.call(i[0]),h.resolveWith(i[0])),a.each(j,function(e,j){var k=new Image,l="load."+b+" error."+b;a(k).one(l,function m(b){var e=[g,f,"load"==b.type];return g++,d.apply(j.element,e),h.notifyWith(j.element,e),a(this).off(l,m),g==f?(c.call(i[0]),h.resolveWith(i[0]),!1):void 0}),k.src=j.src})}),h.promise()}});


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

  $('.display-animation').waitForImages(function() {
    // All descendant images have loaded, now slide up.
    console.log("Images Loaded");
    var speed = 2000;
    var container =  $('.display-animation');
    container.each(function() {
      var elements = $(this).children();
      elements.each(function() {
        var elementOffset = $(this).offset();
        var offset = elementOffset.left*0.8 + elementOffset.top;
        var delay = parseFloat(offset/speed).toFixed(2);
        $(this)
          .css("-webkit-animation-delay", delay+'s')
          .css("-o-animation-delay", delay+'s')
          .css("animation-delay", delay+'s')
          .addClass('animated');
      });
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
  
});




