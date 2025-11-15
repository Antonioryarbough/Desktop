#!/bin/bash
# Script to install a pre-commit hook that checks for uncommitted changes
# This prevents commits when there are unstaged changes

set -e

cd "$(dirname "$0")"

HOOK_PATH=".git/hooks/pre-commit"

# Create the pre-commit hook
cat > "$HOOK_PATH" << 'EOF'
#!/bin/bash
# Pre-commit hook: Check for uncommitted changes

# Allow commit if there are no unstaged changes to tracked files
if git diff-files --quiet; then
    exit 0
else
    echo "⚠️  Pre-commit check failed: You have unstaged changes to tracked files."
    echo ""
    echo "Please stage all changes before committing:"
    echo "  git add <file>"
    echo ""
    echo "Or commit all changes with:"
    echo "  git commit -a -m 'your message'"
    exit 1
fi
EOF

# Make the hook executable
chmod +x "$HOOK_PATH"

echo "✓ Pre-commit hook installed successfully!"
echo ""
echo "The hook will now check for unstaged changes before each commit."
echo "To remove the hook, delete: $HOOK_PATH"
