#!/bin/bash
# Script to check for uncommitted changes in the repository

echo "Checking for uncommitted changes..."
echo "=================================="

# Check if there are any uncommitted changes
if git diff-index --quiet HEAD --; then
    echo "✓ Working tree is clean - no uncommitted changes"
    exit 0
else
    echo "✗ Uncommitted changes detected!"
    echo ""
    echo "Modified files:"
    git status --short
    echo ""
    echo "To commit these changes, run:"
    echo "  git add ."
    echo "  git commit -m 'Your commit message'"
    echo "  git push"
    exit 1
fi
