-- Type CTRL-SHIFT-L in Wezterm to see current config
-- https://github.com/wez/wezterm/issues/4238#issuecomment-2295092917
-- https://wezfurlong.org/wezterm/config/lua/keyassignment/ShowDebugOverlay.html

-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'AdventureTime'

-- and finally, return the configuration to wezterm
return config
