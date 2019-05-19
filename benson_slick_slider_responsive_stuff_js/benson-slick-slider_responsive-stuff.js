
function changeMarginForTextBox() {
    var mainSlides = document.getElementsByClassName('slide__overlay');
    // convert the collection to an array
    var mainSlideArray = [].slice.call(mainSlides);
    // iterate over them calculating the width
    mainSlideArray.forEach(function (i) {
        i.style.marginLeft = (innerWidth - (innerWidth / 3)) + "px";
    });
}
window.addEventListener('load', changeMarginForTextBox, false);
window.addEventListener('resize', changeMarginForTextBox, false);


// because the slider is fixed for the cool parallax, we
// have to disable that when we scroll so the slider doesn't
// follow the user throughout the site
window.addEventListener('scroll', function () {
    // basically disable all this noise on mobile
    if (innerWidth > 640) {
      var sliderHeight;
      if (innerWidth > 1038) {
        sliderHeight = 750;
      } else {
        sliderHeight = 240;
      }
      var scrollChangePos = 10;
      // our main fixed slide container
      var slider = document.querySelector('.fixed-outer');
      var scrollPos = window.pageYOffset;
      var slides = document.getElementsByClassName('slick-slide');
      // array of all slides
      var slideArray = [].slice.call(slides);
      // we only need the dots so we can hide them
      var slideDots = document.getElementsByClassName('slick-dots');
      var slideDotArray = [].slice.call(slideDots);
      if (scrollPos > scrollChangePos) {
          slideArray.forEach(function (i) {
              i.style.height = (sliderHeight - scrollPos) + "px";
              i.style.backgroundSize = "cover";
          });
          slideDotArray.forEach(function (i) {
              i.style.display = "none";
          });
      } else {
          slider.style.position = "fixed";
          slideArray.forEach(function (i) {
              i.style.height = sliderHeight + "px";
          });
          slideDotArray.forEach(function (i) {
              i.style.display = "block";
          });
      }
      if (scrollPos < sliderHeight) {
        slider.style.visibility = "visible";
      } else {
          slider.style.visibility = "hidden";
      }
    }
});
