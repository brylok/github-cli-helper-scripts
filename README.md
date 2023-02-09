# Github Helper Scripts

Scripts created to help with bulk editing github repos.  I created these to address a few specific use-cases I had.  I have included more details below.

## Configuration

You can use the config.sh filer to setup basic configuration for these scripts.  Here are the variables you can configure:

organization="Your github organization or user name"  (You must set this value for these scripts to work)

resultsLocation="Where should the output files go?"  (default location is ./results)

detailedResultsLocation="Where should the very detailed files go?" (default location is  ./results/pr-list)

prCreatedDate="Used when fetching PRs by time period"

prUpdatedDate="Used when fetching PRs by time period"

numberOfRandomItems"Number of random items to pull from the PR list" (default is 100)


## Dependencies
These scripts have the following dependencies:

- [Github CLI](https://cli.github.com/)  (required for all scripts) (easy install with: brew install gh)
- [JQ](https://github.com/stedolan/jq) (required for most scripts) (easy install with: brew install jq)
- [coreutils](https://github.com/coreutils/coreutils) (required for the write-random-lines script) (easy install with: brew install coreutils)



## Use Cases

#### Use Case 1: Fetch all Organization Users
`sh ./fetch-org-users.sh`


#### Use Case 2: Fetch all Organization Repos
`sh ./fetch-repo-names.sh`


#### Use Case 3: Fetch all PR's from a Repo during a specified time range
`sh ./fetch-prs-by-repo.sh <reponame>`


#### Use Case 4: Fetch all PR's from all Repos during a specified time range and create a single combined csv file
`sh ./fetch-prs.sh`


#### Use Case 5: Fetch all PR's from all repos within an organization during a specified time range
`sh ./pr-list-download.sh`


#### Use Case 6: Fetch all PR's from all repos within an organization during a specified time range and pull a random sample
`sh ./pr-list-download-with-sampling.sh`


#### Use Case 7: Update visibility of all repos within an organization
`sh ./change-repo-visbility.sh`


