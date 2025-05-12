// ==UserScript==
// @name           2ch posts width
// @namespace      Mikhail Zavoloka
// @version        1.0
// @description    Makes posts 100% wide
// @match          *://*.2ch.hk/*
// @run-at         document-start
// @grant          GM_addStyle
// @noframes
// ==/UserScript==

GM_addStyle(".post { max-width: none }");
