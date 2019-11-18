// ヘッダーのブランドスライドメニュー
$(document).on('turbolinks:load', function () {

  $('#slide_brands').mouseover(function() {
    $(this).find('.slide-brands-wrapper').addClass('active');
  });
  $('#slide_brands').mouseout(function() {
    $(this).find('.slide-brands-wrapper').removeClass('active');
  });

});