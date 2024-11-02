local wezterm = require("wezterm")
local config = wezterm.config_builder()

config = {
	enable_wayland = true,
	automatically_reload_config = true,
	enable_tab_bar = false,
	window_close_confirmation = "NeverPrompt",
	color_scheme = "catppuccin-mocha",
	font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Medium", stretch = "Normal", style = "Normal" }),
	window_padding = {
		left = 3,
		right = 3,
		top = 0,
		bottom = 0,
	},
}

return config
