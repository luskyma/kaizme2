(function ($) {
  $.querystring = (function (a) {
    var i,
    p,
    b = {};
    if (a === "") { return {}; }
      for (i = 0; i < a.length; i += 1) {
        p = a[i].split('=');
        if (p.length === 2) {
          b[p[0]] = decodeURIComponent(p[1].replace(/\+/g, " "));
        }
      }
      return b;
    }(window.location.search.substr(1).split('&')));
  }(jQuery));
