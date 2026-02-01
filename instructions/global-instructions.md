# Global Instructions

## Principles

**Act decisively.** Delete dead code. Remove backwards compatibility shims. Don't preserve old behavior unless explicitly asked.

**Fail loudly.** Code must catch and surface failures, not silently continue. Uses of `.get()`, `hasattr()`, or similar defensive patterns are red flags requiring explicit justification.

**Default to Python.** Use Python unless there's a clear reason for another language.
