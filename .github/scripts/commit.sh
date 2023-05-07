#!/bin/bash
set -e

rsync -a --delete --exclude .git --exclude .gitignore ../repo/ .
git config --global user.email "github-actions[bot]@users.noreply.github.com"
git config --global user.name "github-actions[bot]"
git status
if [ -n "$(git status --porcelain)" ]; then
    git add .
    git commit -m "Update Documentation"
    git push
else
    echo "No changes to commit"
fi