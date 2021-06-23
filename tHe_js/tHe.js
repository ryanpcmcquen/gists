/*! tHe.js v0.2.3 by ryanpcmcquen */
//
// Ryan P. C. McQuen | Everett, WA

/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

/*global window*/
/*jslint browser:true*/
(function () {

    "use strict";

    var tHe = {};
    var qs = document.querySelector;
    var ael = function (selector, event, callback) {
        return selector.addEventListener(event, callback);
    };

    // Determine what separator to use for queries.
    //
    // Usage:
    //   var separatorToUse = tHe.separatorForQueries("http://example.com/?q=barbaz");
    //
    // The above would return '&'.
    //
    tHe.separatorForQueries = function (urlToCheck) {
        return urlToCheck.src.indexOf("?") === -1
            ? "?"
            : "&";
    };

    // Add timestamp to the end of a 'src', so that it refreshes automagically.
    //
    // Usage:
    //   var imgSrcRefreshed = tHe.refreshedSrcWithTimestamp(imgSrc);
    //
    // The above would return a src with a smart appending of the
    // `Date.now()` timestamp.
    //
    tHe.refreshedSrcWithTimestamp = function (srcToRefresh) {
        var refreshedSrc = qs(srcToRefresh);
        var separatorForQueries = tHe.separatorForQueries(refreshedSrc);
        return (refreshedSrc.src + separatorForQueries + "t=" + Date.now());
    };

    // Click two UI elements, useful for when one is nested under another.
    //
    // Usage:
    // var twoElementClickSequence = tHe.clickTwoElements('.foo', '.bar', '.baz');
    //
    // The above would return a function that clicks two elements sequentially,
    // with a slight 'delay'. This is useful for UI's with nested tab layouts.
    //
    tHe.clickTwoElements = function (selectorToMonitor, firstLinkToClick, secondLinkToClick) {
        var selectorToMonitorVar = qs(selectorToMonitor);
        var firstLinkToClickVar = qs(firstLinkToClick);
        var secondLinkToClickVar = qs(secondLinkToClick);
        return function () {
            ael(selectorToMonitorVar, "click", function () {
                firstLinkToClickVar.click();
                setTimeout(function () {
                    secondLinkToClickVar.click();
                }, 10);
            });
        };
    };

    window.tHe = tHe;

}());