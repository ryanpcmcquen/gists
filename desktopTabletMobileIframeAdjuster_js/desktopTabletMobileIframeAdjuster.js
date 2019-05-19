/*jslint browser:true, white:true*/

(function () {

  'use strict';

  var isBlogPost = document.querySelector('.single-post #site');
  var iframeZero = document.getElementsByTagName('iframe')[0];
  var iframeOne = document.getElementsByTagName('iframe')[1];
  var iframeTwo = document.getElementsByTagName('iframe')[2];

  var desktopIframeWidth = 700;
  var desktopIframeHeight = 393;

  var tabletIframeWidth = 400;
  var tabletIframeHeight = 225;

  var mobileIframeWidth = 220;
  var mobileIframeHeight = 124;

  document.addEventListener('DOMContentLoaded', function () {
    if (isBlogPost) {
      // desktop video
      iframeZero.style.width = desktopIframeWidth + "px";
      iframeZero.style.height = desktopIframeHeight + "px";
      iframeZero.classList.add("visible-desktop");

      // tablet video
      iframeOne.style.width = tabletIframeWidth + "px";
      iframeOne.style.height = tabletIframeHeight + "px";
      iframeOne.classList.add("visible-tablet");

      // mobile video
      iframeTwo.style.width = mobileIframeWidth + "px";
      iframeTwo.style.height = mobileIframeHeight + "px";
      iframeTwo.classList.add("visible-phone");
    }
  });

}());
