var appReady = function() { 

var $allPanels = $('.accordion > dd').hide();
    
  $('.accordion > dt > a').click(function(e) {
    if($(this).closest('dt').next('dd').css('display') == 'block') {
      // Clicked is open
      $allPanels.slideUp();
      $(e.currentTarget).find('h3').removeClass('flip');
      $('.accordion > dt .info').removeClass('dim');
      $(e.currentTarget).removeClass('red');
    } else {
      var $this = $(this)
      $allPanels.slideUp();
      $(this).parent().next().slideDown(400, function() {
        $('html,body').animate({
            scrollTop: $this.offset().top - 50
          }, 400);
      });
      $('.accordion').find('.red').removeClass('red'); 
      $(e.currentTarget).addClass('red');
      $(this).closest('dt').next('dd').addClass('red');
      $(e.currentTarget).find('h3').addClass('flip');
      $(this).closest('dt').siblings().find('h3').removeClass('flip');
      $(e.currentTarget).find('.info').removeClass('dim');
      $(this).closest('dt').siblings().find('.info').addClass('dim');
    }
    // window.scrollTo(0,0);
    return false;
  });

//Mobile Menu

$(function(){

  $('.menubtn').on('click', function(e){
    e.preventDefault();
    $('#MobileNav').toggleClass('open');
  });

  $('.menubtn').on('click', function() {
    $(this).toggleClass('open');
  });

  $(".menubtn").on("click",function(){
  $(this).toggleClass("menu-on");
});
});


  $("#Hero > img:gt(0)").hide();

  setInterval(function() { 
    $('#Hero > img:first')
      .fadeOut(1500)
      .next()
      .fadeIn(1500)
      .end()
      .appendTo('#Hero');
  },  3000);
  
  // Slideshow

    (function ($) {

      $.fn.simpleSlider = function(){

      var slider = $(this);

      var slides = [];

      $(this).append("<li class='controls'></li>");

      $(this).find('li').each(function(e){

        e++;

        if(($(this).attr('class') !== "controls")) {

          slides.push(e);

          var imgObj = $(this).find('img'); 
          console.log(imgObj); 


          $(".controls").append("<span id='"+e+"'></span>");

          if(e > 1) {

            $(this).css({"position":"absolute","top":"0","left":"0"});

            $(this).hide();

          }

        }

      });

      $("span#1").addClass('active');

      var length = slides.length;

      var count = 2;

      $(".controls span").click(function(){

        clearInterval(autoPlay);

        count = $(this).attr('id');

        slider.find('li').each(function(e){

          if($(this).attr('class') !== "controls") {

            e++;

            if(e == count) {

              $(this).fadeIn();

              $(this).css({"position":"relative","top":"0","left":"0"});

              $("span#"+e).addClass('active');

              $("span#"+e).siblings().removeClass('active');              

            } else {

              $(this).fadeOut();

              $(this).css({"position":"absolute","top":"0","left":"0"});

            }

          }

        });

      });              

      function autoPlay() {        
      
        slider.find('li').each(function(e){

          if($(this).attr('class') !== "controls") {

            e++;

            if(e == count) {

              $(this).fadeIn();

              $(this).css({"position":"relative","top":"0","left":"0"});

              $("span#"+e).addClass('active');

              $("span#"+e).siblings().removeClass('active');

            } else {

              $(this).fadeOut();

              $(this).css({"position":"absolute","top":"0","left":"0"});

            }

          }

        });

        count++;

        if(count == parseInt(length) + 1) {

          count = 1;

        }           

      }

      setInterval(autoPlay, 4000);       

    return this;

      };

  }(jQuery));

    $(function(){

      if($('.simpleSlider li').length > 1) { 
        $('.simpleSlider').simpleSlider();
      }
      if($('p.notice').length || $('p.alert').length) { 
        $('p.notice, p.alert').animate({ opacity: 1 }, 3000, function() { 
          $(this).slideUp('fast'); 
        }); 
      }

      // window height
      $('.contentwrapper').css('min-height', $(window).height() - 49 - $('#Footer').outerHeight()); 

      $(window).on('resize', function() { 
        $('.contentwrapper').css('min-height', $(window).height() - 49 - $('#Footer').outerHeight()); 
      }); 

    });

}

$(document).ready(appReady);
$(document).on('page:load', appReady);