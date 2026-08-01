local packages = require("lib.packages")
local files = require("lib.files")

return {
  system = {
    hostname = "basalt-bspwm-vm",
    timezone = "America/New_York",
    locale = "en_US.UTF-8",
    keymap = "us",
  },

  packages = {
    pacman = packages.pacman(),
    aur = {
      "paru",
    },
    nix = {},
  },

  services = {
    enable = {
      "NetworkManager",
      "sshd",
      "systemd-timesyncd",
      "qemu-guest-agent",
      "spice-vdagentd",
    },
    disable = {
      "systemd-networkd",
    },
  },

  storage = {
    layout = "whole_disk",
    disk = "/dev/vda",
    target = "/mnt",
    efi_filesystem = "fat32",
    root_filesystem = "btrfs",
  },

  files = {
    managed = files.managed(),
  },
}
