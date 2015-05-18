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
  // Warning when not check a correct answer
  $("input[name=btn_submit]").click(function(){
    var check_flag = false;  
    $("input[type=checkbox]").each(function(){
      if ($(this).prop('checked') == true){ 
        check_flag = true;
      }
    });
    if(check_flag == false){
      var cf = confirm("Warning, your word don't have answer correct yet!. Are you sure?");
      if(cf == false){
        return false;
      }
    }
  });

  // Get words number  
  var rgroups = [];
  $('input:radio').each(function(index, el){
    var i;
      for(i = 0; i < rgroups.length; i++)
        if(rgroups[i] == $(el).attr('name'))
            return true;
      rgroups.push($(el).attr('name'));
    }
  );
  rgroups = rgroups.length;
  $('.word_num').text(rgroups);
  
  // Show progress lesson
  $('input:radio').click(function(){
    var checked = $("input:radio:checked").length;
    $('.check_num').text(checked);
  });

  // Lesson slider
  $('.bxslider').bxSlider({
    captions: true,
    controls: true,
    nextText: "Next",
    prevText: "Prev"
  });
});

// Answer check only one
$(document).on('click','input[type=checkbox]', function(){    
  $("input[type=checkbox]").not($(this)).prop('checked', false);  
});
