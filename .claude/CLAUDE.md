# devcontainer-features

## Project purpose

A growing collection of reusable [Dev Container Features](https://containers.dev/implementors/features/) published to `ghcr.io/ismail-kattakath/devcontainer-features/<feature>:<version>`.

**Primary goal:** predictable, reproducible development environments for teams of all experience levels — regardless of host OS — so everyone ships rather than troubleshoots.

**Longer-term vision:** an invisible agentic development harness built on top of Cline primitives (subagents, teams, SDK, Memory Bank, MCPs, parallel orchestration, HITL) that democratises quality AI-assisted coding in enterprise settings.

## Repository layout

```
src/<feature>/
  devcontainer-feature.json   # manifest
  install.sh                  # runs as root during container build
  README.md                   # per-feature docs
test/<feature>/
  test.sh                     # uses dev-container-features-test-lib
  scenarios.json              # test matrix (base images × option combos)
.github/workflows/
  release.yml                 # publishes to GHCR on push to main
  test.yml                    # CI test matrix on PRs
.devcontainer/
  devcontainer.json           # meta-container for developing this repo
```

## Feature authoring conventions

### devcontainer-feature.json
- `id` = lowercase kebab-case matching the directory name
- `version` starts at `1.0.0`; bump minor for new options, patch for fixes
- Always set `documentationURL` and `licenseURL`
- Declare `installsAfter` for any known prerequisites (e.g. `node`)
- Use `keywords` for discoverability

### install.sh
- First line: `#!/usr/bin/env bash`
- Second line: `set -e`
- All option env vars are uppercase versions of the JSON option keys
- Validate prerequisites with clear error messages pointing users to the fix
- Print `(*)` prefix for progress messages, `(+)` for success
- Make executable: `chmod +x install.sh`

### test.sh
- Source `dev-container-features-test-lib` at the top
- End with `reportResults`
- Each `check` call should be self-describing

### scenarios.json
- Always test at least: ubuntu:22.04, ubuntu:20.04, debian:bullseye
- Include prerequisite features (e.g. node) in each scenario

## Tooling

- **devcontainer CLI**: `devcontainer features test --features <name> --base-image <img> --project-folder .`
- **OCI publishing**: handled by `devcontainers/action@v1` in `release.yml`
- **shellcheck**: lint all `.sh` files before commit

## GitHub

- Repo: `https://github.com/ismail-kattakath/devcontainer-features`
- Published at: `ghcr.io/ismail-kattakath/devcontainer-features/<feature>:<version>`
- Default branch: `main` — push here triggers the release workflow

## Style

- Commit messages: imperative mood, present tense ("Add cline feature", "Fix node version check")
- No force-push to main
- PR for every change; CI must pass before merge
