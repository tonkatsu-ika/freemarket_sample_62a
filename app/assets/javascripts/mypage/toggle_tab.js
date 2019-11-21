$(document).on('turbolinks:load', function() {

  // タブの切替
  $('.index-contents__tab-container__tabs__tab__link').click(function(e) {
    e.preventDefault();
    console.log(this);
    let clickedTab = $(this).data('tab');
    console.log(clickedTab);
    if (clickedTab === 'notice' || clickedTab === 'todo') {
      $('.index-contents__tab-container__items').removeClass('active');
      $('.index-contents__tab-container__items').data(clickedTab)

    } else if (clickedTab === 'transaction-now' || clickedTab === 'transaction-old') {
      console.log('clickd transactions');
      $('.index-contents__tab-container__contents__transactions').removeClass('active');
    }

  });

});