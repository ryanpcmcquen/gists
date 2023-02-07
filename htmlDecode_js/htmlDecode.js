var htmlDecode = function(str) {
    var temp = document.createElement('span');
    temp.innerHTML = str;
    return temp.textContent;
};