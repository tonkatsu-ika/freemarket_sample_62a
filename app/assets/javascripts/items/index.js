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

  
    // #で始まるアンカーをクリックした場合に処理
    // $('a[href^=#]').click(function() {
    //    // スクロールの速度
       
    //    var speed = 400; // ミリ秒
    //    // アンカーの値取得
    //    var href= $(this).attr("href");
    //    // 移動先を取得
    //    var target = $(href == "#" || href == "" ? 'html' : href);
    //    // 移動先を数値で取得
    //    var position = target.offset().top;
    //    // スムーススクロール
    //    $('body,html').animate({scrollTop:position}, speed, 'swing');
    //    return false;
    // });
 

});