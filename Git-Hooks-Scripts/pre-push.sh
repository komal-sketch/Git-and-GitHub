#!/bin/bash
#
# pre-push hook
# This script runs before "git push"
# Make it executable: chmod +x .git/hooks/pre-push
#

remote="$1"
url="$2"

echo ">>> Running pre-push checks for remote: $remote ($url)"

# 1. Prevent pushing to main/master directly
protected_branch="main"
current_branch=$(git rev-parse --abbrev-ref HEAD)

if [ "$current_branch" = "$protected_branch" ]; then
    echo "❌ Direct push to '$protected_branch' is not allowed."
    echo "👉 Please push to a feature branch and open a PR."
    exit 1
fi

# 2. Run lint/test checks before pushing
echo ">>> Running tests..."
if ! npm test; then
    echo "❌ Tests failed. Aborting push."
    exit 1
fi

# 3. Check commit message style (example: must have JIRA ticket)
last_commit_msg=$(git log -1 --pretty=%B)
if ! echo "$last_commit_msg" | grep -Eq "^(JIRA|BUG|FEATURE)-[0-9]+"; then
    echo "❌ Commit message must include a ticket reference (e.g., JIRA-123)."
    exit 1
fi

echo "✅ Pre-push checks passed. Continuing..."
exit 0
