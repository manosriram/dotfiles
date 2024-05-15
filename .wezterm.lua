-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.font = wezterm.font('Fira Code', { weight = 'Medium' })
config.color_scheme = '3024 Night'
config.enable_tab_bar = true
config.default_cursor_style = "SteadyUnderline"
config.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }

local keys = {
    -- Make Option-Left equivalent to Alt-b which many line editors interpret as backward-word
    {key="LeftArrow", mods="OPT", action=wezterm.action{SendString="\x1bb"}},
    -- Make Option-Right equivalent to Alt-f; forward-word
    {key="RightArrow", mods="OPT", action=wezterm.action{SendString="\x1bf"}},
}
config.keys = keys
config.default_prog = { '/opt/homebrew/bin/fish', '-l' }

-- and finally, return the configuration to wezterm
return config
