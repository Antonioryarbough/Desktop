#!/bin/bash
# Script to check for uncommitted changes in the repository
# Exit code 0 = clean working tree, Exit code 1 = uncommitted changes detected

set -e

cd "$(dirname "$0")"

# Update the git index to refresh file status
git update-index --refresh > /dev/null 2>&1 || true

# Check for uncommitted changes
if ! git diff-index --quiet HEAD --; then
    echo "⚠️  UNCOMMITTED CHANGES DETECTED"
    echo ""
    echo "The following files have uncommitted changes:"
    git --no-pager diff --name-only HEAD
    echo ""
    echo "To view the changes, run: git diff"
    echo "To stage changes, run: git add <file>"
    echo "To commit changes, run: git commit -m 'your message'"
    exit 1
else
    echo "✓ Working tree is clean - no uncommitted changes detected"
    exit 0
fi
