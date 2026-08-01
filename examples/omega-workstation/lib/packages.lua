local M = {}

local function concat(...)
  local out = {}
  for _, list in ipairs({ ... }) do
    for _, value in ipairs(list) do
      table.insert(out, value)
    end
  end
  return out
end

function M.base()
  return {
    "base",
    "linux-zen",
    "linux-firmware",
    "grub",
    "efibootmgr",
    "dracut",
    "sudo",
    "openssh",
    "networkmanager",
    "git",
    "vim",
    "tree",
    "wget",
    "unzip",
    "p7zip",
    "pciutils",
    "procps-ng",
    "xorg-xauth",
    "xdg-utils",
    "pass",
    "cifs-utils",
    "ntfs-3g",
    "btrfs-progs",
  }
end

function M.desktop()
  return {
    "gdm",
    "gnome",
    "bspwm",
    "sxhkd",
    "picom",
    "polybar",
    "rofi",
    "alacritty",
    "thunar",
    "nemo",
    "xarchiver",
    "firefox",
    "google-chrome",
    "vlc",
    "playerctl",
    "flameshot",
    "krita",
    "inkscape",
    "gimp",
    "blender",
    "obs-studio",
  }
end

function M.dev()
  return {
    "base-devel",
    "rust",
    "go",
    "nodejs",
    "npm",
    "python",
    "python-pip",
    "jdk-openjdk",
    "cmake",
    "ninja",
    "pkgconf",
    "openssl",
    "sops",
    "qemu-full",
    "libvirt",
    "virt-manager",
    "virt-viewer",
    "dnsmasq",
    "bridge-utils",
    "cdrkit",
    "cloud-utils",
  }
end

function M.services()
  return {
    "docker",
    "bluez",
    "udisks2",
    "polkit",
    "ollama-cuda",
    "glances",
    "wireguard-tools",
  }
end

function M.workstation()
  return concat(M.base(), M.desktop(), M.dev(), M.services())
end

function M.aur()
  return {
    "zen-browser-bin",
    "vesktop-bin",
    "protonmail-desktop",
    "cursor-bin",
  }
end

return M

