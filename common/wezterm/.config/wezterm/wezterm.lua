-- Pull in the wezterm API and initialize config
local wezterm = require 'wezterm'
local config = wezterm.config_builder()
local mux = wezterm.mux
local act = wezterm.action

-- wezterm.on('gui-startup', function()
--   local tab, pane, window = mux.spawn_window({})
--   window:gui_window():maximize()
-- end)

-- https://wezfurlong.org/wezterm/colorschemes/index.html
config.color_scheme = 'Gruvbox Material (Gogh)'
-- https://wezfurlong.org/wezterm/config/lua/wezterm/font.html
config.font = wezterm.font(
  'SauceCodePro Nerd Font',
  -- 'JetBrainsMono Nerd Font',
  -- 'FiraMono Nerd Font',
  -- 'Hack Nerd Font',
  {
    weight = 'Medium',
    stretch = 'Normal',
    style = 'Normal',
  }
)
config.font_size = 14
config.line_height = 1.1
-- disable ligatures; line vs dot zero
config.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0', 'zero' }

config.window_frame = {
  -- inactive_titlebar_bg = '#353535',
  -- active_titlebar_bg = '#2b2042',
  -- inactive_titlebar_fg = '#cccccc',
  -- active_titlebar_fg = '#ffffff',
  -- inactive_titlebar_border_bottom = '#2b2042',
  -- active_titlebar_border_bottom = '#2b2042',
  -- button_fg = '#cccccc',
  -- button_bg = '#2b2042',
  -- button_hover_fg = '#ffffff',
  -- button_hover_bg = '#3b3052',
  border_left_width = '0.1cell',
  border_right_width = '0.1cell',
  border_bottom_height = '0.1cell',
  border_top_height = '0.1cell',
  -- border_left_color = 'purple',
  -- border_right_color = 'purple',
  -- border_bottom_color = 'purple',
  -- border_top_color = 'purple',
  -- only need these with use_fancy_tab_bar = true
  -- font = wezterm.font { family = 'SauceCodePro Nerd Font', weight = 'Bold' },
  -- font_size = 12,
}

config.inactive_pane_hsb = {
  saturation = 0.9,
  brightness = 0.7,
}

config.use_dead_keys = false
config.scrollback_lines = 10000
config.audible_bell = 'Disabled'
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false

config.disable_default_key_bindings = true
config.leader = { key = 'a', mods = 'ALT', timeout_milliseconds = 2000 }
config.keys = {
  { key = 'N',  mods = 'CTRL|SHIFT', action = act.SpawnWindow },
  { key = 'R',  mods = 'CTRL|SHIFT', action = act.ReloadConfiguration },
  { key = '+',  mods = 'CTRL|SHIFT', action = act.IncreaseFontSize },
  { key = '-',  mods = 'CTRL|SHIFT', action = act.DecreaseFontSize },
  { key = '0',  mods = 'CTRL|SHIFT', action = act.ResetFontSize },
  -- tab management
  { key = 't',  mods = 'CMD',        action = act.SpawnTab 'CurrentPaneDomain' },
  { key = 'w',  mods = 'CMD',        action = act.CloseCurrentTab { confirm = false } },
  { key = 'l',  mods = 'CMD',        action = act.ActivateTabRelative(1) },
  { key = 'h',  mods = 'CMD',        action = act.ActivateTabRelative(-1) },
  { key = '1',  mods = 'CMD',        action = act.ActivateTab(0) },
  { key = '2',  mods = 'CMD',        action = act.ActivateTab(1) },
  { key = '3',  mods = 'CMD',        action = act.ActivateTab(2) },
  { key = '4',  mods = 'CMD',        action = act.ActivateTab(3) },
  { key = '5',  mods = 'CMD',        action = act.ActivateTab(4) },
  { key = '6',  mods = 'CMD',        action = act.ActivateTab(5) },
  { key = '7',  mods = 'CMD',        action = act.ActivateTab(6) },
  { key = '8',  mods = 'CMD',        action = act.ActivateTab(7) },
  { key = '9',  mods = 'CMD',        action = act.ActivateTab(8) },
  -- pane management
  { key = '%',  mods = 'CTRL|SHIFT', action = act.SplitVertical { domain = 'CurrentPaneDomain' }, },
  { key = '\\', mods = 'CTRL|SHIFT', action = act.SplitHorizontal { domain = 'CurrentPaneDomain' } },
  { key = 'h',  mods = 'CTRL|SHIFT', action = act.ActivatePaneDirection 'Left' },
  { key = 'j',  mods = 'CTRL|SHIFT', action = act.ActivatePaneDirection 'Down', },
  { key = 'k',  mods = 'CTRL|SHIFT', action = act.ActivatePaneDirection 'Up' },
  { key = 'l',  mods = 'CTRL|SHIFT', action = act.ActivatePaneDirection 'Right' },
  { key = 'x',  mods = 'CTRL|SHIFT', action = act.CloseCurrentPane { confirm = false } },
  { key = 'z',  mods = 'CTRL|SHIFT', action = act.TogglePaneZoomState },
  -- copy/paste TBD
  -- { key = 'Enter', mods = 'CTRL',        action = act.ActivateCopyMode },
  -- { key = 'C',     mods = 'SHIFT|CTRL',  action = act.CopyTo 'Clipboard' },
  -- { key = 'U',     mods = 'SHIFT|CTRL',  action = act.CharSelect { copy_on_select = true, copy_to = 'ClipboardAndPrimarySelection' } },
  -- { key = 'v',     mods = 'CMD',         action = act.PasteFrom 'Clipboard' },
  -- { key = 'b',     mods = 'LEADER|CTRL', action = act.SendString '\x02' },
  -- { key = 'Enter', mods = 'LEADER',      action = act.ActivateCopyMode },
  -- { key = 'p',     mods = 'LEADER',      action = act.PasteFrom },
}

config.window_decorations = "RESIZE"

return config
