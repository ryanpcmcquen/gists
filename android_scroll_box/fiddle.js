function classToggler() {
    this.classList.toggle('hover');
}

var scrollBoxClass = document.getElementsByClassName("sbv2");
for (var i = 0; i < scrollBoxClass.length; i++) {
    scrollBoxClass[i].addEventListener('click', classToggler, false);
}