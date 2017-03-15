#!/bin/bash

for filename in *.js; do
  name=${filename%.js}
  echo "Compiling '$filename'..."
  babel $filename | uglifyjs -cmo "min/$name.min.js"
  echo "Creating bookmarklet..."
  echo "javascript:" > "marklets/$name.min.mark.js"; cat "min/$name.min.js" >> "marklets/$name.min.mark.js"
done
