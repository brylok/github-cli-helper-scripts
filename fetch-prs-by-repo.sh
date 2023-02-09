#!/usr/bin/env bash
# This script downloads all of the names of an organizations github repos in order of most recent commit
# It requires the GH CLI: https://cli.github.com

source ./config.sh

USAGE="Usage: fetch-prs-by-repo.sh <repo-name>"

[[ $# -eq 0 ]] && echo >&2 "missing arguments: ${USAGE}" && exit 1

repoName=$1
numberOfPrs=1000
currentDate=$(date '+%Y-%m-%d')


# fetch a maximum of 1000 the pr's for the repo
echo "Fetching ${repoName}..."

gh pr list --repo ${organization}/${repoName} --state closed --limit ${numberOfPrs} --search "created:${prCreatedDate} updated:${prUpdatedDate}" --json url,closedAt | jq . > ${detailedResultsLocation}/${repoName}-prs-${currentDate}.json

