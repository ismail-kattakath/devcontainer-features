# devcontainer-features

A collection of reusable [Dev Container Features](https://containers.dev/implementors/features/) for consistent, predictable development environments.

## Features

| Feature | Description | Version |
|---------|-------------|---------|
| [`cline`](src/cline/README.md) | Installs the [Cline](https://github.com/cline/cline) AI coding assistant CLI | ![Version](https://img.shields.io/badge/version-1.0.0-blue) |

## Usage

Add any feature to your `devcontainer.json`:

```jsonc
{
    "features": {
        "ghcr.io/ismail-kattakath/devcontainer-features/cline:1": {}
    }
}
```

To pin a specific Cline version:

```jsonc
{
    "features": {
        "ghcr.io/ismail-kattakath/devcontainer-features/cline:1": {
            "version": "3.14.0"
        }
    }
}
```

Cline requires Node.js 20+. If your base image does not include it, add the official node feature first:

```jsonc
{
    "features": {
        "ghcr.io/devcontainers/features/node:1": { "version": "lts" },
        "ghcr.io/ismail-kattakath/devcontainer-features/cline:1": {}
    }
}
```

## Contributing

This repo is developed inside a Dev Container. Open it in VS Code or GitHub Codespaces and all tooling is pre-configured.

To test a feature locally:

```bash
devcontainer features test --features cline --base-image ubuntu:22.04 --project-folder .
```

## License

MIT
