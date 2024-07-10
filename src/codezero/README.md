
# Codezero feature for Devcontainers

Install Codezero local tooling in a devcontainer

## Example Usage

```json
"features": {
    "ghcr.io/c6o/devcontainers-features/feature:1": {
        "version": "latest"
    }
}
```

Your devContainer will require privileged and host network access if you need to consume services on the host. You will also have to install Codezero on your host in order to keep the host and devContainer sessions in sync.
