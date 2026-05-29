# Cline CLI (`cline`)

Installs the [Cline](https://github.com/cline/cline) AI coding assistant CLI globally via `npm`.

## Usage

```jsonc
{
    "features": {
        "ghcr.io/ismail-kattakath/devcontainer-features/cline:1": {}
    }
}
```

## Options

| Option | Type | Default | Description |
|--------|------|---------|-------------|
| `version` | string | `latest` | Cline CLI version to install. Use `latest` or a specific version like `3.14.0`. |

## Requirements

- **Node.js 20+** must be available in the container. Add [`ghcr.io/devcontainers/features/node:1`](https://github.com/devcontainers/features/tree/main/src/node) if your base image does not include it. This feature declares `installsAfter` on the node feature as a hint to the toolchain.

## Examples

Install latest Cline with LTS Node.js:

```jsonc
{
    "features": {
        "ghcr.io/devcontainers/features/node:1": { "version": "lts" },
        "ghcr.io/ismail-kattakath/devcontainer-features/cline:1": {}
    }
}
```

Pin a specific Cline version:

```jsonc
{
    "features": {
        "ghcr.io/devcontainers/features/node:1": { "version": "lts" },
        "ghcr.io/ismail-kattakath/devcontainer-features/cline:1": {
            "version": "3.14.0"
        }
    }
}
```

## What gets installed

- `cline` binary available on `$PATH` (global npm install)
- All Cline CLI capabilities: interactive TUI, single-prompt mode, piped input, `cline auth`, `cline mcp`, `cline connect`, ACP server mode (`cline --acp`)
