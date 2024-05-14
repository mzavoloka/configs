// ==UserScript==
// @name         Disable YouTube number shortcuts
// @namespace    http://tampermonkey.net/
// @version      1.0
// @description  Stop the anoying 0 to 9 YouTube shortcuts from ruining your wathing experience while allowing all the other shortcuts to work
// @author       Éric Beaudoin (based on code by Martin J.H. from StackOverflow)
// @icon         https://www.google.com/s2/favicons?domain=youtube.com
// @match        *://*.youtube.com/*
// @run-at       document-start
// @noframes
// ==/UserScript==

function run() {
    'use strict';

    // The keys that we want to intercept (from keydownEvent.key)
    var keys = "0123456789";

    (window.opera ? document.body : document).addEventListener('keydown', function(e) {
        //console.log(`==> event.key: ${ e.key}, event.isComposing: ${ e.isComposing }, keys.indexOf(event.key): ${ keys.indexOf(e.key) } ` ); //uncomment to find more key
        if (keys.indexOf(e.key) != -1 && !(e.isComposing || e.ctrlKey || e.altKey)) {
            e.cancelBubble = true;
            e.stopImmediatePropagation();
            //console.log(`==> intercepted: ${ e.key }`);
        }
        return false;
    }, !window.opera);
}

run();
