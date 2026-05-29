#!/usr/bin/env bash
set -e

# shellcheck source=/dev/null
source dev-container-features-test-lib

check "cline is on PATH" which cline
check "cline --version exits cleanly" cline --version
check "node meets minimum version" bash -c 'major=$(node --version | sed "s/v//" | cut -d. -f1); [ "$major" -ge 20 ]'
check "npm is available" which npm

reportResults
