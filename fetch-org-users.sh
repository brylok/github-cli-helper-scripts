#!/usr/bin/env bash
# This script downloads all of the member of a github organization
# It requires the GH CLI: https://cli.github.com

source ./config.sh

USAGE="Usage: sh fetch-org-users.sh"

echo "Fetching Organization Users..."

gh api \
  -H "Accept: application/vnd.github+json" \
  /orgs/${organization}/members --paginate | jq -r '.[].login' | sed 's/^\|$/"/g'| paste -sd, - >> ./results/all-github-users.csv

echo "Done"
