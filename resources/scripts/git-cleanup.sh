#!/usr/bin/env bash

echo "Clean up your repo, e.g. from obsolete tags first!"
echo "Make sure you know what you're doing, your changes will be pushed!"
# read -p "Are you sure your repo is as you want it? " -n 1 -r
read -p "Are you sure your repo is as you want it? [Y/n] "  -r

if [[ $REPLY =~ ^[Yy]$ ]]
then
  git clean -d -f
  git gc --aggressive --auto --prune=all --force
  git config --global push.default simple
  git push --tags --force --prune --verbose
fi
