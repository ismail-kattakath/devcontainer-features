#!/usr/bin/env bash
set -e

CLINE_VERSION="${VERSION:-"latest"}"

echo "(*) Installing Cline CLI (version: ${CLINE_VERSION})..."

# Attempt to source nvm if npm is not yet on PATH (common with the node feature)
if ! command -v npm > /dev/null 2>&1; then
    NVM_CANDIDATE="${NVM_DIR:-/usr/local/share/nvm}"
    if [ -s "${NVM_CANDIDATE}/nvm.sh" ]; then
        # shellcheck disable=SC1091
        . "${NVM_CANDIDATE}/nvm.sh"
    elif [ -s "${HOME}/.nvm/nvm.sh" ]; then
        # shellcheck disable=SC1091
        . "${HOME}/.nvm/nvm.sh"
    fi
fi

if ! command -v npm > /dev/null 2>&1; then
    echo "ERROR: npm not found. Add the node feature to your devcontainer.json first:"
    echo '  "features": { "ghcr.io/devcontainers/features/node:1": {} }'
    exit 1
fi

# Enforce minimum Node.js version
NODE_MAJOR=$(node --version 2>/dev/null | sed 's/v//' | cut -d. -f1)
if [ -z "${NODE_MAJOR}" ] || [ "${NODE_MAJOR}" -lt 20 ]; then
    echo "ERROR: Node.js 20+ required. Found: $(node --version 2>/dev/null || echo 'none')"
    echo "Pin a suitable version with: ghcr.io/devcontainers/features/node:1 { \"version\": \"20\" }"
    exit 1
fi

if [ "${CLINE_VERSION}" = "latest" ]; then
    npm install -g cline
else
    npm install -g "cline@${CLINE_VERSION}"
fi

echo ""
echo "(+) Cline CLI installed successfully."
cline --version 2>/dev/null || true
