// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require jquery.facebox
//= require autocomplete-rails
//= require pin_it
//= require ckeditor/ckeditor
//= require_tree .

$(document).ready(function(){
  if($.fn.facebox) $('a[rel*=facebox]').facebox();

  if($.fn.chosen){
    $('.chzn-select').chosen({
      no_results_text: "No results matched for"
    });
  }

  if($.fn.validate){
    $("form").validate();
  }

  // Main Search
  $('.header-search').click(function(){
    $('.search-form-container').slideToggle();
  });

  // User Menu
  $('#umenu-link > span').click(function(event){
    event.preventDefault();
    if ($('.hmenu-container').is(':visible')){
      $('.hmenu-container').slideUp();
      $(this).removeClass('active');
    }else{
      $('.hmenu-container').slideDown();
      $(this).addClass('active');
    }
  });
  $('html').click(function(event){
    target = $(event.target);
    target_id = target.attr('id');
    target_class = target.attr('class');

    if(target_id != 'umenu-link' && target_id != 'hmenu-container' &&
       target_id != 'umenu-avtr' && target_id != 'umenu-name' && target_id != 'umenu-arrow'){
      $('#umenu-link').removeClass('active');
      $('.hmenu-container').slideUp();
    }
  });

  // home flash message
  if($('.home-message-container').length){
    $('.home-message-container').slideDown();

    setTimeout(function(){
      $('.home-message-container').slideUp();

      setTimeout(function(){
        $('.home-message-container').remove();
      }, 2000);
    }, 5000);
  }

  // detail tab link
  var tab_request = Array();
  $('.detail-info-tab ul li a').click(function(event){
    event.preventDefault();

    // active tab
    if (!$(this).hasClass('active')){
      $('.detail-info-tab ul li a').removeClass('active');
      $(this).addClass('active');
    }

    // hide all info
    $('.detail-info').children().hide();

    elid = $(this).attr('id');
    dcon = $('#detail-'+elid);
    if (dcon.length){
      dcon.show();
    }else{
      if($.inArray(elid, tab_request) == -1){
        tab_request.push(elid);

        $.ajax({
          url: $(this).attr('href'),
          dataType: 'script'
        });
      }
    }
  });

  // file field
  $('.file-field').live('change', function(event){
    file_val = $(this).val();
    $(this).parent().children('.fake-file-input').val(file_val);
  });

  // datail photo
  var photo_request = Array();
  $('#detail-photos > a').live('click', function(event){
    event.preventDefault();
    arr_url = $(this).attr('href').split('/');
    id = arr_url[arr_url.length - 1];
    img_id = 'img-'+id;
    img = $('#'+img_id);
    img_height = img.length ? img.height() : 465;

    $('.detail-image-container').css('min-height', img_height);
    $('.detail-image-container > img').hide();
    if (img.length){
      img.show();
    }else{
      if($.inArray(img_id, photo_request) == -1){
        photo_request.push(img_id);

        $.ajax({
          url: $(this).attr('href'),
          dataType: 'script'
        });
      }
    }
  });

  $('.signup-form.xhr .cancel-link').live('click', function(event){
    event.preventDefault();
    $(document).trigger('close.facebox');
  });

  // back to top
  $('a.back-to-top').live('click', function(e){
    e.preventDefault();
    $('body,html').animate({
      scrollTop: 0
    }, 'slow');
    return false;
  });

  // sticky
  var blimit = 1192;
  var tlimit = 80;
  var windowTop = $(window).scrollTop();
  var bodyHeight = $('body').height();

  $most = $('.most-view-container');
  if ($most.length){
    var mostTop = $most.offset().top;
    mostTop = mostTop < 1041.5 ? 1041.5 : mostTop;

    if(bodyHeight > 2000){
      $most.toggleClass('stickyTop', windowTop + tlimit > mostTop);
      stickyMostView(windowTop, mostTop, tlimit, blimit);

      $(window).scroll(function(){
        var windowTop = $(window).scrollTop();

        stickyMostView(windowTop, mostTop, tlimit, blimit);
      });
    }
  }

  // sticky MostView
  function stickyMostView(windowTop, mostTop, tlimit, blimit){
    $most.toggleClass('stickyTop', windowTop + tlimit > mostTop);

    tp = (bodyHeight - blimit) - (windowTop + tlimit);
    if(tp < 0){
      $most.css('top', tlimit + tp);
    }else{
      if(windowTop + tlimit > mostTop) $most.css('top', tlimit);
    }
  }

  // on window resize
  fixedHeaderAndSearch();
  $(window).resize(function(){
    fixedHeaderAndSearch();
  });

  function fixedHeaderAndSearch(){
    ww = $(window).width()

    // header and search
    if(ww < 960){
      $('.header-wrapper').removeClass('fixed');
      $('.search-fix').removeClass('fixed');
    }else{
      $('.header-wrapper').addClass('fixed');
      $('.search-fix').addClass('fixed');
    }
  }

});


$.extend($.facebox.settings, {
  modal : true
});
$(document).bind('loading.facebox', function(){
  $("#facebox_overlay").unbind("click").click(function(){
    if (!$.facebox.settings.modal){
      $(document).trigger('close.facebox');
    }
  })
});



function remove_fields(link){
  var img_count = $('.image-group:visible').size() - 1;

  $(link).prev("input[type=hidden]").val("1");
  $(link).parent().parent().hide();
}

function add_fields(link, association, content){
  var img_count = $('.image-group:visible').size() + 1;

  max = 8;
  if (img_count <= max){
    var new_id = new Date().getTime();
    var regexp = new RegExp("new_" + association, "g")
    $(link).before(content.replace(regexp, new_id));
  }else{
    alert('('+max+') images maximum per upload.');
  }
}

