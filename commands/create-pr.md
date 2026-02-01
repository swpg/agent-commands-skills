# Create PR

Create a pull request for the current branch.

## Instructions

1. **Gather context:**
   ```bash
   git branch --show-current
   git status
   git log main..HEAD --oneline
   git diff main...HEAD --stat
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
   <1-3 bullet points>

   ## Test plan
   - [ ] Testing step 1
   - [ ] Testing step 2

   🤖 Generated with [Claude Code](https://claude.com/claude-code)
   EOF
   )"
   ```

## Guidelines

- **Title:** Under 70 characters, describes the change
- **Summary:** 1-2 sentences describing the change
- **details:** Detailed description covering what changed and why
- **Test plan:** Checklist of how to verify the changes work

## Output

Return the PR URL when complete.
