#!/bin/dash

USERRESOURCES="${HOME}/.Xresources"
USERMODMAP="${HOME}/.Xmodmap"
SYSRESOURCES="/etc/X11/xinit/.Xresources"
SYSMODMAP="/etc/X11/xinit/.Xmodmap"

# merge defaults and keymaps
[ -f "${HOME}/.Xdefaults" ] && /bin/xrdb -merge "${HOME}/.Xdefaults"
[ -f "${SYSRESOURCES}" ] && /bin/xrdb -merge "${SYSRESOURCES}"
[ -f "${SYSMODMAP}" ] && /bin/xmodmap "${SYSMODMAP}"
[ -f "${USERRESOURCES}" ] && /bin/xrdb -merge "${USERRESOURCES}"
[ -f "${USERMODMAP}" ] && /bin/xmodmap "${USERMODMAP}"

# start some nice programs
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
        [ -x "$f" ] && . "$f" >/dev/null 2>&1
    done
    unset f
fi

# things we want available everywhere...

export LANG="en_US.UTF-8"
export TZ="America/New_York"

# https://0x46.net/thoughts/2019/02/01/dotfile-madness
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_RUNTIME_DIR="/run/user/$(id -u)"
export XDG_CONFIG_DIRS="/usr/etc/xdg:/etc/xdg"
export XDG_DATA_DIRS="/usr/local/share:/usr/share"

# try to identify proper wifi interface used in
# configs; might need to hard code.
#export WIFI=$(/bin/ip link | /bin/awk '/wlan|wlp.*UP/ {print $2}' | /bin/cut -d: -f1 2>/dev/null)

export BSPWM_SOCKET="/tmp/bspwm-socket"
export SXHKD_SHELL="/bin/dash"
export GTK2_RC_FILES="${HOME}/.gtkrc-2.0"
export QT_QPA_PLATFORMTHEME="qt5ct"

# default apps
# when changing default browser be aware of
# https://wiki.archlinux.org/title/Xdg-utils#xdg-settings
# export BROWSER="/bin/brave"
# export PRIVATE_BROWSER="$BROWSER --incognito"
#export BROWSER="/bin/chromium"
#export PRIVATE_BROWSER="$BROWSER --incognito"
export BROWSER="/bin/firefox"
export PRIVATE_BROWSER="$BROWSER --private-window"
export EDITOR="lvim"
export MIXER="/bin/pulsemixer"
#export TERMINAL="/usr/local/bin/st"
export TERMINAL="/bin/alacritty"

# scale various UI components for desktop vs laptop (not perfect)
export FONT1="Source Code Pro Medium:pixelsize=10"
export FONT2="SauceCodePro Nerd Font Mono:size=10;1"
export FONT3="Noto Color Emoji:scale=8:antialais=false:style=Regular;2"
export LINE_WIDTH=3
export PANEL_HEIGHT=30
export PANEL_TITLE_LABEL="%title:0:100:...%"
export WM_GAP=15
# if [ -e /sys/module/battery ]; then
#     export FONT1="Source Code Pro Medium:pixelsize=8"
#     export FONT2="SauceCodePro Nerd Font Mono:size=8;1"
#     export FONT3="Noto Color Emoji:scale=10:antialais=false:style=Regular;2"
#     export LINE_WIDTH=2
#     export PANEL_HEIGHT=20
#     export PANEL_TITLE_LABEL="%title:0:50:...%"
#     export WM_GAP=10
# fi

/bin/xhost +local:root > /dev/null 2>&1

# export SSH_ASKPASS="/bin/xaskpass"
# export SSH_ASKPASS_REQUIRE="prefer"
export SSH_KEY_PATH="${HOME}/.ssh/id_ed25519"
eval `/bin/ssh-agent -s`

# eval $(/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh)
# export $(/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh,gpg)
/bin/dbus-update-activation-environment --systemd DISPLAY

/bin/pidof sxhkd >/dev/null || /bin/sxhkd -m -1 >/dev/null 2>&1 &

# exec /bin/dbus-launch --sh-syntax --exit-with-session bspwm
exec /bin/bspwm
