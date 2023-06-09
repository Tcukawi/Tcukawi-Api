#!/bin/bash
set -e

git config --global user.email "github-actions[bot]@users.noreply.github.com"
git config --global user.name "github-actions[bot]"
git status docs
if [ -n "$(git status docs --porcelain)" ]; then
    git add .
    git commit -m "Update Documentation"
    git push
else
    echo "No changes to commit"
fi