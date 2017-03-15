#!/bin/bash

# TODO: Use git remote to dynamically set url for rawgit instead of hardcoded.
for filename in src/*.js; do
  latest_tag=$(git describe --abbrev=0 --tags)
  tag=${1:-$latest_tag}
  echo $tag
  relative_filename=${filename#src/}
  name=${relative_filename%.js}
  echo "Compiling '$filename'..."
  babel $filename | uglifyjs -r "$,L" -cmo "min/$name.min.js"
  echo "Creating bookmarklet..."
  echo -n "javascript:" > "marklets/$name.min.mark.js"; cat "min/$name.min.js" >> "marklets/$name.min.mark.js"
  echo "Creating stub-version bookmarklet..."
  echo -n "javascript:(function(){_$name=document.createElement('SCRIPT');_$name.type='text/javascript';_$name.src='https://cdn.rawgit.com/rcribbs/bookmarklets/$tag/min/$name.min.js?ranid='+(Math.random());document.getElementsByTagName('head')[0].appendChild(_$name);})();" > "stubs/$name.url"
done
