/*global window*/
/*jslint browser: true*/
(function () {
    "use strict";
    window.addEventListener("load", function () {
        var iPhoneORiPod = false;
        var iPad = false;
        var safari = false;
        if (navigator.userAgent.match(/iPhone|iPod/i)) {
            iPhoneORiPod = true;
        } else if (navigator.userAgent.match(/iPad/i)) {
            iPad = true;
        } else if (/^((?!chrome).)*safari/i.test(navigator.userAgent)) {
            safari = true;
        }
        var copyItem = document.querySelector(".text-to-copy");
        if (iPhoneORiPod || iPad || safari) {
            copyItem.style.opacity = 1;
            copyItem.style.position = "relative";
        }
    });
}());