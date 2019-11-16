$(function(){

  var selectbox = `<select class='sell-wrapper__form__detail__right__upper__select1' name='example'>
                    <option selected='selected' value=''>---</option>
                    <option value='選択肢1'>選択肢1</option>
                    <option value='選択肢2'>選択肢2</option>
                    <option value='選択肢3'>選択肢3</option>
                    </select>`

  $('.sell-wrapper__form__detail__right__upper__select').change(function(){
    var parent_category = $(this).val(); // 親カテゴリーのvalue属性値を取得
    console.log(parent_category);
    $('.sell-wrapper__form__detail__right__upper').append(selectbox);
  })

  $(document).on("change", ".sell-wrapper__form__detail__right__upper__select1", function () {
    var child_category = $(this).val(); // 子カテゴリーのvalue属性値を取得
    $('.sell-wrapper__form__detail__right__upper').append(selectbox);
  });

  // 販売手数料と利益を計算して表示
  $('.sell-wrapper__form__price__first__wrapper__right__money').keyup(function(){
    var price = $(this).val();
    if (price >= 300) {
      var fee = price * 0.1;
      var fee_top = '¥' + Math.floor(fee).toLocaleString();
      $('.sell-wrapper__form__price__second__right').text(fee_top);
      var profit = price - Math.floor(fee);
      var profit_top = '¥' + profit.toLocaleString();
      $('.sell-wrapper__form__price__third__right').text(profit_top);
    } else {
      $('.sell-wrapper__form__price__second__right').text('-');
      $('.sell-wrapper__form__price__third__right').text('-');
    }
  })
})