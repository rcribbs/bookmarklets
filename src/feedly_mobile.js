function addcss(css) {
  var head = document.getElementsByTagName('head')[0];
  var s = document.createElement('style');
  s.setAttribute('type', 'text/css');
  if (s.styleSheet) {   // IE
    s.styleSheet.cssText = css;
  } else {              // the world
    s.appendChild(document.createTextNode(css));
  }
  head.appendChild(s);
}

function handler() {
  var $j = jQuery.noConflict();
  (function($) {
    var cssStyle = `
    #feedlyFrame {
      margin-left: 0px !important;
    }

    #feedlyTabsHolder {
      display: none;
    }

    .pro {
      display: none;
    }

    div.hercule-search input {
      font-size: .7rem !important;
    }

    search-bar-right-col {
      float: none;
    }

    div.profile-bubble, i.feedly-logo {
      display: none !important;
    }

    #searchBarFX {
      width: 100% !important;
    }

    #headerBarFX {
      left: 0px !important;
      top: auto !important;
    }
    `;




    $('#feedlyTabsUnpin').click();

    var pageHeader = $('#feedlyPageFX h1');
    pageHeader.removeClass('col-xs-8');
    pageHeader.addClass('col-xs-12');

    var pageHeaderOptions = $('#feedlyPageFX div.extra');
    pageHeaderOptions.removeClass('col-xs-4');
    pageHeaderOptions.addClass('col-xs-12');

    addcss(cssStyle);
  })($j);
}

(function() {
  var head = document.getElementsByTagName('head')[0];
  var script = document.createElement('script');
  script.src = 'https://code.jquery.com/jquery-3.1.1.slim.min.js';
  script.type = 'text/javascript';

  script.onreadystatechange = handler;
  script.onload = handler;

  head.appendChild(script);
})();
