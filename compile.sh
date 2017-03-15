#!/bin/bash

for filename in *.js; do
  name=${filename%.js}
  echo "Compiling '$filename'..."
  babel $filename | uglifyjs -cmo "min/$name.min.js"
  echo "Creating bookmarklet..."
  echo "javascript:" > "marklets/$name.min.mark.js"; cat "min/$name.min.js" >> "marklets/$name.min.mark.js"
  echo "Creating stub-version bookmarklet..."
  echo -n "javascript:(function(){_my_script=document.createElement('SCRIPT');_my_script.type='text/javascript';_my_script.src='https://raw.githubusercontent.com/rcribbs/bookmarklets/master/min/$name.min.js';document.getElementsByTagName('head')[0].appendChild(_my_script);})();" >> "stubs/$name.url"
done
