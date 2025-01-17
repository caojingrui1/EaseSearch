#!/bin/bash
if [ -d "/usr/local/docs" ]; then
  rm -rf /usr/local/docs/source/*
  rm -rf /usr/local/docs/target/*
fi

mkdir -p /usr/local/docs/source/
mkdir -p /usr/local/docs/target/

#shellcheck disable=SC2164
cd /usr/local/docs/source
git clone https://gitee.com/mindspore/website-docs.git

if [ ! -d "/usr/local/docs/source/website-docs" ]; then
 rm -rf /usr/local/docs/target
 exit
fi


# shellcheck disable=SC2164
cd /usr/local/docs/source/website-docs

cp -r /usr/local/docs/source/website-docs/public/* /usr/local/docs/target/

# shellcheck disable=SC2164
cd /usr/local/docs/target/

# shellcheck disable=SC2035

rm -rf admin
rm -rf allow_sensor
rm -rf api
rm -rf apicc
rm -rf cla
rm -rf commonJs
rm -rf doc
rm -rf images
rm -rf lib
rm -rf more
rm -rf pdfjs
rm -rf pic
rm -rf security
rm -rf statement
rm -rf statics
rm -rf tutorial
rm -rf video
rm -rf mindscience
rm -rf vision

rm -f *

find . -type f -name file_include_\* -exec rm {} \;
find . -type f -name program_listing_file_include_\* -exec rm {} \;

# shellcheck disable=SC2038
find ./ -name _images |xargs rm -rf
# shellcheck disable=SC2038
find ./ -name _modules |xargs rm -rf
# shellcheck disable=SC2038
find ./ -name _sources |xargs rm -rf
# shellcheck disable=SC2038
find ./ -name _static |xargs rm -rf



