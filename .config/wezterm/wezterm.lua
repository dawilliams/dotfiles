-- Type CTRL-SHIFT-L in Wezterm to see current config
-- https://github.com/wez/wezterm/issues/4238#issuecomment-2295092917
-- https://wezfurlong.org/wezterm/config/lua/keyassignment/ShowDebugOverlay.html

-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
config.font = wezterm.font("MesloLGS NF")
config.font_size = 16

-- Remove tabs
config.enable_tab_bar = false

-- Remove title bar but keep resize window option
config.window_decorations = "RESIZE"

-- Set background transparancy
config.window_background_opacity = 0.9

-- Set background blur
config.macos_window_background_blur = 50

-- and finally, return the configuration to wezterm
return config
