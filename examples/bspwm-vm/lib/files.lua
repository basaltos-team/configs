local M = {}

local function file(path, mode, content)
  return {
    path = path,
    mode = mode,
    content = content,
  }
end

local bspwmrc = [[
#!/usr/bin/env sh

pgrep -x sxhkd >/dev/null || sxhkd &
pgrep -x picom >/dev/null || picom --config "$HOME/.config/picom/picom.conf" &
pgrep -x dunst >/dev/null || dunst &

xsetroot -cursor_name left_ptr
feh --bg-fill /usr/share/backgrounds/basalt/default-wallpaper.png 2>/dev/null || xsetroot -solid '#1f1f1f'

bspc monitor -d 1 2 3 4 5 6 7 8 9

bspc config border_width 2
bspc config window_gap 10
bspc config split_ratio 0.52
bspc config borderless_monocle true
bspc config gapless_monocle true
bspc config focus_follows_pointer true
bspc config pointer_modifier mod4
bspc config normal_border_color '#30343f'
bspc config active_border_color '#7aa2f7'
bspc config focused_border_color '#9ece6a'
bspc config presel_feedback_color '#f7768e'

bspc rule -a Alacritty desktop='^1' follow=on
bspc rule -a firefox desktop='^2' follow=on
bspc rule -a Pavucontrol state=floating center=on
bspc rule -a Galculator state=floating center=on
]]

local sxhkdrc = [[
super + Return
	alacritty

super + d
	rofi -show drun

super + shift + d
	rofi -show run

super + Escape
	pkill -USR1 -x sxhkd

super + shift + q
	bspc node -c

super + shift + r
	bspc wm -r

super + {_,shift + }{h,j,k,l}
	bspc node -{f,s} {west,south,north,east}

super + {_,shift + }{1-9}
	bspc {desktop -f,node -d} '^{1-9}'

super + space
	bspc node -t '~floating'

super + f
	bspc node -t '~fullscreen'

super + m
	bspc desktop -l next

super + ctrl + {h,j,k,l}
	bspc node -p {west,south,north,east}

super + alt + {h,j,k,l}
	bspc node -z {left -20 0,bottom 0 20,top 0 -20,right 20 0}

Print
	flameshot gui

XF86AudioRaiseVolume
	pamixer -i 5

XF86AudioLowerVolume
	pamixer -d 5

XF86AudioMute
	pamixer -t
]]

local picom_conf = [[
backend = "glx";
vsync = true;
shadow = true;
shadow-radius = 12;
shadow-offset-x = -8;
shadow-offset-y = -8;
shadow-opacity = 0.25;
corner-radius = 0;
fading = true;
fade-in-step = 0.04;
fade-out-step = 0.04;
inactive-opacity = 0.96;
active-opacity = 1.0;
frame-opacity = 1.0;
detect-rounded-corners = true;
detect-client-opacity = true;
]]

function M.managed()
  return {
    file("/etc/skel/.xinitrc", "0644", [[
#!/usr/bin/env sh
exec bspwm
]]),

    file("/etc/skel/.config/bspwm/bspwmrc", "0755", bspwmrc),
    file("/etc/skel/.config/sxhkd/sxhkdrc", "0644", sxhkdrc),
    file("/etc/skel/.config/picom/picom.conf", "0644", picom_conf),

    file("/etc/basalt/examples/bspwm/bspwmrc", "0755", bspwmrc),
    file("/etc/basalt/examples/bspwm/sxhkdrc", "0644", sxhkdrc),
    file("/etc/basalt/examples/bspwm/picom.conf", "0644", picom_conf),

    file("/etc/motd", "0644", [[
BasaltOS BSPWM VM

Login as your installer-created user, copy /etc/skel dotfiles if needed, then run:

  startx

Current executor note:
- paru is declared as AUR intent, but automatic AUR mutation is not implemented yet.
- user creation and home ownership are still installer-owned, not config-owned.
]]),
  }
end

return M

