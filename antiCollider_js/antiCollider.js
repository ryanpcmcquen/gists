/*global window*/
/*jslint browser:true, white:true*/

(function () {
  'use strict';

  var widthOfViewport = window.innerWidth;

  // get arrays of all our elements
  var columnHeadingArray = Array.prototype.slice.call(document.querySelectorAll('.section-plcolumn .section-sms-headings h2'));
  var columnTextboxArray = Array.prototype.slice.call(document.querySelectorAll('.section-plcolumn .pl-section .textbox-wrap'));
  var columnImageArray = Array.prototype.slice.call(document.querySelectorAll('.section-plcolumn .imagebox__container'));

  // this is the 'magic' part
  var antiCollider = function (i, extraTextPull, extraImagePull) {
    extraTextPull = extraTextPull || false;
    extraImagePull = extraImagePull || false;
    var columnRect = i.getBoundingClientRect();
    var marginSettingForCloseToEdge = extraTextPull ? "-60px" : "-40px";
    var marginSettingForOffTheEdge = extraImagePull ? "50px" : "-40px";

    i.style.position = 'relative';
    if (columnRect.left < 100) {
      i.style.marginLeft = marginSettingForCloseToEdge;
    } else if (columnRect.right < 100) {
      i.style.marginRight = marginSettingForCloseToEdge;
    } else if (columnRect.right > 570) {
      i.style.marginLeft = marginSettingForOffTheEdge;
    } else if (columnRect.left > 570) {
      i.style.marginRight = marginSettingForOffTheEdge;
    }
  };



  if (widthOfViewport < 801 && widthOfViewport > 600) {
    // call on our offenders
    document.addEventListener('DOMContentLoaded', function () {
      columnHeadingArray.map(function (i) {
        antiCollider(i, true, true);
      });
      columnTextboxArray.map(function (i) {
        antiCollider(i, true, true);
      });
      columnImageArray.map(function (i) {
        antiCollider(i, false, false);
      });
    });
  }
}());
