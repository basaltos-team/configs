local M = {}

local function file(path, mode, content)
  return {
    path = path,
    mode = mode,
    content = content,
  }
end

function M.workstation()
  return {
    file("/etc/pacman.d/basalt-mirrorlist", "0644", [[
## BasaltOS pacman repository mirrors
Server = https://repo.basaltos.dev/stable/$arch
# Server = https://repo.basaltos.dev/staging/$arch
]]),

    file("/etc/pacman.conf.d/basalt.conf", "0644", [[
[basalt]
Include = /etc/pacman.d/basalt-mirrorlist
]]),

    file("/etc/systemd/system/ollama.service.d/10-basalt-omega.conf", "0644", [[
[Service]
Environment=CUDA_VISIBLE_DEVICES=GPU-161fbed2-1671-e5b3-bf04-252e3e5421b9
Environment=OLLAMA_KEEP_ALIVE=30m
Environment=OLLAMA_HOST=0.0.0.0:11434
]]),

    file("/etc/systemd/system/glances.service.d/10-basalt.conf", "0644", [[
[Service]
Environment=GLANCES_OPT=-w
]]),

    file("/etc/modprobe.d/v4l2loopback.conf", "0644", [[
options v4l2loopback devices=1 video_nr=1 card_label="OBS Cam" exclusive_caps=1
]]),

    file("/etc/modules-load.d/omega.conf", "0644", [[
nct6775
v4l2loopback
]]),

    file("/etc/systemd/system/basalt-vm-lab-tmpfiles.conf", "0644", [[
# See /etc/tmpfiles.d/basalt-vm-lab.conf.
]]),

    file("/etc/tmpfiles.d/basalt-vm-lab.conf", "0644", [[
d /data/vms 0775 omega24 users - -
d /data/isos 0775 omega24 users - -
d /data/vms/basalt 0775 omega24 users - -
]]),

    file("/etc/ssh/ssh_config.d/github-root.conf", "0644", [[
Host github.com
  User git
  IdentityFile /home/omega24/.ssh/id_ed25519
  StrictHostKeyChecking accept-new
]]),

    file("/etc/basalt/notes/omega-limitations.txt", "0644", [[
This example mirrors an omega-style workstation inside the current Basalt schema.

Still future Basalt domains:
- users/groups/shells
- firewall rules
- secrets/SOPS
- Docker daemon settings
- GPU driver policy
- Home Manager-style user config
- declarative custom systemd service fields
- runtime fstab/CIFS credential mounting
- ntfs-3g storage validation for /data_share-style mounts
]]),
  }
end

return M
