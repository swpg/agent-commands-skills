# Restore Branch Context

Analyze the current git branch to provide concise context about recent work.

## Instructions

1. **Determine the current branch:**
   ```bash
   git branch --show-current
   ```

2. **If on `main` branch:**
   - Get the last 10 commits with their messages and changed files:
     ```bash
     git log --oneline -10
     git log --name-status -10 --pretty=format:"%h %s"
     ```
   - Summarize the recent progress on main.

3. **If on a feature branch:**
   - Find commits that differ from main:
     ```bash
     git log main..HEAD --oneline
     git diff main...HEAD --stat
     ```
   - Check for an associated PR using `gh`:
     ```bash
     gh pr view --json title,body,state,reviews,comments 2>/dev/null || echo "No PR found"
     ```
   - If a PR exists, incorporate its title, description, and any review comments into your context.

## Output Format

Provide a **2-3 sentence summary** that includes:

1. **Feature/Bug Focus:** What feature or bug is being worked on (from PR title/description or commit messages)
2. **Key Changes:** The main code changes made so far (files modified, patterns in the changes)
3. **Testing/Deployment Considerations:** Any testing notes, deployment concerns, or open issues mentioned in commits or PR comments

### Example Output

> **Branch Context:** This branch implements user authentication via OAuth2, adding login/logout flows and session management. Key changes include new `auth/` module with OAuth provider integration, middleware updates, and user model extensions. PR review flagged concerns about token refresh handling that still need to be addressed before merge.

Or for main:

> **Recent Progress:** The last 10 commits focused on performance optimizations and bug fixes in the search module. Key changes include query caching, index improvements, and fixing a race condition in result pagination. Several commits mention load testing results showing 40% improvement.
