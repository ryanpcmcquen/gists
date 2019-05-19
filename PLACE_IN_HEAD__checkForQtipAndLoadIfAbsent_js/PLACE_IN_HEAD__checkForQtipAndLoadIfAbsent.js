<script>

/*global window, jQuery*/
/*jslint browser:true, white:true*/

(function () {
  'use strict';
  // check for whatevs
  var has__jquery_qtip;
  try {
    jQuery().qtip();
    has__jquery_qtip = true;
  } catch (ignore) {
    has__jquery_qtip = false;
  }

  var load_JS_Or_CSS_File = function (filename, filetype) {
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
    if (fileref !== "undefined") {
      document.getElementsByTagName("head")[0].appendChild(fileref);
    }

  };

  if (!has__jquery_qtip) {
    load_JS_Or_CSS_File("https://cdn.rawgit.com/Craga89/qTip1/d5be0dd5b4c027a5df5144222aae3fc9354f2a46/1.0.0-rc3/jquery.qtip-1.0.0-rc3.min.js", "js");
  }

}());

</script>