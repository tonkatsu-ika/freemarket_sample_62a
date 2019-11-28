$(document).on('turbolinks:load', function(){
  function appendOption(category){
    var html = `<option value=${category.id}>${category.category_name}</option>`;
    return html;
  }

  function appendOptionSize(size){
    var html = `<option value=${size.id}>${size.size}</option>`;
    return html;
  }

  // 子カテゴリーの選択フォーム
  function appendChidrenBox(insertHTML){
    var selectbox1 = `<div class='sell-wrapper__form__detail__right__upper__select__child'>
                        <select class='sell-wrapper__form__detail__right__upper__child sell-wrapper__form__select' name='item[category_id]'>
                        <option selected='selected' value="---">---</option>
                        ${insertHTML}
                        </select>
                      </div>`;
    $('.sell-wrapper__form__detail__right__upper').append(selectbox1);
  }

  // 孫カテゴリーの選択フォーム
  function appendChidrenBox2(insertHTML){
    var selectbox2 = `<div class='sell-wrapper__form__detail__right__upper__select__grandchild'>
                        <select class='sell-wrapper__form__detail__right__upper__grandchild sell-wrapper__form__select' name='item[category_id]'>
                        <option selected='selected' value='---'>---</option>
                        ${insertHTML}
                        </select>
                      </div>`;
    $('.sell-wrapper__form__detail__right__upper__select__child').append(selectbox2);
  }

  function appendSizeBox1(insertHTML) {
    var sizebox = `<div class='sell-wrapper__form__detail__right__bottom'>
                    <div class='sell-wrapper__form__detail__right__upper__category'>
                    <div class='sell-wrapper__form__content__name__title'>サイズ</div>
                    <span class='sell-wrapper__form--must sell-wrapper__form__content__must'>必須</span>
                    </div>
                    <select name="item[size_id]" id="item_condition_id" class="sell-wrapper__form__select">
                    <option value="">---</option>
                    ${insertHTML}
                    </select>
                  </div>`
    $('.sell-wrapper__form__detail__right__upper__select__grandchild').append(sizebox);
  }

  function appendSizeBox2(insertHTML) {
    var sizebox = `<div class='sell-wrapper__form__detail__right__bottom'>
                    <div class='sell-wrapper__form__detail__right__upper__category'>
                    <div class='sell-wrapper__form__content__name__title'>サイズ</div>
                    <span class='sell-wrapper__form--must sell-wrapper__form__content__must'>必須</span>
                    </div>
                    <select name="item[size_id]" id="item_condition_id" class="sell-wrapper__form__select">
                    <option value="">---</option>
                    ${insertHTML}
                    </select>
                  </div>`
    $('.sell-wrapper__form__detail__right__upper__select__child').append(sizebox);
  }

var patternForEditItemPath = new RegExp('\/items\/\\d{1,}\/edit');
// 商品編集ページの場合はtrue
var isItemEditPath = patternForEditItemPath.test(location.pathname); 

  // 親カテゴリーのセレクトがチェンジされたら
  $('.sell-wrapper__form__detail__right__upper__select').change(function(){
    // 編集ページと出品ページで親カテゴリの取り方を変える
    if ( isItemEditPath ) {
      var parent_category = $('.sell-wrapper__form__select__parent option:selected').text();
    } else {
      var parent_category = $('.sell-wrapper__form__detail__right__upper__select option:selected').text(); // 親カテゴリーのvalue属性値を取得
    }
    // 商品編集時のみ：子カテゴリを「---」にし、既に表示されている孫カテゴリとサイズを消去する
    $('.sell-wrapper__form__select__child').remove();
    $('.sell-wrapper__form__select__grandchild').remove();
    $('.sell-wrapper__form__select__size').remove();
    $('.sell-wrapper__form__detail__right__upper__category__size').remove();
    // 以下、ajax本体
    $.ajax({
      type: 'GET',
      url: '/items/get_category_children',
      data: { parent_name: parent_category },
      dataType: 'json'
    })
    .done(function(data){
      $('.sell-wrapper__form__detail__right__upper').children('.sell-wrapper__form__detail__right__upper__select__child').remove();
      var insertHTML = '';
      data.forEach(function(child){
        insertHTML += appendOption(child);
      });
      appendChidrenBox(insertHTML);
    })
    .fail(function(){
      $('.sell-wrapper__form__detail__right__upper').children('.sell-wrapper__form__detail__right__upper__select__child').remove();
    });
  });

  // 子カテゴリーのセレクトがチェンジされたら
  $(document).on("change", ".sell-wrapper__form__detail__right__upper__child", function () {
    var child_category_id = $('.sell-wrapper__form__detail__right__upper__select__child option:selected').val();
    if (child_category_id != "---"){
      if (child_category_id != 147){
        $.ajax({
          type: 'GET',
          url: '/items/get_category_grandchildren',
          data: { child_id: child_category_id},
          dataType: 'json'
        })
        .done(function(data){
          $('.sell-wrapper__form__detail__right__upper__select__child').children('.sell-wrapper__form__detail__right__upper__select__grandchild').remove();
          $('.sell-wrapper__form__detail__right__upper__select__child').children('.sell-wrapper__form__detail__right__bottom').remove();
          var insertHTML = '';
          data.forEach(function(child){
            insertHTML += appendOption(child);
          });
          appendChidrenBox2(insertHTML);
        })
        .fail(function(){
          $('.sell-wrapper__form__detail__right__upper__select__child').children('.sell-wrapper__form__detail__right__upper__select__grandchild').remove();
        });
      }else {
        $.ajax({
          type: 'GET',
          url: '/items/get_category_size',
          data: { grandchild_id: child_category_id},
          dataType: 'json'
        })
        .done(function(data){
          $('.sell-wrapper__form__detail__right__upper__select__child').children('.sell-wrapper__form__detail__right__upper__select__grandchild').remove();
          var insertHTML = '';
          data.forEach(function(size) {
            insertHTML += appendOptionSize(size);
          });
          appendSizeBox2(insertHTML);
        })
        .fail(function() {
          alert('失敗しました');
        })
      }
    }else {
      $('.sell-wrapper__form__detail__right__upper__select__child').children('.sell-wrapper__form__detail__right__upper__select__grandchild').remove();
    }
  });

  // 孫カテゴリーのセレクトがチェンジされたら
  $(document).on("change", ".sell-wrapper__form__detail__right__upper__grandchild", function () {
    var grandchild_category_id = $('.sell-wrapper__form__detail__right__upper__grandchild option:selected').val(); // 孫カテゴリーのvalue属性値を取得

    $.ajax({
      type: 'GET',
      url: '/items/get_category_size',
      data: { grandchild_id: grandchild_category_id},
      dataType: 'json'
    })
    .done(function(data) {
      $('.sell-wrapper__form__detail__right__upper__select__grandchild').children('.sell-wrapper__form__detail__right__bottom').remove();
      if ($.isEmptyObject(data) != true){
        var insertHTML = '';
        data.forEach(function(size) {
          insertHTML += appendOptionSize(size);
        });
        appendSizeBox1(insertHTML);
      }
    })
    .fail(function() {
      $('.sell-wrapper__form__detail__right__upper__select__grandchild').children('.sell-wrapper__form__detail__right__bottom');
    })
  });


  // 販売手数料と利益を計算して表示↓
  $('.sell-wrapper__form__price__first__wrapper__right__money').keyup(function() {
    var price = $(this).val();
    if (price >= 300 && price <= 9999999 && price.match(/^([1-9]\d*|0)$/) ) {
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

  // 画像の複数枚投稿↓

  var dropzone = $('.dropzone-area'); // 変数dropzone-areaに.dropzone-areaのパラメータを代入
  var dropzone2 = $('.dropzone-area2'); // 同上
  var dropzone_box = $('.dropzone-box'); // 同上
  var images = []; // 空の配列imagesを用意
  var inputs  =[]; // 空の配列inputsを用意
  var input_area = $('.input_area'); // 変数input_areaに「.input_area」のパラメータを代入
  var preview = $('#preview'); // 
  var preview2 = $('#preview2');

  // 画面ロード時（商品編集ページだけで動くコード）
  if ( isItemEditPath ) {

    //  画像枚数に応じてdropzoneの幅と表示を調整する
    var imageCountAtLoad = $('.dropzone-container').find('.img_view').length;
    if ( imageCountAtLoad < 4 ) {
      dropzone.css({ //変数dropzoneの要素のcssに
        'width': `calc(100% - (126px * ${imageCountAtLoad}))`  // スタイルを当てる
      });
    } else if ( imageCountAtLoad >= 5 ) {
      dropzone2.css({ // 変数dropzone2のcssに
        'display': 'block'  // display: blockを追加（初めはdisplay:noneを設定）
      });
      dropzone2.css({ //変数dropzoneの要素のcssに
        'width': `calc(100% - (126px * ${imageCountAtLoad -5 }))`  // スタイルを当てる
      });
      if(imageCountAtLoad > 5) {
        dropzone2.css({
          'margin-left': '10px'
        })
      }
      if(imageCountAtLoad == 9) {  // 配列imagesのlengthが9なら
        dropzone2.find('p').replaceWith('<p>あと1枚です</p>')  // dropzone2の子要素pタグのところを()の中身に置き換える
      }
      if(imageCountAtLoad == 10) {
        dropzone2.css({
          'display': 'none'
        })
      }
    }
    
    // 商品編集画面ロード時にinputs, imagesに値を格納
    inputs = $('.dropzone-box').find('.upload-image');
    images = $('.dropzone-container').find('.img_view').map(function(){
      return $(this);
    });
}

  // 画像追加時
  $(document).on('change', 'input[type= "file"].upload-image',function(event) {  // input[type= "file"].upload-imageの内容が変わったら（ファイルが登録されたら）

    var file = $(this).prop('files')[0]; // 登録したファイルの情報のハッシュを変数fileに取得
    var reader = new FileReader(); // 変数readerにインスタンスを生成
    inputs.push($(this)); // 変数inputsにinput[type= "file"].upload-imageの内容を追加
    var img = $(`<div class= "img_view"><img></div>`); // 変数imgにDOM要素？を代入
    reader.onload = function(e) { // ファイルが読み込まれたら
      var btn_wrapper = $('<div class="btn_wrapper"><div class="btn edit">編集</div><div class="btn delete">削除</div></div>'); // 変数btn_wrapperにDOM要素？を代入
      img.append(btn_wrapper); // 2行上の変数imgの子要素としてbtn_wrapperを追加
      img.find('img').attr({  // 変数imgの子要素のimgタグの属性にsrc、属性値にurlを取得
        src: e.target.result
      })
    }

    reader.readAsDataURL(file); //ファイルの読み込みをしている（この一行がなければ画像の枠しか表示されない）
    images.push(img); // 配列imagesにimgを追加する（この時のimgにはsrc属性にurlがある）


    if(images.length >= 5) { // もし配列imagesの要素が5つ以上なら
      dropzone2.css({ // 変数dropzone2のcssに
        'display': 'block'  // display: blockを追加（初めはdisplay:noneを設定）
      })
      dropzone.css({ // 変数dropzoneのcssに
        'display': 'none' // display: noneを追加
      })
      $.each(function(index, image) {  // imagesという配列のそれぞれの要素に対して(indexは番号,imageは一つ一つ取り出した時の変数)

        image.attr('data-image', index);  // eachで取り出したimageに属性と属性値を追加
        preview2.append(image);  // 変数preview2の子要素にimageを追加する
        dropzone2.css({  // 変数dropzone2の要素のcssに
          'width': `calc(100% - (126px * ${images.length - 5}))`  // 左記のスタイルを当てる
        })
      })
      if(images.length > 5) {
        $('.dropzone-area2').css({
          'margin-left': '10px'
        })
      }
      if(images.length == 9) {  // 配列imagesのlengthが9なら
        dropzone2.find('p').replaceWith('<p>あと1枚です</p>')  // dropzone2の子要素pタグのところを()の中身に置き換える
      }
    } else {  // image.lengthが5未満なら
      $('#preview').empty();  // #previewの子要素を空にする
      $.each(images, function(index, image) {
        image.attr('data-image', index);
        preview.append(image);  // 変数previewの要素の子にimageを突っ込む
      })
      dropzone.css({ //変数dropzoneの要素のcssに
        'width': `calc(100% - (126px * ${images.length}))`  // スタイルを当てる
      })
    }
    if(images.length == 4) {
      dropzone.find('p').replaceWith('<p>ドロップ&ドラッグ<br>もしくはクリックしてください</p>')
    }
    if(images.length == 10) {
      dropzone2.css({
        'display': 'none'
      })
      return;
    }
    var new_image = $(`<input multiple="multiple" name="item_images[image_url][]" class="upload-image dropzone" data-image= ${images.length} type="file" id="upload-image">`);
    input_area.prepend(new_image); // input_areaの子要素に追加する
  });

  // 画像削除時
  $(document).on('click', '.delete', function() {  // 追加要素の削除ボタンを押したら
    
    var target_image = $(this).parent().parent();  // 変数target_imageに.deleteの親の親の要素を代入
    $.each(inputs, function(index, input) { //配列inputsの一つ一つ(input)に対して
      if ($(this).data('image') == target_image.data('image')){  // input要素のdata-imageの値と、投稿した画像のdata-imageの値が同じものに対して
        $(this).remove(); // 次のinputタグ(thisの中身)を削除
        target_image.remove(); // 削除したい画像を削除
        var num = $(this).data('image'); // 変数numに残ったinputタグのdata-imageの値を代入
        images.splice(num, 1); //配列imagesからnum番目から１つの要素を削除
        inputs.splice(num, 1); //配列inputsからnum番目から１つの要素を削除
        if(inputs.length == 0) { //配列inputsの長さが0になったら
          $('input[type= "file"].upload-image').attr({  //inputタグに属性と属性値をセット
            'data-image': 0
          })
        }
      }
    })
    $('input[type= "file"].upload-image:first').attr({
      'data-image': inputs.length
    })
    $.each(inputs, function(index, input) {
      var input = $(this)
      input.attr({
        'data-image': index
      })
      $('input[type= "file"].upload-image:first').after(input)
    })
    if (images.length >= 5) {
      dropzone2.css({
        'display': 'block'
      })
      $.each(images, function(index, image) {
        image.attr('data-image', index);
        preview2.append(image);
      })
      dropzone2.css({
        'width': `calc(100% - (126px * ${images.length - 5}))`
      })
      if(images.length == 9) {
        dropzone2.find('p').replaceWith('<p>あと1枚です</p>')
      }
      if(images.length == 8) {
        dropzone2.find('p').replaceWith('<p>ドロップ&ドラッグ<br>もしくはクリックしてください</p>')
      }
    } else {
      dropzone.css({
        'display': 'block'
      })
      $.each(images, function(index, image) {
        image.attr('data-image', index);
        preview.append(image);
      })
      dropzone.css({
        'width': `calc(100% - (126px * ${images.length}))`
      })
    }
    if(images.length == 4) {
      dropzone2.css({
        'display': 'none'
      })
    }
    if(images.length == 3) {
      dropzone.find('p').replaceWith('<p>ドロップ&ドラッグ<br>もしくはクリックしてください</p>')
    }
  })


})