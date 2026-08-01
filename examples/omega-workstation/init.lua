local packages = require("lib.packages")
local files = require("lib.files")
local workspaces = require("lib.workspaces")

return {
  system = {
    hostname = "omega",
    timezone = "America/New_York",
    locale = "en_US.UTF-8",
    keymap = "us",
  },

  packages = {
    pacman = packages.workstation(),
    aur = packages.aur(),
    nix = {},
  },

  services = {
    enable = {
      "NetworkManager",
      "sshd",
      "docker",
      "bluetooth",
      "udisks2",
      "libvirtd",
      "gdm",
      "ollama",
      "glances",
    },
    disable = {
      "systemd-networkd",
    },
  },

  files = {
    managed = files.workstation(),
  },

  storage = {
    layout = "manual",
    target = "/",
    partitions = {
      {
        disk = "/dev/disk/by-label/NIXOS",
        label = "NIXOS",
        mountpoint = "/",
        filesystem = "btrfs",
        format = false,
        mount_options = { "subvol=@", "compress=zstd", "noatime" },
        subvolumes = {
          {
            name = "@home",
            mountpoint = "/home",
            mount_options = { "compress=zstd", "noatime" },
          },
          {
            name = "@nix",
            mountpoint = "/nix",
            mount_options = { "compress=zstd", "noatime" },
          },
          {
            name = "@snapshots",
            mountpoint = "/.snapshots",
            mount_options = { "compress=zstd", "noatime" },
          },
        },
      },
      {
        disk = "/dev/disk/by-label/EFI",
        label = "EFI",
        mountpoint = "/boot",
        filesystem = "fat32",
        format = false,
      },
      {
        disk = "/dev/disk/by-label/DATA",
        label = "DATA",
        mountpoint = "/data",
        filesystem = "ext4",
        format = false,
      },
      {
        disk = "/dev/disk/by-label/SCRATCH",
        label = "SCRATCH",
        mountpoint = "/scratch",
        filesystem = "btrfs",
        format = false,
        mount_options = { "subvol=@", "compress=zstd", "noatime" },
      },
    },
  },

  workspaces = workspaces.developer_workspaces(),
}
