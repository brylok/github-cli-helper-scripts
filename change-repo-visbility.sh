#!/usr/bin/env bash
# This script downloads all of the member of a github organization
# It requires the GH CLI: https://cli.github.com

source ./config.sh

USAGE="Usage: sh change-repo-visibility.sh"

visibility='internal'
repoList=`cat ${resultsLocation}/repo-list-short.csv`


for i in $(echo $repoList | sed "s/,/ /g")
do
    echo "Updating ${i} to ${visibility} visibility"
    gh repo edit \
      ${organization}/"$i" \
      --visibility ${visibility} 
done