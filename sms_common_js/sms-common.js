jQuery(function($) {
  $(document).ready(function() { 

    // --------------------------------------------------------------------------------
    // Magnific Popup Classes
    // --------------------------------------------------------------------------------

    $('.popup-youtube, .mfp-youtube').magnificPopup({
      disableOn: 700, // go straight to video if screen is less than 700px wide
      type: 'iframe',
      mainClass: 'mfp-fade',
      removalDelay: 160,
      preloader: false,
      fixedContentPos: false,
      iframe: {
        patterns: {
          youtube: {
            src: '//www.youtube.com/embed/%id%?autoplay=1&rel=0'
          }
        }
      }
    });

    $('.popup-youtube, .mfp-youtube').click(function () {
        return false;
    });

    //-----

    $('.popup-horizontal-fit, .popup-fit-width, .popup-full-width, .popup-testimonial').magnificPopup({
      type: 'image',
      closeOnContentClick: true,
      image: {
        verticalFit: false
      }
    });

    //-----

    $('.popup-image, .image-popup-vertical-fit, .popup-fit-height').magnificPopup({
      type: 'image',
      closeOnContentClick: true,
    });

    //-----

    $('.popup-review-pro').magnificPopup( {
    type: 'iframe',
    iframe: {
      markup: '<div class="mfp-iframe-scaler review-pro-popup-content">'+
      '<div class="mfp-close"></div>'+
      '<iframe class="mfp-iframe" frameborder="0" allowfullscreen></iframe>'+
      '</div>'
      },
    });

    // Add a class to the parent container, so we can set the width
    $('.popup-review-pro').click(function () {
      $('.review-pro-popup-content').parent('.mfp-content').addClass('mfp-review-pro-width');
    });
    
    //-----

    $('.popup-wufoo').magnificPopup( {
    type: 'iframe',
    iframe: {
      markup: '<div class="mfp-iframe-scaler wufoo-popup-content">'+
      '<div class="mfp-close"></div>'+
      '<iframe class="mfp-iframe" frameborder="0" allowfullscreen></iframe>'+
      '</div>'
      },
    });

    // Add a class to the parent container, so we can set the width
    $('.popup-wufoo').click(function () {
      $('.wufoo-popup-content').parent('.mfp-content').addClass('mfp-wufoo-width');
    });

    //-----
    
    $('.popup-inline, .open-popup-link').magnificPopup({
      type:'inline',
      removalDelay: 160,
      midClick: true, // Allow opening popup on middle mouse click. Always set it to true if you don't provide alternative source in href.
      mainClass: 'mfp-fade'
    });


    // --------------------------------------------------------------------------------
    // Scroll to functionality
    // --------------------------------------------------------------------------------
    
    var siteURL = window.location.protocol + "//" + window.location.host + "/";
    if (top.location.pathname === '/'){
      $('.scrollto a').each(function(){
          this.href = this.href.replace(siteURL, '');
      });
    }

    function goToByScroll(id){
      var itemOffset = $(id).offset().top;
      var HeaderHeight = $(".hdrnav").outerHeight();
      var FullScroll = itemOffset-HeaderHeight; 
      $('html,body').animate({scrollTop: FullScroll}, 2000);
    }

    $('.scrollto a, a.scrollto').click(function(){
      goToByScroll($(this).attr('href'));
      return false;
    });

  });
});