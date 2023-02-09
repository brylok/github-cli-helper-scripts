#!/bin/bash

USAGE="Usage: sh ./pr-list-download.sh"

# remove previous detailed-results files
sh ./fetch-org-users.sh && sh ./fetch-repo-names.sh && sh ./fetch-prs.sh