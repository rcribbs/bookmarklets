#!/bin/bash

for filename in *.js; do
  name=${filename%.js}
  babel $filename | uglifyjs -cmo "min/$name.min.js"
done
