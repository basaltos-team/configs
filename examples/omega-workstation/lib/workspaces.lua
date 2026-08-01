local M = {}

local function devenv(config)
  config.backend = "devenv"
  return config
end

function M.developer_workspaces()
  return {
    basalt_core = devenv({
      path = "~/Projects/basaltos/core",
      languages = { rust = true },
      packages = { "pkg-config", "openssl", "sqlite", "lua" },
      services = { postgres = true, redis = true },
      tasks = {
        test = "cargo test",
        fmt = "cargo fmt --check",
        schema = "cargo run --quiet -- schema",
      },
    }),

    basalt_iso = devenv({
      path = "~/Projects/basaltos/iso",
      languages = { shell = true, python = true },
      packages = { "archiso", "qemu", "python", "shellcheck" },
      tasks = {
        smoke = "./tests/guided-installer-config.sh",
        build = "./scripts/build-iso",
      },
    }),

    sound_guy = devenv({
      path = "~/Projects/sound-guy",
      languages = { rust = true, python = true },
      packages = { "alsa-lib", "pipewire", "pkg-config" },
      tasks = {
        test = "cargo test",
      },
    }),
  }
end

return M
