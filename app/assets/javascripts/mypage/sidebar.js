$(document).on('turbolinks:load', function() {
  
  $('.mypage-sidebar__list__item').hover(function() {
    console.log('OK');
    console.log(this);
    $(this).addClass('hover');
  }, function() {
    console.log('hover-out');
    $(this).removeClass('hover');
  });





});