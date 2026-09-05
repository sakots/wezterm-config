local M = {}

function M.apply_to_config(config)
  config.launch_menu = require 'profiles.windows.launch_menu'
  -- デフォルトで PowerShell を起動
  config.default_prog = { "pwsh.exe", "-NoLogo" }
end

return M
