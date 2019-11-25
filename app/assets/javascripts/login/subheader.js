$(document).on('turbolinks:load', function() {

  
  let progress_path = document.location.pathname
  

  if ((progress_path) == "/signup/registlation"){

    $('.first').attr('id', 'red');
    $('.first .progss-bar__circle-first').attr('id', 'point-red');
  }else if ((progress_path) == "/signup/sms_confirmation"){    

    $('.first .progss-bar__circle-first').attr('id', 'progressbar-first');
      
    $('.second').attr('id', 'second');
    $('.second .progss-bar__circle-second').attr('id', 'point-red-second');
  }else if ((progress_path) == "/signup/address"){    
    $('.first .progss-bar__circle-first').attr('id', 'progressbar-first');
    
    $('.second .progss-bar__circle-second').attr('id', 'progressbar-second');
    
    $('.third').attr('id', 'third');
    $('.third .progss-bar__circle-third').attr('id', 'point-red-third');
  }else if ((progress_path) == "/signup/payment"){
    
    $('.first .progss-bar__circle-first').attr('id', 'progressbar-first');
    
    $('.second .progss-bar__circle-second').attr('id', 'progressbar-second');
    $('.third .progss-bar__circle-third').attr('id', 'progressbar-third');

    $('.third .progss-bar__circle').attr('id', 'point-red-fourth');
    $('.fourth').attr('id', 'fourth');
    $('.fourth .progss-bar__circle-fourth').attr('id', 'point-red-fourth');
  }
  else if ((progress_path) == "/signup/done"){
    
    $('.first .progss-bar__circle-first').attr('id', 'progressbar-first');
    
    $('.second .progss-bar__circle-second').attr('id', 'progressbar-second');
    $('.third .progss-bar__circle-third').attr('id', 'progressbar-third');
    $('.fourth .progss-bar__circle-fourth').attr('id', 'progressbar-fourth');
    
    $('.fifth').attr('id', 'fifth');
    $('.fifth .progss-bar__circle-fifth').attr('id', 'point-red-fifth');
  }
});
  
  
  
  