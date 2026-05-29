---
description: Scaffold a new devcontainer feature. Use when the user asks to create a new feature, add a feature named X, or scaffold a feature. Delegates to the feature-scaffolder agent.
argument-hint: "[feature-name] [short description]"
disable-model-invocation: false
context: fork
agent: feature-scaffolder
---

Scaffold a new devcontainer feature with the following details:

Feature name and description: $ARGUMENTS

Follow all conventions in CLAUDE.md:
- Create `src/<feature-name>/devcontainer-feature.json`
- Create `src/<feature-name>/install.sh` (chmod +x)
- Create `src/<feature-name>/README.md`
- Create `test/<feature-name>/test.sh` (chmod +x)
- Create `test/<feature-name>/scenarios.json`

After creating all files, print a summary of what was created.
