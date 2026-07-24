local host = require("lib.host")
local package_sets = require("lib.package_sets")

local packages = {}
for _, name in ipairs(package_sets.base) do
  table.insert(packages, name)
end
for _, name in ipairs(package_sets.tools) do
  table.insert(packages, name)
end

return {
  system = host.system("basalt-composed"),
  packages = {
    pacman = packages,
    aur = {},
    nix = {},
  },
  services = {
    enable = { "systemd-networkd", "sshd" },
    disable = {},
  },
}
