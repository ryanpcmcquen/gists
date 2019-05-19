/*! tHe.js v0.2.3 by ryanpcmcquen */
//
// Ryan P.C. McQuen | Everett, WA | ryanpcmcquen@member.fsf.org
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 2 of the License, or
// (at your option) any later version, with the following exception:
// the text of the GPL license may be omitted.
//
// This program is distributed in the hope that it will be useful, but
// without any warranty; without even the implied warranty of
// merchantability or fitness for a particular purpose. Compiling,
// interpreting, executing or merely reading the text of the program
// may result in lapses of consciousness and/or very being, up to and
// including the end of all existence and the Universe as we know it.
// See the GNU General Public License for more details.
//
// You may have received a copy of the GNU General Public License along
// with this program (most likely, a file named COPYING).  If not, see
// <https://www.gnu.org/licenses/>.
//
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