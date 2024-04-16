// ==UserScript==
// @name           Youtube embed redirect
// @namespace      Mikhail Zavoloka
// @version        1.0
// @description    Open youtube videos in embed mode (by replacing 'watch' to 'embed' in url)
// @match          *://*.youtube.com/*
// @run-at         document-start
// @grant          window.onurlchange
// ==/UserScript==

function replace_watch_to_embed() {
    if( !/youtube.com\/watch\?v\=/.test(location.href) ) { return }

    var urlparams = new URLSearchParams(location.search);
    var videoid = urlparams.get('v');
    urlparams.delete('v');
    urlparams.set('autoplay', 1);
    urlparams.toString();
    var new_url = location.protocol + "//"
                + location.host
                + '/embed/'
                + videoid
                + '?'
                + urlparams.toString()
                + location.hash;
    location.replace(new_url);
};

replace_watch_to_embed()

// Must use urlchage bcs clicking video from youtube's main page doesn't trigger userscript reload
if (window.onurlchange === null) {
    window.addEventListener('urlchange', (info) => replace_watch_to_embed());
}
