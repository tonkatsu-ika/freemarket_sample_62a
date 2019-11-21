$(document).on('turbolinks:load', function() {

  
  let progress_path = document.location.pathname
  

  if ((progress_path) == "/signup/registlation"){

    $('.first').attr('id', 'red');
    $('.first .progss-bar__circle').attr('id', 'point-red');
  }else if ((progress_path) == "/signup/sms_confirmation"){    
    $('.first').attr('id', 'red');
    $('.first .progss-bar__circle').attr('id', 'point-red');
    // $('.first .progss-bar__circle').toggleClass(".hoge");  
    // console.log(ok)
    // debugger
    $('.second').attr('id', 'second');
    $('.second .progss-bar__circle').attr('id', 'point-red-second');
  }else if ((progress_path) == "/signup/address"){    
    $('.first').attr('id', 'red');
    $('.first .progss-bar__circle').attr('id', 'point-red');
    $('.second').attr('id', 'second');
    $('.second .progss-bar__circle').attr('id', 'point-red-second');
    $('.third').attr('id', 'third');
    $('.third .progss-bar__circle').attr('id', 'point-red-third');
  }else if ((progress_path) == "/signup/payment"){
    $('.first').attr('id', 'red');
    $('.first .progss-bar__circle').attr('id', 'point-red');
    $('.second').attr('id', 'second');
    $('.second .progss-bar__circle').attr('id', 'point-red-second');
    $('.third').attr('id', 'third');
    $('.third .progss-bar__circle').attr('id', 'point-red-fourth');
    $('.fourth').attr('id', 'third');
    $('.fourth .progss-bar__circle').attr('id', 'point-red-fourth');
  }
});
  
  
  
  