# Create PR

Create a pull request for the current branch.

## CRITICAL: Diff Only

**DO NOT read any files.** The git diff output contains everything you need.

The PR description must describe ONLY what changed, never what exists. You are writing a changelog entry, not documentation.

### What NOT to do
- Don't describe what files do
- Don't explain the repository structure
- Don't summarize the codebase purpose
- Don't read files for "context"

## Instructions

1. **Gather context from git only:**
   ```bash
   git branch --show-current
   git status
   git log main..HEAD --oneline
   git diff main...HEAD --stat
   git diff main...HEAD
   ```

2. **Check if branch is pushed:**
   ```bash
   git rev-parse --abbrev-ref --symbolic-full-name @{u} 2>/dev/null || echo "No upstream"
   ```
   If no upstream, push with: `git push -u origin $(git branch --show-current)`

3. **Analyze all commits** from main to HEAD (not just the latest) to understand the full scope of changes.

4. **Create the PR:**
   ```bash
   gh pr create --title "Short title" --body "$(cat <<'EOF'
   ## Summary
   - Add/Update/Fix/Remove [specific thing that changed]
   - Add/Update/Fix/Remove [another change if applicable]

   ## Test plan
   - [ ] Testing step 1
   - [ ] Testing step 2

   🤖 Generated with [Claude Code](https://claude.com/claude-code)
   EOF
   )"
   ```

## Guidelines

- **Title:** Under 70 characters, action verb + what changed (e.g., "Fix login validation", "Add user export feature")
- **Summary:** Each bullet starts with Add/Update/Fix/Remove and describes a specific change
- **Test plan:** Checklist of how to verify the changes work

## Output

Return the PR URL when complete.
