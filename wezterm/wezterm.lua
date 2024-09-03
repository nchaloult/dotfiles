-- https://wezfurlong.org/wezterm/config/files.html

local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.font = wezterm.font('JetBrains Mono', { weight = 'Bold' })
config.underline_thickness = "200%"
config.color_scheme = 'Gruvbox Dark (Gogh)'
config.initial_rows = 40
config.initial_cols = 120
config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = 'RESIZE'

return config
