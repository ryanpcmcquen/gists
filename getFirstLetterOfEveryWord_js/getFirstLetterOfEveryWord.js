


var a = document.getElementsByTagName('h2');
for(i = 0; i < a.length; i++) {
  var words = a[i].innerHTML.split(" ")
  for(j = 0; j < words.length; j++) {
    if(words[j][0] != "&") {
      words[j] = "<span class='first-letter'>" + words[j][0] + "</span>" + words[j].substring(1);
    }
  }
  a[i].innerHTML = words.join(" ")
}


// document.onload = function() {
//   var a = document.getElementsByTagName("h2")
//   for(i = 0; i < a.length; i++) {
//     var words = a[i].innerHTML.split(" ")
//     for(j = 0; j < words.length; j++) {
//       if(words[j][0] != "&") {
//         words[j] = "<span class='firstletter'>" + words[j][0] + "</span>" + words[j].substring(1);
//       }
//     }
//     a[i].innerHTML = words.join(" ")
//   }
// }

// var a=document.getElementsByTagName("h2")
// for(i = 0; i < a.length; i++){
//   var words = a[i].innerHTML.split(" ")
//   for(j = 0; j < words.length; j++) {
//     if(words[j][0] != "&") {
//       words[j] = "<span class='firstletter'>"+words[j][0]+"</span>"+words[j].substring(1)
//     }
//   }
// a[i].innerHTML = words.join(" ")
// }


// document.onload = function($) {
//   var elements = document.getElementsByClassName('sms-heading sms-heading--primary')
//   for (var i=0; i<elements.length; i++) {
//     elements[i].innerHTML = elements[i].innerHTML.replace(/b([a-z])([a-z]+)?b/gim, "<span class='first-letter'>$1</span>$2");
//   }
// }

// window.onload = function() {
//   var elements = document.getElementsByClassName('sms-heading sms-heading--primary')
//   for (var i = 0; i < elements.length; i++) {
//     elements[i].innerHTML = elements[i].innerHTML.replace(/b([a-z])([a-z]+)?b/gim, "<span class='first-letter'>$1</span>$2");
//   }
// }

