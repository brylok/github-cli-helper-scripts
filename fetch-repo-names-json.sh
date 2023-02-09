#!/usr/bin/env bash

# This script downloads all of the names of an organizations github repos in order of most recent commit
# It requires the GH CLI: https://cli.github.com

source ./config.sh

USAGE="Usage: sh ./download-repo-names-json.sh"

numberOfRepos=1000
currentDate=$(date '+%Y-%m-%d')

# download a maximum of 1000 the orgs repos names sorted by most recent commit, return json and prettyprint it with jq
echo "Downloading All Repo Names..."

gh repo list ${organization} -L ${numberOfRepos} --json 'name,url,pushedAt' | jq . > "${resultsLocation}/${organization}-repos-${currentDate}.json"

echo "Done"