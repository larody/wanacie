// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require_tree .

$(function() {
  $("#result th a, #result .pagination a").live("click", function() {
    $.getScript(this.href);
    return false;
  });

  $("#events_search input").keyup(function() {
    $.get($("#events_search").attr("action"), $("#events_search").serialize(), null, "script");
    return false;
  });

/*  to be DIV clickable
 *  $(".event").click(function(){
    window.location=$(this).find("a").attr("href"); 
    return false;
  });
*/

/*
  $("form :input").focus(function() {
    $("label[for='" + this.id + "']").addClass("labelfocus");
  });

  $("form :input").blur(function() {
    $("label[for='" + this.id + "']").removeClass("labelfocus");
  });
*/

  $('*')
    .ajaxStart   (function() {$('#progress').html('<i class="icon-spinner icon-spin"></i>')})
    .ajaxComplete(function() {$('#progress').html('')});

  // Timepicker for Twitter Bootstrap
/*
  $('#event_held_datetime').clockface({
    format: 'HH:mm',
    trigger: 'manual'
  });
 
  // Timepicker for Twitter Bootstrap
  $('#toggle-btn').click(function(e){   
    e.stopPropagation();
    $('#event_held_datetime').clockface('toggle');
  });
*/

/*
  // jQuery.timepicker
  $("#timepicker").timepicker({
    'setTime': new Date(),
    'forceRoundTime': true,
    'scrollDefaultNow': true,
    'step': 10
  });
*/

});
