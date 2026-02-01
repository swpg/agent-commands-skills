# Check Common Errors

Review changes from main for common coding mistakes that lead to bugs and technical debt.

## Instructions

1. **Get the diff from main:**
   ```bash
   git diff main...HEAD
   git diff main...HEAD --stat
   ```

2. **For each issue category below, analyze the changes and report findings.**

## Issue Categories

### 1. Not Integrating with Existing Functionality

Explore the codebase around each changed file. Look for:

- **Duplicated functionality:** Did we reimplement something that already exists?
- **Missed abstractions:** Is there an existing utility, helper, or pattern we should have used?
- **Inconsistent patterns:** Does the new code follow the same patterns as similar existing code?

For each new function/class/module added, search the codebase:
```bash
# Look for similar functionality
git grep -l "similar_keyword" -- "*.py" "*.ts" "*.js"
```

### 2. Silent Failures

**Fail loudly.** Code must catch and surface failures, not silently continue.

Flag these patterns as requiring explicit justification:
- `.get()` with default values that hide missing keys
- `hasattr()` checks that swallow missing attributes
- Bare `except:` or `except Exception:` without re-raising or logging
- `try/except` blocks that return default values instead of failing
- `or ""`, `or []`, `or {}` fallbacks that mask None/missing data
- `if x is not None` guards without explaining why None is valid

Each instance needs justification: *Why is silent handling correct here?*

### 3. Dead Code and Backwards Compatibility

**Act decisively.** Delete dead code. Remove backwards compatibility shims.

Flag:
- Commented-out code
- Unused imports, variables, or functions
- `# TODO: remove after...` comments
- Backwards compatibility shims (renamed variables with `_old` suffix, re-exports for old names)
- Code paths that "preserve old behavior" without explicit requirement
- Feature flags or conditionals for deprecated functionality

## Output Format

For each category, report:

```
## [Category Name]

**Status:** [Clean | Issues Found]

[If issues found, list each with file:line and explanation]

**Recommendation:** [What to fix]
```

### Example Output

```
## Not Integrating with Existing Functionality

**Status:** Issues Found

- `src/utils/format.py:45` - New `format_currency()` duplicates existing `helpers/money.py:format_amount()`
- `src/api/users.py:112` - Manual JSON serialization instead of using project's `serializers.BaseSerializer`

**Recommendation:** Use existing `format_amount()` and extend `BaseSerializer` instead.

## Silent Failures

**Status:** Issues Found

- `src/config.py:23` - `config.get("API_KEY", "")` silently returns empty string if key missing
- `src/client.py:89` - `except Exception: return None` hides connection errors

**Recommendation:** Raise explicit errors or add comments justifying why silent handling is correct.

## Dead Code and Backwards Compatibility

**Status:** Clean

No dead code or unnecessary backwards compatibility found.
```
