#!/usr/bin/env sh

set -e

echo ---- commiting work on master branch ----
echo ----
echo ----
git add .
git commit -m "webpage updates"

echo ---- creating new pages branch ----
echo ----
echo ----
#git checkout --orphan gh-pages # stores a repo's website inside the repo but on a separate branch, keeps only the website's history on this branch.

echo ---- ... Start running new build ----
echo ----
echo ----
npm run build

git --work-tree dist add --all # adds everything only in the dist folder

echo ---- ... Pushing to remote gh-pages branch ----
echo ----
echo ----
git --work-tree dist commit -m "new deployment"
git push  origin HEAD:gh-pages --force


rm -r dist

echo ---- checking out Master branch ----
echo ----
echo ----
echo ---- deleting gh-pages branch
echo ----
git checkout -f master
#git branch -D gh-pages
