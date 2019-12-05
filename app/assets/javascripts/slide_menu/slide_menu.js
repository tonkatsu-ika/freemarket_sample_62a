// ヘッダーのブランドスライドメニュー
$(document).on('turbolinks:load', function () {

  $('#slide_brands').mouseover(function() {
    $('.slide-brands-wrapper').show();
  });
  $('#slide_brands').mouseout(function() {
    $('.slide-brands-wrapper').hide();
  });

  $('.slide-brands-wrapper').mouseover(function() {
    $('.slide-brands-wrapper').show();
  });

  $('.slide-brands-wrapper').mouseout(function() {
    $('.slide-brands-wrapper').hide();
  });

});