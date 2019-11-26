$(document).on('turbolinks:load', function(){
  $("#index-slide").slick({
    speed: 1000,
    dots: true,
    // prevArrow: '<button class="fas.fa-chevron-left"></button>',
    // nextArrow: '<button class="fas.fa-chevron-right"></button>'
    nextArrow: '<i class="fas fa-chevron-right"></i>',
    prevArrow: '<i class="fas fa-chevron-left"></i>',


});
});