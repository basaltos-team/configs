# BSPWM VM Example

This profile is a practical VM-oriented desktop config:

- whole-disk install target: `/dev/vda`
- UEFI `/boot` plus Btrfs root
- BSPWM + SXHKD + Xorg + rofi + picom + alacritty
- NetworkManager and SSH enabled for VM access
- QEMU guest agent and SPICE agent enabled for VM integration
- common CLI/browser/media tools
- `paru` recorded as AUR package intent

Current limitations:

- Basalt validates AUR package intent, but host mutation still rejects AUR
  execution. `paru` is included to show desired intent, not because the current
  executor can build it yet.
- Basalt does not yet have first-class users/groups/home ownership. Dotfiles are
  installed under `/etc/skel` and as reference files under `/etc/basalt/examples`.
- Basalt does not yet model display/login manager policy. This example uses a
  `startx`-style BSPWM session.
- PipeWire packages are installed, but PipeWire user-session activation is left
  to the desktop/user-session layer because Basalt does not yet model user
  services.

Validate:

```sh
cd core
cargo run --quiet -- validate --config ../configs/examples/bspwm-vm
```
