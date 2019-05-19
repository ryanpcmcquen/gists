/*! replaceWordpressAuthorImages.js v0.1.0 by ryanpcmcquen */
/*global window*/
/*jslint browser:true, white:true*/

(function () {

  'use strict';

  // with any luck you should only have to edit these  :^)
  var author = "foo";
  var fileNameEnding = "-1.jpeg";

  var arrProto = Array.prototype;
  var siteUrl = window.location.origin;

  var authorImage = siteUrl + "/wp-content/uploads/" + author + fileNameEnding;
  var iterateOnSelector = function (selector) {
    var selectorArray = arrProto.slice.call(document.querySelectorAll(selector));
    selectorArray.map(function (i) {
      if (i.href === (siteUrl + "/blog/author/" + author + "/")) {
        var img = i.querySelector('img');
        img.src = authorImage;
      }
    });
  };

  document.addEventListener('DOMContentLoaded', function () {
    var isBlog = window.location.pathname.match(/blog/i);
    if (isBlog) {
      iterateOnSelector('article .metahead > a');
    }
  });

}());
