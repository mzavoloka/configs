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
// @grant        none
// @run-at       document-start
// @noframes
// ==/UserScript==

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
