//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require materialize-sprockets

$(document).ready(function(){
  // Initializes sidebar button
  $(".button-collapse").sideNav(); 

  // Manages Flash Messages
  $('div.flash').delay(500).slideDown('normal', function() {
    $(this).delay(2500).slideUp();
  });

  // Hides navbar when scrolling down, shows navbar when scrolling up
  // Used some help from stackoverflow:
  // http://stackoverflow.com/a/10545584/4859818
  $(window).bind('mousewheel', function(event) {
    if (event.originalEvent.wheelDelta >= 0) {
      $('.navbar').slideDown();
    }
    else {
      $('.navbar').slideUp();
    }
  });
});
