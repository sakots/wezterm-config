local wezterm = require 'wezterm'

local config = wezterm.config_builder()
local os_profile = wezterm.target_triple:find('windows') and 'windows' or 'ubuntu'
local profile_prefix = 'profiles.' .. os_profile .. '.'

require(profile_prefix .. 'main').apply_to_config(config)
require('common').apply_to_config(config)
require(profile_prefix .. 'common').apply_to_config(config)

return config
