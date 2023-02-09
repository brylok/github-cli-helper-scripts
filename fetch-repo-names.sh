#!/usr/bin/env bash

# This script downloads all of the names of an organizations github repos in order of most recent commit
# It requires the GH CLI: https://cli.github.com

source ./config.sh

USAGE="Usage: fetch-repo-names-csv.sh"

numberOfRepos=1000
currentDate=$(date '+%Y-%m-%d')


# fetch a maximum of 1000 the orgs repos names sorted by most recent commit, return json and prettyprint it with jq
echo "Fetching All Repo Names..."

gh repo list ${organization} -L ${numberOfRepos} --json 'name' | jq -r '. | map(.name) | join(",")' > "${resultsLocation}/repo-list.csv"

echo "Done"