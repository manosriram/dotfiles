-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.animation_fps = 60
config.cursor_blink_ease_in = 'Constant'
config.cursor_blink_ease_out = 'Constant'
config.cursor_blink_rate = 500

config.max_fps = 120
config.front_end = "WebGpu"

config.font = wezterm.font('Jetbrains Mono', { weight = 'Medium', italic = false })
config.font_size = 12.0
config.color_scheme_dirs = { '/Users/manosriram/.wezterm/themes' }

config.enable_tab_bar = false

config.enable_tab_bar = true
config.default_cursor_style = "SteadyUnderline"
config.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }
config.window_background_opacity = 0.9
config.macos_window_background_blur = 30
config.colors = {
		background = 'rgba(0, 0, 0, 0.8)',
}
config.text_background_opacity = 0.7

config.color_scheme = 'Nocturnal Winter'

local keys = {
    -- Make Option-Left equivalent to Alt-b which many line editors interpret as backward-word
    {key="LeftArrow", mods="OPT", action=wezterm.action{SendString="\x1bb"}},
    -- Make Option-Right equivalent to Alt-f; forward-word
    {key="RightArrow", mods="OPT", action=wezterm.action{SendString="\x1bf"}},
  {
    key = 'n',
    mods = 'SHIFT|CTRL',
    action = wezterm.action.ToggleFullScreen,
  }
}
config.keys = keys
config.default_prog = { '/bin/zsh' }

-- and finally, return the configuration to wezterm
return config
