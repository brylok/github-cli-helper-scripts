#!/bin/bash

source ./config.sh

USAGE="Usage: sh fetch-all-prs.sh"

# This script pulls all repos in a comma seperated file
# organization=$1
itemList=`cat ${resultsLocation}/repo-list.csv`
currentDate=$(date '+%Y-%m-%d')


# remove previous detailed-results files
rm -rf ${detailedResultsLocation}/*

echo "Begin fetching PR list"

# loop through list items
for i in $(echo $itemList | sed "s/,/ /g")
do
    sh ./fetch-prs-by-repo.sh "$i"
done

# create text file output
cat ${detailedResultsLocation}/* | jq 'select(length > 0)' > ${detailedResultsLocation}/all-pull-requests-${currentDate}.json

# create csv output by finding all values in the detailed output folder, filtering out empty arrays, and converting to csv
cat ${detailedResultsLocation}/* | jq 'select(length > 0)' | jq -r '(map(keys) | add | unique) as $cols | map(. as $row | $cols | map($row[.])) as $rows | $cols, $rows[] | @csv' > ${resultsLocation}/all-pull-requests-${currentDate}.csv