local wezterm = require 'wezterm'

local module = {}

function module.apply_to_config(config)

  -- ウィンドウサイズ
  config.initial_cols = 120
  config.initial_rows = 32

  -- タイトルバーを削除
  --config.window_decorations = "RESIZE"

  -- 背景
  config.window_background_opacity = 0.65
  config.macos_window_background_blur = 30
  config.win32_system_backdrop = 'Acrylic'

  -- グラデーション背景
  config.window_background_gradient = {
    orientation = { Linear = { angle = -50.0 } },

    colors = {
      "#030b0a",
      "#0c1410",
      "#16231d",
      "#1c2e2e",
      "#18291d",
      "#16261b",
    },

    interpolation = "Linear",
    blend = "Rgb",
    noise = 64,
    segment_size = 11,
    segment_smoothness = 1.0,
  }

  -- タブバーも透明に
  config.window_frame = {
    inactive_titlebar_bg = "none",
    active_titlebar_bg = "none",
  }

  -- フォント
  config.font_size = 12
  config.font = wezterm.font('PlemolJP')

  -- カラースキーム
  config.color_scheme = 'Monokai Pro (Gogh)'

  -- スクロールバック
  config.scrollback_lines = 350000

  -- キーバインド
  local keybinds = require 'keybinds'
  config.keys = keybinds.keys
  config.key_tables = keybinds.key_tables

end

return module
