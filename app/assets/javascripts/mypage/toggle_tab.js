$(document).on('turbolinks:load', function() {

  // タブの切替
  $('.index-contents__tab-container__tabs__tab__link').click(function(e) {
    e.preventDefault();
    let clickedTab = $(this).data('tab');


    if (clickedTab === 'notice' || clickedTab === 'todo') {
      //上部のタブコンテナ
      
      //タブの切替
      let notClickedTab = clickedTab === 'notice' ? 'todo' : 'notice';
      $('a[data-tab=' + notClickedTab + ']').removeClass('active');
      $(this).addClass('active');

      //コンテンツの切替
      $('.index-contents__tab-container__items').removeClass('active');
      $('ul[data-items=' + clickedTab + ']').addClass('active');

    } else if (clickedTab === 'transaction-now' || clickedTab === 'transaction-old') {
      //下部のタブ

      //タブの切替
      let notClickedTab = clickedTab === 'transaction-now' ? 'transaction-old' : 'transaction-now';
      $('a[data-tab=' + notClickedTab + ']').removeClass('active');
      $(this).addClass('active');

      //コンテンツの切替
      $('.index-contents__tab-container__contents__transactions').removeClass('active');
      $('ul[data-items=' + clickedTab + ']').addClass('active');

    }

  });

});