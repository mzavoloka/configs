// ==UserScript==
// @name         Disable Fullscreen Scrolling on YouTube
// @namespace    http://tampermonkey.net/
// @version      0.101
// @description  Disables mousewheel scrolling while fullscreen etc.
// @description  https://gist.github.com/wizzie2/203176950685fa117c4b2627a60edbb9
// @author       You
// @match        *://*.youtube.com/*
// @grant        none
// @noframes
// ==/UserScript==

(function() {
    'use strict';

    const nPass = { passive : false };
    const keys = { 33:1, 34:1 };

    // Lower font size
    document.documentElement.style.fontSize = "9.4px"; // default 10px;

    // Hide downarrow element at the bottom in fullscreen mode
    const styleSheet = document.createElement("style");
    styleSheet.type = "text/css";
    styleSheet.innerText =
        "button.ytp-fullerscreen-edu-button.ytp-button { display: none; }";
    document.body.appendChild(styleSheet);

    var preventDefaults = (e) => {
        e = e || window.event;
        if (e.preventDefault) { e.preventDefault(); }
        e.returnValue = false;
    }

    var disableWheel = (e) => { preventDefaults(e); }
    var disableKeys = (e) => { keys[e.keyCode] ? preventDefaults(e) : null; }

    document.addEventListener("scroll", (e) => {
        window.pageYOffsetTemp = window.pageYOffset;
    });

    document.addEventListener( "fullscreenchange", () => {
        let fullscreenElement = document.fullscreenElement ||
                                document.webkitFullscreenElement ||
                                document.mozFullScreenElement ||
                                document.msFullscreenElement;

        if (fullscreenElement) {
            window.pageYOffsetSave = window.pageYOffsetTemp;
            window.addEventListener("wheel", disableWheel, nPass);
            window.addEventListener("keydown", disableKeys, nPass);
        } else {
            window.removeEventListener("wheel", disableWheel, nPass);
            window.removeEventListener("keydown", disableKeys, nPass);
            setTimeout( () => { window.scrollTo(0, window.pageYOffsetSave) }, 20 );
        }
    });
})();
