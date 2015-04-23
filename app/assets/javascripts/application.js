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
//= require jquery_ujs
//= require jquery.minicolors
//= require foundation
//= require slick
//= require slider

$(function(){ $(document).foundation(); });

$(function() {
  $('.flash-messages').delay(1500).fadeOut(600);

  $('#color1').minicolors().minicolors('value', '#fef0d9');
  $('#color2').minicolors().minicolors('value','#fdcc8a');
  $('#color3').minicolors().minicolors('value','#fc8d59');
  $('#color4').minicolors().minicolors('value','#e34a33');
  $('#color5').minicolors().minicolors('value','#b30000');
});
