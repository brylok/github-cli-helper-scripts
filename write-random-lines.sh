#!/usr/bin/env bash
# This script auths to Github using the token in your github-token.txt file
# It requires the GH CLI: https://cli.github.com
# the gshuf command must be installed by you before you can use it. The easiest way is to use: brew install coreutils

source ./config.sh

currentDate=$(date '+%Y-%m-%d')

gshuf -n ${numberOfRandomItems} ${resultsLocation}/all-pull-requests-${currentDate}.csv > ${resultsLocation}/sampled-pull-requests-${currentDate}.csv