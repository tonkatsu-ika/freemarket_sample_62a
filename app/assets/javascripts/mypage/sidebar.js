$(document).on('turbolinks:load', function() {
  
  // 各メニューアイテムのホバー時のハイライト・アニメーション
  $('.mypage-sidebar__list__item').hover(function() {
    $(this).addClass('mypage-sidebar__list__item--hover');
  }, function() {
    $(this).removeClass('mypage-sidebar__list__item--hover');
    $(this).addClass('mypage-sidebar__list__item');
  });

  // 現在のページのメニューアイテムの強調
  let currentPagePath = document.location.pathname;

  $('.mypage-sidebar__list__item').each(function(i) {

    $(this).removeClass('mypage-sidebar__list__item--this-page');

    if ($(this).find('.mypage-sidebar__list__item__link').attr('href') === currentPagePath) {
      $(this).addClass('mypage-sidebar__list__item--this-page');
    }
    
  });

});