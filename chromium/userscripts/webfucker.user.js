// ==UserScript==
// @name         WebFucker
// @namespace    http://tampermonkey.net/
// @version      1
// @description  Replaces pages with 'fuck you' message
// @author       You
// @match        *://*.youtube.com
// @match        *://*.lichess.org
// @match        *://*.diep.io
// @match        *://*.surviv.io
// @match        *://*.vk.com/feed
// @match        *://*.kamleague.com
// @match        *://*.2ch.hk
// @match        *://*.2ch.hk/b/
// @run-at       document-start
// @grant        GM_xmlhttpRequest
// @noframes
// ==/UserScript==

GM.xmlHttpRequest({
    method: "GET",
    url: "http://localhost/isfuckeron.bool",
    headers: { "Cache-control": "no-cache" },
    onload: function(response) {
        if ( response.responseText == 1 ) { dofuck() }
    }
});

function dofuck() {
    document.open('text/html', 'replace');
    document.write(`
    <!DOCTYPE html>
    <html lang="en">
      <head>
        <meta charset="utf-8">
        <title>title</title>
        <link rel="stylesheet" href="style.css">
        <script src="script.js"></script>
      </head>
      <body>
        <h1>fuck you!!!</h1>
      </body>
    </html>
    `);
}
