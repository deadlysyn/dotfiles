-- Pull in the wezterm API and initialize config
local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- https://wezfurlong.org/wezterm/colorschemes/index.html
-- config.color_scheme = 'Gruvbox Material (Gogh)'
-- config.colors = {
--   selection_fg = '#282828',
--   selection_bg = '#ddc7a1',
-- }
config.color_scheme = "gruvbox_material_dark_hard"
config.color_schemes = {
	["gruvbox_material_dark_hard"] = {
		foreground = "#d4be98",
		background = "#1d2021",
		cursor_bg = "#d4be98",
		cursor_border = "#d4be98",
		cursor_fg = "#1d2021",
		selection_bg = "#d4be98",
		selection_fg = "#3c3836",
		ansi = { "#1d2021", "#ea6962", "#a9b665", "#d8a657", "#7daea3", "#d3869b", "#89b482", "#d4be98" },
		brights = { "#eddeb5", "#ea6962", "#a9b665", "#d8a657", "#7daea3", "#d3869b", "#89b482", "#d4be98" },
	},
}

-- https://wezfurlong.org/wezterm/config/lua/wezterm/font.html
config.font = wezterm.font("SauceCodePro Nerd Font", {
	-- weight = 'Medium',
	italic = false,
	stretch = "Normal",
	style = "Normal",
})
-- config.line_height = 1.1
-- disable ligatures; line vs dot zero
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0", "zero" }

config.window_padding = {
	left = 3,
	right = 3,
	top = 3,
	bottom = 3,
}
config.inactive_pane_hsb = {
	saturation = 0.9,
	brightness = 0.7,
}

-- Rather than emitting fancy composed characters when alt is pressed, treat
-- input more like old school ascii with ALT held down
config.send_composed_key_when_left_alt_is_pressed = false
config.send_composed_key_when_right_alt_is_pressed = false

config.audible_bell = "Disabled"
config.disable_default_key_bindings = true
config.hide_tab_bar_if_only_one_tab = true
config.scrollback_lines = 10000
config.tab_bar_at_bottom = true
config.use_dead_keys = false
config.use_fancy_tab_bar = false
config.term = "xterm-256color"
config.window_decorations = "RESIZE"

-- https://github.com/mrjones2014/smart-splits.nvim/tree/master?tab=readme-ov-file#wezterm
-- https://github.com/wez/wezterm/discussions/2329

local act = wezterm.action
config.leader = { key = "a", mods = "ALT", timeout_milliseconds = 2000 }
if wezterm.target_triple == "aarch64-apple-darwin" then
	config.font_size = 14

	config.keys = {
		{ key = "N", mods = "CTRL|SHIFT", action = act.SpawnWindow },
		{ key = "R", mods = "CTRL|SHIFT", action = act.ReloadConfiguration },
		{ key = "+", mods = "CTRL|SHIFT", action = act.IncreaseFontSize },
		{ key = "-", mods = "CTRL|SHIFT", action = act.DecreaseFontSize },
		{ key = "0", mods = "CTRL|SHIFT", action = act.ResetFontSize },
		{ key = "PageUp", mods = "SHIFT", action = act.ScrollByPage(-1) },
		{ key = "PageDown", mods = "SHIFT", action = act.ScrollByPage(1) },
		-- tab management
		{ key = "t", mods = "CMD", action = act.SpawnTab("CurrentPaneDomain") },
		{ key = "w", mods = "CMD", action = act.CloseCurrentTab({ confirm = false }) },
		{ key = "l", mods = "CMD", action = act.ActivateTabRelative(1) },
		{ key = "h", mods = "CMD", action = act.ActivateTabRelative(-1) },
		{ key = "1", mods = "CMD", action = act.ActivateTab(0) },
		{ key = "2", mods = "CMD", action = act.ActivateTab(1) },
		{ key = "3", mods = "CMD", action = act.ActivateTab(2) },
		{ key = "4", mods = "CMD", action = act.ActivateTab(3) },
		{ key = "5", mods = "CMD", action = act.ActivateTab(4) },
		{ key = "6", mods = "CMD", action = act.ActivateTab(5) },
		{ key = "7", mods = "CMD", action = act.ActivateTab(6) },
		{ key = "8", mods = "CMD", action = act.ActivateTab(7) },
		{ key = "9", mods = "CMD", action = act.ActivateTab(8) },
		-- pane management
		{ key = "%", mods = "CTRL|SHIFT", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
		{ key = "\\", mods = "CTRL|SHIFT", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
		{ key = "h", mods = "CTRL|SHIFT", action = act.ActivatePaneDirection("Left") },
		{ key = "j", mods = "CTRL|SHIFT", action = act.ActivatePaneDirection("Down") },
		{ key = "k", mods = "CTRL|SHIFT", action = act.ActivatePaneDirection("Up") },
		{ key = "l", mods = "CTRL|SHIFT", action = act.ActivatePaneDirection("Right") },
		{ key = "x", mods = "CTRL|SHIFT", action = act.CloseCurrentPane({ confirm = false }) },
		{ key = "z", mods = "CTRL|SHIFT", action = act.TogglePaneZoomState },
		-- copy/paste TBD
		{ key = "Enter", mods = "CTRL", action = act.ActivateCopyMode },
		{ key = "c", mods = "CMD", action = act.CopyTo("Clipboard") },
		{ key = "v", mods = "CMD", action = act.PasteFrom("Clipboard") },
		{
			key = "U",
			mods = "CTRL|SHIFT",
			action = act.CharSelect({ copy_on_select = true, copy_to = "ClipboardAndPrimarySelection" }),
		},
	}
end

if wezterm.target_triple == "x86_64-unknown-linux-gnu" then
	config.font_size = 9

	config.keys = {
		{ key = "N", mods = "CTRL|SHIFT", action = act.SpawnWindow },
		{ key = "R", mods = "CTRL|SHIFT", action = act.ReloadConfiguration },
		{ key = "=", mods = "CTRL", action = act.IncreaseFontSize },
		{ key = "-", mods = "CTRL", action = act.DecreaseFontSize },
		{ key = "0", mods = "CTRL", action = act.ResetFontSize },
		{ key = "PageUp", mods = "SHIFT", action = act.ScrollByPage(-1) },
		{ key = "PageDown", mods = "SHIFT", action = act.ScrollByPage(1) },
		-- tab management
		{ key = "t", mods = "ALT", action = act.SpawnTab("CurrentPaneDomain") },
		{ key = "w", mods = "ALT", action = act.CloseCurrentTab({ confirm = false }) },
		{ key = "l", mods = "ALT", action = act.ActivateTabRelative(1) },
		{ key = "h", mods = "ALT", action = act.ActivateTabRelative(-1) },
		{ key = "1", mods = "ALT", action = act.ActivateTab(0) },
		{ key = "2", mods = "ALT", action = act.ActivateTab(1) },
		{ key = "3", mods = "ALT", action = act.ActivateTab(2) },
		{ key = "4", mods = "ALT", action = act.ActivateTab(3) },
		{ key = "5", mods = "ALT", action = act.ActivateTab(4) },
		{ key = "6", mods = "ALT", action = act.ActivateTab(5) },
		{ key = "7", mods = "ALT", action = act.ActivateTab(6) },
		{ key = "8", mods = "ALT", action = act.ActivateTab(7) },
		{ key = "9", mods = "ALT", action = act.ActivateTab(8) },
		-- pane management
		{ key = "%", mods = "CTRL|SHIFT", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
		{ key = "|", mods = "CTRL|SHIFT", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
		{ key = "h", mods = "CTRL|SHIFT", action = act.ActivatePaneDirection("Left") },
		{ key = "j", mods = "CTRL|SHIFT", action = act.ActivatePaneDirection("Down") },
		{ key = "k", mods = "CTRL|SHIFT", action = act.ActivatePaneDirection("Up") },
		{ key = "l", mods = "CTRL|SHIFT", action = act.ActivatePaneDirection("Right") },
		{ key = "x", mods = "CTRL|SHIFT", action = act.CloseCurrentPane({ confirm = false }) },
		{ key = "z", mods = "CTRL|SHIFT", action = act.TogglePaneZoomState },
		-- copy/paste TBD
		-- { key = 'Enter', mods = 'CTRL',       action = act.ActivateCopyMode },
		{ key = "c", mods = "ALT", action = act.CopyTo("Clipboard") },
		{ key = "v", mods = "ALT", action = act.PasteFrom("Clipboard") },
		-- {
		--   key = 'U',
		--   mods = 'CTRL|SHIFT',
		--   action = act.CharSelect({ copy_on_select = true, copy_to = 'ClipboardAndPrimarySelection' }),
		-- },
	}
end

return config
