// https://gist.github.com/ryanpcmcquen/1c6b12ce332021a77dec
/* pagelines_dms2__load_editor-draft.css_if_compiled_css_fails.js v0.2.2 by ryanpcmcquen */
/*
 * _CHANGELOG_
 *
 * v0.2.2
 * General cleanup. Use a `DOMContentLoaded` listener instead of an IIFE.
 *
 * v0.2.1
 * Fixed some faulty logic. Also rewrote a lot of the internal stuff.
 * Used .some() instead of .map() on the style sheet checker.
 *
 * v0.2.0
 * Rewritten to use only asynchronous XMLHttpRequest. This
 * should keep the code from being deprecated as browsers update.
 *
 * v0.1.0
 * First working version.
 *
 */
/*global window*/
/*jslint browser:true, white:true*/
document.AddEventListener('DOMContentLoaded', function () {

  'use strict';

  var load_JS_or_CSS_file = function (filename, filetype) {
    var fileref;
    if (filetype === "js") {
      fileref = document.createElement("script");
      fileref.setAttribute("type", "text/javascript");
      fileref.setAttribute("src", filename);
    } else if (filetype === "css") {
      fileref = document.createElement("link");
      fileref.setAttribute("rel", "stylesheet");
      fileref.setAttribute("type", "text/css");
      fileref.setAttribute("href", filename);
    }
    (fileref) && (document.getElementsByTagName("head")[0].appendChild(fileref));
  };

  var regexToCheck = new RegExp(/.*compiled-.*css/ig);
  var documentStyles = Array.prototype.slice.call(document.styleSheets);
  var matchedStyleSheets = [];

  documentStyles.map(function (i) {
    (String(i.href).match(regexToCheck)) && (matchedStyleSheets.push(i.href));
  });

  // We do not need functions for the style sheet
  // checking part, because .some() returns our
  // boolean. Having a noop() allows us to
  // simplify the doAnXhr() function.
  var noop = function () {
    return;
  };

  var doAnXhr = function (url, success, failure) {
    success = success || noop;
    failure = failure || noop;
    var xhr = new XMLHttpRequest();
    xhr.open('get', url, true);
    xhr.addEventListener('load', function () {
      if (xhr.status === 200) {
        success();
      } else {
        failure();
      }
    });
    xhr.send();
  };

  var hasTheRightStyle;
  var determineIfStyleSheetLoaded = function () {
    hasTheRightStyle = matchedStyleSheets.some(function (url) {
      doAnXhr(
        url
      );
    });
  };
  determineIfStyleSheetLoaded();

  var styleSheetExists;
  var styleSheetToLoad = window.location.origin + "/wp-content/uploads/pagelines/editor-draft.css";

  // Make sure the file exists.
  doAnXhr(
    styleSheetToLoad,
    function () {
      styleSheetExists = true;
      if (hasTheRightStyle === false && styleSheetExists === true) {
        load_JS_or_CSS_file(styleSheetToLoad, "css");
      }
    },
    function () {
      styleSheetExists = false;
    }
  );

});