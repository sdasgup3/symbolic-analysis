#!/bin/bash

for file in $(find . -name "*.ll" -type f -print); do
  echo $file
  sed -i -e 's/= load [^,]*,/= load/g' $file 
  sed -i -e 's/= getelementptr inbounds [^,]*,/= getelementptr inbounds/g' $file
  sed -i -e 's/\([^=]\) getelementptr inbounds ([^,]*, /\1 getelementptr inbounds (/g' $file
  echo ==============================================
  echo ==============================================
done
