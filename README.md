# basalt-configs

Example configurations, fixtures, and machine/profile trees.

## Owns

- Known-good `/etc/basalt` examples.
- Invalid config fixtures for diagnostics.
- Install profiles.
- Role templates for future desktop/server/workstation targets.

## Planned Layout

```text
basalt-configs/
|-- examples/
|   |-- minimal/
|   |-- desktop/
|   |-- server/
|   `-- encrypted/
`-- fixtures/
    |-- valid-basic/
    |-- invalid-unknown-field/
    `-- invalid-duplicate-domain/
```

## Contracts

- Consumes versioned schemas from `basalt/`.
- Emits fixtures consumed by `basalt-tests/`, `basalt-docs/`, and the installer.

