local wezterm = require 'wezterm'

local config = wezterm.config_builder()

require('profiles.main').apply_to_config(config)
require('common').apply_to_config(config)

if wezterm.target_triple:find('windows') then
  require('profiles.windows').apply_to_config(config)
else
  require('profiles.ubuntu').apply_to_config(config)
end

return config