#!/bin/bash

set -e
set -x

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

rm -rf public
git clone https://github.com/cs3community/cs3community.github.io public
hugo -t cs3
cd public
git diff

# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git add --all .
git commit -m "$msg"

# Push source and build repos.
git push origin master

# Come Back up to the Project Root
cd ..
