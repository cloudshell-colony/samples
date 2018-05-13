#!/usr/bin/env bash
shopt -s globstar nullglob
for file in applications/**/*.sh
do
  if ! shellcheck "$file"
  then 
  	export FAILED=true; 
  fi; 
done
if [ "$FAILED" != "" ]
  then exit 1; 
fi

