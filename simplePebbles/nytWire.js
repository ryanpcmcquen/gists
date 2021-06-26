/*global ajax*/
/*global simply*/
/*jslint white:true*/

ajax({
  url: 'http://api.nytimes.com/svc/news/v3/content/all.json?api-key=9b37b8880161ffb08f95df55513f0ce1:6:73910200',
  type: 'json'
}, function(data) {
  simply.text({
    title: data.results.title,
    body: data.results.abstract
  });
});

