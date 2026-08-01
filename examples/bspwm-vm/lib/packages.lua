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
    "base-devel",
    "vim",
    "nano",
    "less",
    "tree",
    "wget",
    "curl",
    "unzip",
    "p7zip",
    "man-db",
    "man-pages",
    "bash-completion",
  }
end

function M.desktop()
  return {
    "xorg-server",
    "xorg-xinit",
    "xorg-xrandr",
    "xorg-xsetroot",
    "xorg-xprop",
    "xorg-xinput",
    "bspwm",
    "sxhkd",
    "rofi",
    "picom",
    "alacritty",
    "feh",
    "dunst",
    "flameshot",
    "thunar",
    "thunar-volman",
    "xarchiver",
    "firefox",
    "noto-fonts",
    "noto-fonts-emoji",
    "ttf-jetbrains-mono-nerd",
  }
end

function M.media()
  return {
    "pipewire",
    "pipewire-pulse",
    "pipewire-alsa",
    "wireplumber",
    "pavucontrol",
    "pamixer",
    "playerctl",
    "vlc",
  }
end

function M.vm_tools()
  return {
    "qemu-guest-agent",
    "spice-vdagent",
    "mesa",
    "vulkan-radeon",
    "vulkan-intel",
  }
end

function M.pacman()
  return concat(M.base(), M.desktop(), M.media(), M.vm_tools())
end

return M

