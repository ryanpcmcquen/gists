/* global simply */

var SimplyWeb = (function() {

  var SimplyWeb = {};

  var textfields = [
    'title',
    'subtitle',
    'body'
  ];

  SimplyWeb.init = function() {
    simply.impl = SimplyWeb;
    simply.init();
  };

  SimplyWeb.wrapHandler = function(handler) {
    return handler;
  };

  SimplyWeb.execScript = function(script) {
    eval(script);
  };

  SimplyWeb.loadScript = function(scriptUrl, path, async) {
    if (typeof scriptUrl === 'object') {
      SimplyWeb.execScript($(scriptUrl).text());
    } else {
      ajax({
        url: scriptUrl,
        cache: false
      }, function(data) {
        SimplyWeb.execScript(data);
      });
    }
  };

  SimplyWeb.text = function(textDef, clear) {
    if (clear) {
      for (var i in textfields) {
        $('#simply-' + textfields[i]).text('');
      }
    }
    if (!textDef) {
      return;
    }
    for (var k in textDef) {
      $('#simply-' + k).text(textDef[k].toString());
    }
  };

  SimplyWeb.textfield = function(field, text, clear) {
    if (clear) {
      SimplyWeb.text(null, clear);
    }
    $('#simply-' + field).text(text.toString());
  };

  SimplyWeb.vibe = function(type) {
    console.log(type + ' vibe!');
  };

  SimplyWeb.scrollable = function(scrollable) {};

  SimplyWeb.style = function(type) {};

  $(function() {

    $('.simply-button').on('click', function() {
      simply.emitClick('singleClick', $(this).data('button'));
    });

    $('.simply-button').on('mousedown touchstart', function() {
      var $elem = $(this);
      $elem.data('long-timeout', setTimeout(function() {
        simply.emitClick('longClick', $elem.data('button'));
      }, 500));
    }).on('mouseup mouseleave touchend', function() {
      clearTimeout($(this).data('long-timeout'));
    });

  });

  var Pebble = SimplyWeb.Pebble = {};

  Pebble.showSimpleNotificationOnPebble = function(title, body) {
    simply.text({
      title: title,
      body: body
    }, true);
  };

  return SimplyWeb;

})();

var Pebble = SimplyWeb.Pebble;