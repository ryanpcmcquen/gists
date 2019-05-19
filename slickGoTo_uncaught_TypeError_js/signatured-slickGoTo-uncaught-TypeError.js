jQuery(function($) {
  $(document).ready(function() {
    if ($(window).width() > 481) {
      $('.timelineslider').slick( { 
        dots: false,
        infinite: false,
        autoplay: false,
        slidesToShow: 1,
        slidesToScroll: 1,
        centerMode: true,
        centerPadding: 0,
        arrows: true,
        adaptiveHeight: true,
        prevArrow:'<div class="prevarrw scontrols"><i class="fa fa-angle-left"></i></div>',
        nextArrow:'<div class="nextarrw scontrols"><i class="fa fa-angle-right"></i></div>',
        onInit: function(index) { $('.navbtn#0 .circle').addClass('currentbtn'); },
        onAfterChange: function(index) {
        var currentSlide = $('.timelineslider').slickCurrentSlide();
          $('.timelinenav .navbtn .circle').removeClass('currentbtn');
          $('.timelinenav .navbtn#'+currentSlide+' .circle').addClass('currentbtn');
        },
      });
    }
    $('.timelinenav .navbtn').click(function() {
      var slideId = $(this).attr('id');
      $('.timelineslider').slickGoTo(slideId);
    });
  });
});
