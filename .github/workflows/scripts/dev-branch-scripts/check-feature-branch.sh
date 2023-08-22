#!/bin/bash

# Check if the branch name starts with "feature/"
if [[ ! "${GITHUB_REF}" =~ ^refs/heads/feature/ ]]; then
  echo "❌ Error: You can only merge feature branches into dev."
  exit 1
fi
