#!/usr/bin/env bash
# This script downloads all of the member of a github organization
# It requires the GH CLI: https://cli.github.com

source ./config.sh

USAGE="Usage: sh assign-all-people-to-team.sh"

team_slug=read-only
role='member'
itemList=`cat ${resultsLocation}/all-github-users.csv`


for i in $(echo $itemList | sed "s/,/ /g")
do
    echo "Adding ${i} to the ${team_slug} team"
    gh api \
      --method PUT \
      -H "Accept: application/vnd.github+json" \
      /orgs/${organization}/teams/${team_slug}/memberships/"$i" \
      -f role=${role} 
done