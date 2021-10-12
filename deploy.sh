#!/usr/bin/env sh

set -e

#git checkout --orphan gh-pages # stores a repo's website inside the repo but on a separate branch, keeps only the website's history on this branch.
npm run build
git add --all
git commit -m "changes"
cd dist
git checkout gh-pages
git add . # adds everything only in the dist folder
git commit -m "new deployment"
git push  origin gh-pages

cd -
git checkout master

