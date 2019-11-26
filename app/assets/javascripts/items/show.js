$(function(){
  let slider = $("#slider");
  let thumbnailItem = $("#thumbnail-list .thumbnail-item");
  
  //サムネイルにindex番号を振る
  $(thumbnailItem).each(function(){
    let index = $(thumbnailItem).index(this);
    $(this).attr("data-slick-index",index);
  });

  //現在表示中のサムネイルとわかるようにクラスを追加
  $(slider).on('init',function(slick){
    var index = $(".slide-item.slick-slide.slick-current").attr("data-slick-index");
    $(thumbnailItem['data-slick-index="'+index+'"']).addClass("thumbnail-current");
  });

  $(slider).slick({
    autoplay:false,  
    dots:false, 
    arrows: false,
    infinite: false,
    waitForAnimate: false
  });
 
    //サムネイルにホバーした時、スライドを移動
  $(thumbnailItem).hover(function(){
    let index = $(this).attr("data-slick-index");
    $(slider).slick("slickGoTo",index,false);
  });
  
  //スライド移動時、クラスの付け替え
  $(slider).on('beforeChange',function(nextSlide){
    $(thumbnailItem).each(function(){
      $(this).removeClass("thumbnail-current");
    });
    $(thumbnailItem['data-index="'+nextSlide+'"']).addClass("thumbnail-current");
  });

  //サムネイルをホバーした時の透明度の変更
  $('#thumbnail-list').children().hover(function() {
    $(this).siblings().stop().fadeTo(500,0.3);
    }, function() {
    $(this).siblings().stop().fadeTo(500,1);
    });

    
});

  

