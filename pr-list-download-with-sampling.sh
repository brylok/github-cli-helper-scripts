#!/bin/bash
# to use 

USAGE="Usage: sh ./pr-list-download-with-sampling.sh"

# remove previous detailed-results files
sh ./soc2-pr-list-download.sh && sh ./write-random-lines.sh