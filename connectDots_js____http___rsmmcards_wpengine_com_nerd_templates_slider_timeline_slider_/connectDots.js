// draw line using math instead of precarious css
/*jslint browser:true, white:true*/
/*global window*/

(function() {
  'use strict';
  // thanks to https://jsfiddle.net/cnmsc1tm/
  // https://stackoverflow.com/a/8673281/2662028
  function drawLine(el1, el2, thickness, sliderId) {
    function getOffset(el) {
      var rect = el.getBoundingClientRect();
      return {
        left: rect.left + window.pageXOffset,
        top: rect.top + window.pageYOffset,
        width: rect.width || el.offsetWidth,
        height: rect.height || el.offsetHeight
      };
    }
    var off1 = getOffset(el1);
    var off2 = getOffset(el2);

    // set up coordinates to:
    // - rightmost point of first element
    // - leftmost point of last element
    var x1 = off1.left + off1.width;
    var y1 = off1.top + off1.height;
    var x2 = off2.left;
    var y2 = off2.top;
    // distance
    var length = Math.sqrt(((x2 - x1) * (x2 - x1)) + ((y2 - y1) * (y2 - y1)));
    // center
    var cx = ((x1 + x2) / 2) - (length / 2);
    var cy = ((y1 + y2) / 2) - (thickness / 2);
    // make line
    var htmlLine = document.createElement("div");
    htmlLine.className += " js__line ";
    htmlLine.className += ' js__' + sliderId + '__line ';
    htmlLine.style.height = thickness + "px";
    htmlLine.style.left = cx + "px";
    htmlLine.style.top = cy + "px";
    htmlLine.style.width = length + "px";

    // using only innerHTML breaks all clicking *ouch*
    document.body.appendChild(htmlLine);
  }

  function computeLinesToDraw() {
    var sliderIdArray = Array.prototype.slice.call(document.querySelectorAll(".timelinenav")).map(function(i) {
      return i.id;
    });
    sliderIdArray.map(function(i) {
      var uniqueSliderBeginning = "#" + i + ".timelinenav .navbtn:first-child .circle";
      var uniqueSliderEnding = "#" + i + ".timelinenav .navbtn:last-child .circle";
      var firstCircle = document.querySelector(uniqueSliderBeginning);
      var lastCircle = document.querySelector(uniqueSliderEnding);
      // this way we don't get extra lines, uses the id of the slider,
      // which is added to the line div as a class (hence no collision)
      var lineClassWithId = document.querySelector('.js__' + i + '__line');
      if (lineClassWithId) {
        document.body.removeChild(lineClassWithId);
      }
      drawLine(firstCircle, lastCircle, 1, i);
    });
  }

  // have to check if we are logged in, there is some kind of
  // conflict with DMS' animation library when logged in that keeps
  // the page from loading
  var isLoggedIn = document.querySelector('body.logged-in');
  if (!isLoggedIn) {
    // need all of this in a load event or else the array won't populate, also
    // the setTimeout is necessary because animations will push the line
    // to a different spot, we have to draw it after all that completes for it
    // to look correct
    window.addEventListener('load', function() {
      computeLinesToDraw();
      setTimeout(function() {
        computeLinesToDraw();
      }, 950);
    });
    // draw on resize so that it is responsive
    window.addEventListener('resize', function() {
      computeLinesToDraw();
    });
  }

}());