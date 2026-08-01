# BasaltOS Repo Host Example

This example describes the package repository origin host for
`repo.basaltos.dev`.

It expresses only what the current Basalt schema supports directly:

- packages needed for a static repo origin
- service intent for Docker and SSH
- managed files for pacman repo client config, nginx-compose layout notes, and
  host tmpfiles

Real deployment still needs DNS, TLS through Nginx Proxy Manager, signing keys,
release-owner approvals, package/repo database signing, upload/sync automation,
and public availability checks.

Validate with:

```sh
cd core
cargo run --quiet -- validate --config ../configs/examples/repo-host
```

