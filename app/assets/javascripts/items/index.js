$(document).on('turbolinks:load', function(){

  $("#index-slide").slick({
    speed: 1000,
    // prevArrow: '<button class="fas.fa-chevron-left"></button>',
    // nextArrow: '<button class="fas.fa-chevron-right"></button>'
    // nextArrow: '<i class="fas fa-chevron-right"></i>',
    // prevArrow: '<i class="fas fa-chevron-left"></i>',
    dots: false,
    autoplay: 500,
});

  setTimeout("$('.notifications').fadeOut('slow')", 1000) 

});