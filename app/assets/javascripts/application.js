// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require turbolinks
//= require jquery.bxslider
//= require_tree .


$(document).ready(function() {
  // Answer check only one
  $("input[type=checkbox]").click(function(){
    var check_flag = false;    
    $("input[type=checkbox]").not($(this)).prop('checked', false);
    $("input[type=checkbox]").each(function(){
      if ($(this).prop('checked') == true){ 
        check_flag = true;
      }
    });
    if(check_flag == false){
      alert("Warning, your word don't have answer correct yet!");
    }
  });

  // Lesson slider
  $('.bxslider').bxSlider({
    captions: true,
    controls: true,
    nextText: "Next",
    prevText: "Prev"
  });
});

