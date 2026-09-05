local M = {}

function M.apply_to_config(config)
  config.launch_menu = require 'launch_menu'
end

return M