#!/bin/bash

BUILD="_build"
BUCKET="rvtrip.us"

jekyll build --destination $BUILD
s3cmd sync -P $BUILD s3://$BUCKET
s3cmd put -P -m "text/css" $BUILD/assets/css/main.css s3://$BUCKET/assets/css/main.css
