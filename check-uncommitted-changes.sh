#!/bin/bash

# Script to check for uncommitted changes and proceed with operations
# Usage: ./check-uncommitted-changes.sh [--force]

set -e

FORCE=false
if [ "$1" == "--force" ]; then
    FORCE=true
fi

echo "Checking for uncommitted changes..."

# Check if there are uncommitted changes
if [ -n "$(git status --porcelain)" ]; then
    echo "⚠️  Uncommitted changes detected:"
    git status --short
    
    if [ "$FORCE" = true ]; then
        echo ""
        echo "✅ Proceeding despite uncommitted changes (--force flag used)"
        exit 0
    else
        echo ""
        echo "Options:"
        echo "  1. Commit your changes: git add . && git commit -m 'your message'"
        echo "  2. Stash your changes: git stash"
        echo "  3. Discard your changes: git checkout -- ."
        echo "  4. Run with --force flag to proceed anyway: ./check-uncommitted-changes.sh --force"
        echo ""
        echo "To proceed despite uncommitted changes, run:"
        echo "  ./check-uncommitted-changes.sh --force"
        exit 1
    fi
else
    echo "✅ No uncommitted changes detected. Safe to proceed."
    exit 0
fi
