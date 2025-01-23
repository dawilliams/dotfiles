-- Type CTRL-SHIFT-L in Wezterm to see current config
-- https://github.com/wez/wezterm/issues/4238#issuecomment-2295092917
-- https://wezfurlong.org/wezterm/config/lua/keyassignment/ShowDebugOverlay.html

local wezterm = require 'wezterm'        -- Pull in the wezterm API
local config = wezterm.config_builder()  -- This will hold the configuration.

-- This is where you actually apply your config choices
config.color_scheme = 'Catppuccin Mocha' -- Mocha, Macchiato, Frappe, Latte
config.font = wezterm.font('JetBrains Mono')
config.font_size = 18
config.enable_tab_bar = false            -- Remove tabs
config.window_decorations = 'RESIZE'     -- Remove title bar but keep resize window option
config.window_background_opacity = 1.0   -- Set background transparancy
config.macos_window_background_blur = 30 
return config                            -- and finally, return the configuration to wezterm
