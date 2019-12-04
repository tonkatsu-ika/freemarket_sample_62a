$(document).on('turbolinks:load', function(){
  function buildChildHTML(category_children){
    var html = `<a class="header-category-list-child__content" id="${category_children.id}"
                href="#">${category_children.category_name}</a>`
    return html;
  }
 ;
  $(".header-category-list__content").on("mouseover", function(){
    var id = this.id
    console.log(id)
    $(".header-category-list-child__content").remove();
    $(".header-category-list-grandchild__content").remove();
    var parent_category = $(this).text()
    $.ajax({
      type: 'GET',
      url: '/items/get_category_children',
      data: { parent_name: parent_category },
      dataType: 'json'
    }).done(function(data){
      data.forEach(function(category_children){
        var html = buildChildHTML(category_children);
        $(".header-category-list-child").append(html);
      })

    }).fail(function(){
      console.log("失敗")
    });
    
  })

});