// ==UserScript==
// @name           Disable 2ch hotkeys
// @namespace      Mikhail Zavoloka
// @version        1.0
// @description    Resolves d hotkey conflict with hotkeys of Video Speed Controller
// @match          *://*.2ch.hk/*
// @run-at         document-end
// @grant          none
// @noframes
// ==/UserScript==

['keydown', 'keyup'].forEach((eventName) => {
//['keyup'].forEach((eventName) => {
  window.addEventListener(
    eventName,
    (e) => {
      if (e.keyCode == 68) { // letter 'd'
        e.stopPropagation();
      }
      else if (e.keyCode == 82) { // letter 'r'
        e.stopPropagation();
      }
    },
    true // capturing phase - very important
  );
});
