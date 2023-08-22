#!/bin/bash

commits=$(git log --pretty=format:"%s" origin/main..HEAD)
error_flag=false

while read -r commit; do
  if [[ ! $commit =~ ^(build|chore|ci|docs|style|refactor|perf|test|feat|fix|revert)(\([a-zA-Z0-9_-]+\))?:[[:space:]].+ ]]; then
    echo "❌ Error: Commit message does not follow Conventional Commits with scope: $commit"
    error_flag=true
  fi
done <<< "$commits"

if [ "$error_flag" = true ]; then
  echo "❌ Commit message check failed. Please fix the commit messages."
  exit 1
else
  echo "✅ All commit messages are valid."
fi
