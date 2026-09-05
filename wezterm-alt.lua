local wezterm = require 'wezterm'

local config = wezterm.config_builder()

require('common').apply_to_config(config)
require('profiles.alt').apply_to_config(config)

return config