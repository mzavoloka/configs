// ==UserScript==
// @name           Smartlab direct external links
// @namespace      Mikhail Zavoloka
// @version        1.0
// @description    Make smart-lab.ru links to lead directly to external website without warning
// @match          *://*.smart-lab.ru/*
// @run-at         document-end
// @grant          none
// @noframes
// ==/UserScript==

var links = document.getElementsByTagName("a");

for(var i=0, max=links.length; i<max; i++) {
    if ( !links[i].href.match( /.+\/r.php\?u=/ ) ) { continue }
    var param_u = links[i].href
        .replace(/^.+\/r.php\?u=/g, '') // убрать всё до значения параметра 'u'
        .replace(/&s=\d+$/g, '');      // убрать всё после значения параметра 'u'

    links[i].href = decodeURIComponent( param_u ); // деэкранизация параметра 'u'
}
