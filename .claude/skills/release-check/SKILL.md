---
description: Run the release readiness checklist for a feature. Use before merging to main, before releasing, or when asked to validate, check, or review a feature for release. Delegates to the release-validator agent.
argument-hint: "[feature-name or 'all']"
disable-model-invocation: false
context: fork
agent: release-validator
---

Run the full release validation checklist for: $ARGUMENTS

Check:
1. Manifest schema and completeness
2. install.sh quality (shellcheck + conventions)
3. Test coverage and structure
4. Documentation completeness
5. GitHub Actions workflow presence

Return a GO / NO-GO verdict with a prioritised fix list if NO-GO.
