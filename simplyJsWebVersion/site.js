// http://stackoverflow.com/questions/11381673/javascript-solution-to-detect-mobile-browser
window.mobilecheck = function() {
  var check = false;
  (function(a) {
    if (/(android|bb\d+|meego).+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|lge |maemo|midp|mmp|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\.(browser|link)|vodafone|wap|windows (ce|phone)|xda|xiino/i.test(a) || /1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\-|your|zeto|zte\-/i.test(a.substr(0, 4))) check = true;
  })(navigator.userAgent || navigator.vendor || window.opera);
  return check;
};

// http://stackoverflow.com/questions/6677035/jquery-scroll-to-element

$.fn.scrollTo = function(duration, easing) {
  return $('html, body').animate({
    scrollTop: $(this).offset().top
  }, duration, easing);
};

var site = {};

site.isMobile = window.mobilecheck();

site.loadClock = function() {
  site.stepClock();
  setInterval(site.stepClock, 10000);
};

site.loadContent = function() {
  var contents = {};
  var currentId = 'default';
  var revertTimeout;

  function showContent($content, doSlide) {
    currentId = $content.data('content-id');
    if (doSlide) {
      $content.slideDown();
    } else {
      $content.show();
    }
    if ($content.data('large-img')) {
      $('.large-screenshot > img:first').attr('src', $content.data('large-img'));
    }
    if (typeof mixpanel !== 'undefined' && !$content.data('seen')) {
      $content.data('seen', true);
      mixpanel.track('Tell Me More', {
        mobile: site.isMobile,
        content: currentId,
        slide: doSlide
      });
    }
    return $content;
  }

  function showDefault() {
    $('section').unbind('mouseleave', showDefault);
    clearTimeout(revertTimeout);
    revertTimeout = setTimeout(function() {
      $('[data-content-id]').hide();
      showContent(contents['default']);
    }, 100);
  }

  function getNextId() {
    var nextId = parseInt(currentId);
    if (isNaN(nextId)) {
      nextId = 0;
    }
    nextId++;
    if (!contents[nextId]) {
      nextId = 'default';
    }
    return nextId;
  }
  $('.large-screenshot, .small-screenshot').each(function() {
    var $elem = $(this);
    var $img = $elem.children('img');
    $img
      .load(function() {
        setTimeout(function() {
          $elem
            .addClass('loaded')
            .width($img.width());
        }, 500);
      });
  });
  $('[data-content-id]').each(function() {
    var $content = $(this);
    var id = $content.data('content-id');
    contents[id] = $content;
    if (id !== 'default') {
      contents[id].hide();
    }
  });
  $('[data-thumb-id]').each(function() {
    var $thumb = $(this);
    $thumb.mouseenter(function() {
      clearTimeout(revertTimeout);
      $('[data-content-id]').hide();
      showContent(contents[$thumb.data('thumb-id')]);
      $('section').mouseleave(showDefault);
    });
  });
  $('.action .next').click(function() {
    var nextId = getNextId();
    showContent(contents[nextId], true)
      .queue(function(next) {
        $(this).scrollTo();
        next();
      });
    nextId = getNextId();
    if (nextId === 'default') {
      $(this).hide();
    }
  });
};

site.loadCopy = function() {
  $('[data-copy]').each(function() {
    var $zone = $(this);
    $zone.append($($zone.data('copy')).clone());
  });
};

site.loadScrollTo = function() {
  $('a[href^=#]').click(function() {
    var $a = $(this);
    var hash = $(this).attr('href');
    var $target = $(hash);
    $target.scrollTo($a.data('duration'), $a.data('easing'));
    window.location.hash = hash;
    return false;
  });
};

site.loadAnalytics = function() {
  if (typeof mixpanel === 'undefined') {
    return;
  }
  mixpanel.track_links('.action a.download', 'Download', {
    target: site.target,
    mobile: site.isMobile,
    via: 'My Pebble Faces'
  });
  mixpanel.track_links('.action a.download-now', 'Download', {
    target: site.target,
    mobile: site.isMobile,
    via: 'Direct'
  });
  mixpanel.track_links('.action a.comment', 'Comment in Forums', {
    target: site.target,
    mobile: site.isMobile
  });
  mixpanel.track_links('.action a.tweet', 'Tweet', {
    target: site.target,
    mobile: site.isMobile
  });
};

site.stepClock = function() {
  $('#clock').text(moment().format('HH:mm'));
};

/* global SimplyWeb */

site.onReady = function() {
  SimplyWeb.init();
  if (!site.isMobile) {
    site.loadClock();
  }
  site.loadContent();
  site.loadCopy();
  site.loadScrollTo();
  site.loadAnalytics();
};

$(site.onReady);