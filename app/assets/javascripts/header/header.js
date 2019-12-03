$(document).on('turbolinks:load', function(){
  
  // ヘッダー マイページメニュー
  
  $(".header-mypage").on("mouseover", function(){
    $(".header__bottom__user-menu__li__mypage").show()
  });
  
  $(".header-mypage").on("mouseout", function(){
    $(".header__bottom__user-menu__li__mypage").hide()
  });

  $(".header__bottom__user-menu__li__mypage").on("mouseover", function(){
    $(".header__bottom__user-menu__li__mypage").css({
      'cursor': 'default'
    });
    $(".header__bottom__user-menu__li__mypage").show()
  });

  $(".header__bottom__user-menu__li__mypage").on("mouseout", function(){
    $(".header__bottom__user-menu__li__mypage").hide()
  });
  
  // ヘッダーやる事リスト
  
  $(".header-todo").on("mouseover", function(){
    $(".header__bottom__user-menu__li__todo").show()
  });
  
  $(".header-todo").on("mouseout", function(){
    $(".header__bottom__user-menu__li__todo").hide()
  });

  $(".header__bottom__user-menu__li__todo").on("mouseover", function(){
    $(".header__bottom__user-menu__li__todo").show()
  });

  $(".header__bottom__user-menu__li__todo").on("mouseout", function(){
    $(".header__bottom__user-menu__li__todo").hide()
  });

  // ヘッダーお知らせ
  $(".header-notice").on("mouseover", function(){
    $(".header__bottom__user-menu__li__notice").show()
  });
  
  $(".header-notice").on("mouseout", function(){
    $(".header__bottom__user-menu__li__notice").hide()
  });

  $(".header__bottom__user-menu__li__notice").on("mouseover", function(){
    $(".header__bottom__user-menu__li__notice").show()
  });

  $(".header__bottom__user-menu__li__notice").on("mouseout", function(){
    $(".header__bottom__user-menu__li__notice").hide()
  });
  
  $(".header__bottom__user-menu__li__notice").on("mouseover", function(){
    $(".header__bottom__user-menu__li__notice").css({
      'background-color': '#fafafa'
    });
  });

  $(".header__bottom__user-menu__li__notice").on("mouseout", function(){
    $(".header__bottom__user-menu__li__notice").css({
      'background-color': ''
    });
  });



  $("#slide_categories").on("mouseover", function(){
    $(".header-category-list").show()
  });

  $("#slide_categories").on("mouseout", function(){
    $(".header-category-list").hide()
  });

  $(".header-category-list").on("mouseover", function(){
    $(".header-category-list").show()
  });

  $(".header-category-list").on("mouseout", function(){
    $(".header-category-list").hide()
  });



  
});
