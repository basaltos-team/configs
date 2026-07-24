# configs

Example configurations, fixtures, and machine/profile trees.

## Owns

- Known-good `/etc/basalt` examples.
- Invalid config fixtures for diagnostics.
- Install profiles.
- Role templates for future desktop/server/workstation targets.

## Planned Layout

```text
configs/
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
- Emits fixtures consumed by `tests/`, `docs/`, and the installer.

## Validation

From the workspace root, validate changed config fixtures with:

```sh
cargo run --manifest-path core/Cargo.toml -- validate --config configs/examples/minimal
```

Use the same command with the affected fixture directory.

## Composition

Use `init.lua` for authored configs that should compose helpers, package sets, roles, or machine-specific inputs:

```lua
local package_sets = require("lib.package_sets")

local pacman = {}
for _, name in ipairs(package_sets.base) do
  table.insert(pacman, name)
end

return {
  system = {
    hostname = "basalt-workstation",
  },
  packages = {
    pacman = pacman,
  },
  services = {
    enable = { "sshd" },
  },
}
```

When `init.lua` exists, sibling `.lua` files are modules only when imported by `require`.
Older split-domain directories without `init.lua` remain valid.

## Workspace Fixture

`fixtures/valid-devenv-workspace` exercises the first generated workspace path:

```sh
cargo run --manifest-path core/Cargo.toml -- workspace generate \
  --config configs/fixtures/valid-devenv-workspace \
  --output /tmp/basalt-workspace-generate-smoke
```

This writes a deterministic `devenv.nix` for inspection only. It does not run Nix or mutate project directories.
