#!/bin/bash -x

BUILD="_build"
BUCKET="rvtrip.us"

rm -rf $BUILD
jekyll build --destination $BUILD
s3cmd sync -fP --delete-removed $BUILD/ s3://$BUCKET/
s3cmd put -P -m "text/css" $BUILD/assets/css/main.css s3://$BUCKET/assets/css/main.css
