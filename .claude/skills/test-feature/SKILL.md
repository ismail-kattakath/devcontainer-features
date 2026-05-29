---
description: Run devcontainer feature tests. Use when asked to test a feature, run the test suite, or verify a feature works. Delegates to the test-runner agent.
argument-hint: "[feature-name or 'all']"
disable-model-invocation: false
context: fork
agent: test-runner
---

Test the following devcontainer feature(s): $ARGUMENTS

Run the devcontainer CLI test suite against all scenarios defined in `test/<feature>/scenarios.json`.

Prerequisites:
1. Check Docker is running
2. Install devcontainer CLI if needed: `npm install -g @devcontainers/cli`

Report results with pass/fail per image, full error output for failures only.
