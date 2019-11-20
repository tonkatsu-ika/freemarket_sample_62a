$(document).on('turbolinks:load', function() {
  var nowPoint = $(".now-point").text()
  console.log(nowPoint)
  $('.'+nowPoint).attr('id', 'red');
  $('.'+nowPoint).find(".progss-bar__maru").attr('id', 'point-red');
});