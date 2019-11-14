$(document).on('turbolinks:load', function() {
  
  $('.mypage-sidebar__list__item').hover(function() {
    console.log('OK');
    console.log(this);
    $(this).addClass('mypage-sidebar__list__item--hover');
  }, function() {
    console.log('hover-out');
    $(this).removeClass('mypage-sidebar__list__item--hover');
    $(this).addClass('mypage-sidebar__list__item');
  });

});