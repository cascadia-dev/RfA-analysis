#!/bin/bash 
# prepare
year=$1
mkdir -p diffs/$year
rm diffs/$year/*

#more prepare
mkdir -p pages
echo "" > pages/0
mkdir -p tmp
rm tmp/*
echo "$year-12-31" tmp/timestamp
page_id=0


# run year
source fetch-diff1.sh "${year}1231235959" diffs/$year
until  grep -q "${year}-" tmp/timestamp ; ((ret=$?)) ; do
  source fetch-diff1.sh $(cat tmp/timestamp) diffs/$year
done

# results
find diffs/$year -size 0 -delete
wc -l diffs/$year/* > diffs/$year/results

# report results
cat diffs/$year/results
