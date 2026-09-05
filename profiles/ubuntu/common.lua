local M = {}

function M.apply_to_config(config)
  config.launch_menu = require 'profiles.ubuntu.launch_menu'
  -- GNOME/Waylandでタイトルバーが表示されない問題を避けるためXWaylandを使う
  -- enable_waylandの変更はWezTermの再起動後に反映される
  config.enable_wayland = false
  config.window_decorations = "TITLE | RESIZE"
  config.window_background_opacity = 0.84
end

return M
