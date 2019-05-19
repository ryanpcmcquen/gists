/*jslint white:true*/

(function() {
  'use strict';
  var hackUrl = 'https://hacker-news.firebaseio.com/v0/topstories.json?print=pretty';
  ajax({
    url: hackUrl,
    type: 'json'
  }, function(data) {
    simply.text({
      title: data.name,
      subtitle: data.main.temp
    });
  });
}());
