#!/usr/bin/env sh

set -e

echo *** commiting work on master branch ***
git add .
git commit -m "webpage updates"

echo *** checking out GitHub Pages branch ***

git checkout --orphan gh-pages # stores a repo's website inside the repo but on a separate branch, keeps only the website's history on this branch.

echo *** ... Running new build ***

npm run build

git --work-tree dist add --all # adds everything only in the dist folder

echo *** ... Pushing to remote gh-pages branch ***

git --work-tree dist commit -m "new deployment"
git push  origin HEAD:gh-pages --force


rm -r dist

echo *** checking out Master branch ***

git checkout -f master
git branch -D gh-pages
