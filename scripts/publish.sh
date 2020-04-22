#!/bin/sh

aws s3 sync $PWD/_site s3://$AWS_BUCKET/