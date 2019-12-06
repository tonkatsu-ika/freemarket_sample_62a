$(document).on('turbolinks:load', function(){
  function buildChildHTML(category_children){
    var html = `<a class="header-category-list-child__content" id="${category_children.id}"
                href="#">${category_children.category_name}</a>`;
    return html;
  };

  function buildGrandChildHTML(category_grandchildren){
    var html =`<a class="header-category-list-grandchild__content" id="${category_grandchildren.id}"
               href="#">${category_grandchildren.category_name}</a>`;
    return html;
  };
 
  $(".header-category-list__content").on("mouseover", function(){
    var id = this.id
    $(".header-category-list-child__content").remove();
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
    });
    
  })
  




  

  $(document).on("mouseover",".header-category-list-child__content", function(){
    var id = this.id
    $(".header-category-list-grandchild__content").remove();
    var parent_category = $(this).text()
    $.ajax({
      type: 'GET',
      url: '/items/get_category_grandchildren',
      data: { child_id: id },
      dataType: 'json'
    }).done(function(data){
      data.forEach(function(category_grandchildren){
        var html = buildGrandChildHTML(category_grandchildren);
        $(".header-category-list-grandchild").append(html);
      })

    }).fail(function(){
    });
    
  })


});