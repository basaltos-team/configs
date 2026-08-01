# Omega-like BasaltOS Workstation Example

This is a non-minimal workstation example shaped after `~/new`.

It intentionally stays inside the current Basalt config schema:

- host identity
- pacman package intent
- service enable/disable intent
- managed files
- storage metadata
- generated devenv workspace metadata

Current Basalt does not yet have first-class domains for users, groups, firewall
rules, Docker daemon config, GPU policy, secrets, Home Manager, overlays, or
custom systemd service environment. Those are represented as package/service
intent plus managed files where the current engine can express them.

Validate with:

```sh
cd core
cargo run --quiet -- validate --config ../configs/examples/omega-workstation
```

