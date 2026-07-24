local workspace = require("lib.workspace")

return {
  system = {
    hostname = "basalt-workspace",
    timezone = "UTC",
    locale = "en_US.UTF-8",
    keymap = "us",
  },
  packages = {
    pacman = { "git" },
    aur = {},
    nix = {},
  },
  services = {
    enable = { "sshd" },
    disable = {},
  },
  workspaces = {
    basalt_core = workspace.devenv({
      path = "~/Projects/basaltos/core",
      languages = { rust = true },
      packages = { "pkg-config", "openssl" },
      services = { postgres = true, redis = true },
      tasks = { test = "cargo test" },
    }),
  },
}
