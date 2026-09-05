local M = {}

function M.apply_to_config(config)
  -- GNOME/Waylandでタイトルバーが表示されない問題を避けるためXWaylandを使う
  -- enable_waylandの変更はWezTermの再起動後に反映される
  config.enable_wayland = false
  config.window_decorations = "TITLE | RESIZE"
end

return M
