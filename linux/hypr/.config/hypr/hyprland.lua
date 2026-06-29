-- https://wiki.hyprland.org/Configuring/Configuring-Hyprland
local h = hl

h.env("XCURSOR_SIZE", "24")
h.env("HYPRCURSOR_SIZE", "24")
h.env("GDK_SCALE", "1")
h.env("GTK3_RC_FILES", "~/.config/gtk-3.0")
h.env("GTK4_RC_FILES", "~/.config/gtk-4.0")
h.env("QT_SCALE_FACTOR", "1")
h.env("QT_QPA_PLATFORM", "wayland")
h.env("QT_QPA_PLATFORMTHEME", "qt6ct")
h.env("QT_SCALE_FACTOR_ROUNDING_POLICY", "RoundPreferFloor")
h.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")
h.env("XDG_SESSION_TYPE", "wayland")
h.env("XDG_CURRENT_DESKTOP", "Hyprland")
h.env("XDG_SESSION_DESKTOP", "Hyprland")

h.on("hyprland.start", function()
	h.exec_cmd("hyprctl setcursor xcursor-pro 24")
	h.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
	h.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
	h.exec_cmd("systemctl --user start hyprpolkitagent")
	h.exec_cmd("dunst")
	h.exec_cmd("hypridle")
	h.exec_cmd("hyprpaper")
	h.exec_cmd("waybar")
end)

-- https://wiki.hyprland.org/Configuring/Monitors
h.monitor({
	output = "DP-1",
	mode = "5120x2160@120",
	position = "0x0",
	scale = 1,
})

h.config({
	-- https://wiki.hyprland.org/Configuring/Variables/#general
	general = {
		gaps_out = 8,
		gaps_in = 8,
		col = {
			active_border = "#54546d",
			inactive_border = "#16161d",
			nogroup_border_active = "#54546d",
			nogroup_border = "#16161d",
		},
		resize_on_border = true,
	},
	-- https://wiki.hyprland.org/Configuring/Variables/#animations
	animations = {
		enabled = false,
	},
	-- https://wiki.hyprland.org/Configuring/Variables/#cursor
	cursor = {
		inactive_timeout = 3,
	},
	-- https://wiki.hyprland.org/Configuring/Variables/#decoration
	decoration = {
		rounding = 8,
		inactive_opacity = 0.88,
		blur = {
			enabled = true,
		},
		shadow = {
			enabled = true,
			color = "#16161d",
		},
		glow = {
			enabled = true,
			color = "#54546d",
			color_inactive = "#16161d",
			range = 8,
		},
	},
	-- https://wiki.hyprland.org/Configuring/Variables/#ecosystem
	ecosystem = {
		no_update_news = true,
		no_donation_nag = true,
	},
	-- https://wiki.hyprland.org/Configuring/Variables/#input
	input = {
		kb_options = "ctrl:nocaps",
		repeat_rate = 60,
		repeat_delay = 500,
		sensitivity = 0.7,
	},
	-- https://wiki.hyprland.org/Configuring/Variables/#misc
	misc = {
		force_default_wallpaper = 0,
		disable_hyprland_logo = true,
		disable_splash_rendering = true,
	},
	-- https://wiki.hyprland.org/Configuring/XWayland
	xwayland = {
		force_zero_scaling = true,
	},
})

-- https://wiki.hyprland.org/Configuring/Binds
h.bind("SUPER + escape", h.dsp.exec_cmd("loginctl lock-session"))
h.bind("SUPER + return", h.dsp.exec_cmd("ghostty"))
h.bind("SUPER + space", h.dsp.exec_cmd("hyprlauncher"))

h.bind("SUPER + d", h.dsp.exec_cmd("dunstctl history-pop"))
h.bind("SUPER + SHIFT + d", h.dsp.exec_cmd("dunstctl close-all"))

h.bind("SUPER + b", h.dsp.exec_cmd("chromium"))
h.bind("SUPER + i", h.dsp.exec_cmd("chromium --incognito"))
h.bind(
	"SUPER + p",
	h.dsp.exec_cmd(
		"chromium --user-data-dir=${XDG_CONFIG_HOME}/chromium-proxy-profile --proxy-server='socks5://localhost:9090'"
	)
)
h.bind("SUPER + f", h.dsp.exec_cmd("nautilus"))
h.bind("SUPER + x", h.dsp.exec_cmd("slack"))
h.bind("SUPER + s", h.dsp.exec_cmd("spotify"))

h.bind("SUPER + SHIFT + c", h.dsp.window.close("activewindow"))
h.bind("SUPER + SHIFT + x", h.dsp.window.kill("activewindow"))
h.bind("SUPER + SHIFT + f", h.dsp.window.float({ window = "activewindow" }))
-- h.bind("SUPER + SHIFT + f", resizeactive, exact 25% 25%
-- h.bind("SUPER + SHIFT + f", centerwindow,
h.bind("SUPER + SHIFT + q", h.dsp.exec_cmd("hyprshutdown"))
-- h.bind("SUPER + SHIFT + s", layoutmsg, togglesplit
-- h.bind("SUPER + SHIFT + t", settiled,
h.bind("SUPER + SHIFT + z", h.dsp.window.fullscreen({ window = "activewindow" }))

h.bind("SUPER + ALT + d", h.dsp.exec_cmd("killall dunst && notify-send 'restarted dunst'"))
h.bind("SUPER + ALT + h", h.dsp.exec_cmd("hyprctl reload"))
h.bind("SUPER + ALT + w", h.dsp.exec_cmd("killall -SIGUSR2 waybar"))

h.bind("SUPER + h", h.dsp.focus({ direction = "l" }))
h.bind("SUPER + l", h.dsp.focus({ direction = "r" }))
h.bind("SUPER + k", h.dsp.focus({ direction = "u" }))
h.bind("SUPER + j", h.dsp.focus({ direction = "d" }))

h.bind("SUPER + SHIFT + h", h.dsp.window.move({ direction = "l" }))
h.bind("SUPER + SHIFT + l", h.dsp.window.move({ direction = "r" }))
h.bind("SUPER + SHIFT + k", h.dsp.window.move({ direction = "u" }))
h.bind("SUPER + SHIFT + j", h.dsp.window.move({ direction = "d" }))

h.bind("SUPER + 1", h.dsp.focus({ workspace = 1 }))
h.bind("SUPER + 2", h.dsp.focus({ workspace = 2 }))
h.bind("SUPER + 3", h.dsp.focus({ workspace = 3 }))
h.bind("SUPER + 4", h.dsp.focus({ workspace = 4 }))
h.bind("SUPER + 5", h.dsp.focus({ workspace = 5 }))

h.bind("SUPER + SHIFT + 1", h.dsp.window.move({ workspace = 1, follow = false }))
h.bind("SUPER + SHIFT + 2", h.dsp.window.move({ workspace = 2, follow = false }))
h.bind("SUPER + SHIFT + 3", h.dsp.window.move({ workspace = 3, follow = false }))
h.bind("SUPER + SHIFT + 4", h.dsp.window.move({ workspace = 4, follow = false }))
h.bind("SUPER + SHIFT + 5", h.dsp.window.move({ workspace = 5, follow = false }))

-- move/resize windows with mainMod + LMB/RMB and dragging
h.bind("SUPER + mouse:272", h.dsp.window.drag(), { mouse = true })
h.bind("SUPER + mouse:273", h.dsp.window.resize(), { mouse = true })

h.bind("XF86AudioRaiseVolume", h.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"))
h.bind("XF86AudioLowerVolume", h.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"))
h.bind("XF86AudioMute", h.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))

h.bind("XF86AudioNext", h.dsp.exec_cmd("playerctl next"))
h.bind("XF86AudioPause", h.dsp.exec_cmd("playerctl play-pause"))
h.bind("XF86AudioPlay", h.dsp.exec_cmd("playerctl play-pause"))
h.bind("XF86AudioPrev", h.dsp.exec_cmd("playerctl previous"))

-- https://wiki.hyprland.org/Configuring/Window-Rules
-- https://wiki.hyprland.org/Configuring/Workspace-Rules
-- ignore maximize requests.
-- windowrulev2 = suppressevent maximize, class:.*
-- fix some dragging issues with XWayland
-- windowrulev2 = nofocus, class:^$, title:^$, xwayland:1, floating:1, fullscreen:0, pinned:0
-- disable transparency
-- windowrulev2 = opaque,class:^(chromium)$
-- windowrulev2 = opaque,class:^(Slack)$
