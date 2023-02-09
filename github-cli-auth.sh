#!/usr/bin/env bash
# This script auths to Github using the token in your github-token.txt file
# It requires the GH CLI: https://cli.github.com

source ./config.sh

gh auth login --with-token < ./github-token.txt