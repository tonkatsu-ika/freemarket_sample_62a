// ヘッダーのブランドスライドメニュー
$(document).on('turbolinks:load', function () {

  $('#slide_brands').mouseover(function() {
    console.log('in');
  });
  $('#slide_brands').mouseout(function() {
    console.log('out');
  });

});