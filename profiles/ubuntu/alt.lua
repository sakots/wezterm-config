local wezterm = require 'wezterm'

local module = {}

local tab_icons = require 'tab_icons'

-- 丸いタブの左右
local LEFT_ROUND  = wezterm.nerdfonts.ple_left_half_circle_thick
local RIGHT_ROUND = wezterm.nerdfonts.ple_right_half_circle_thick

function module.apply_to_config(config)

  -- =========================================================
  -- ALT profile : Night Lab
  -- =========================================================

  -- フォント
  config.font = wezterm.font('PlemolJP')
  config.font_size = 12
  config.line_height = 1.08

  -- 背景
  config.window_background_opacity = 0.78
  config.win32_system_backdrop = 'Acrylic'

  config.window_background_gradient = {
    orientation = {
      Linear = {
        angle = -35.0,
      },
    },

    colors = {
      "#090b16",
      "#11162a",
      "#171c32",
      "#142b32",
      "#102b29",
      "#0b171c",
    },

    interpolation = "Linear",
    blend = "Rgb",
    noise = 48,

    segment_size = 14,
    segment_smoothness = 1.0,
  }

  -- ターミナル本体の余白
  config.window_padding = {
    left = 12,
    right = 12,
    top = 8,
    bottom = 8,
  }

  -- カーソル
  config.default_cursor_style = "BlinkingBar"
  config.cursor_blink_rate = 650

  -- =========================================================
  -- Tab bar
  -- =========================================================

  -- Retro tab bar
  config.use_fancy_tab_bar = false

  -- タブタイトルを少し長めに表示
  config.tab_max_width = 28

  -- Ctrl+T があるので + ボタンは消してスッキリ
  config.show_new_tab_button_in_tab_bar = true

  -- タブバーそのものは透明
  config.colors = {
    tab_bar = {
      background = "rgba(0, 0, 0, 0.0)",

      active_tab = {
        bg_color = "#5965a8",
        fg_color = "#ffffff",
      },

      inactive_tab = {
        bg_color = "#202a42",
        fg_color = "#aeb8d6",
      },

      inactive_tab_hover = {
        bg_color = "#334465",
        fg_color = "#ffffff",
      },
    },
  }

end

-- =========================================================
-- Rounded tab renderer
-- =========================================================

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)

  local bar_background = "#090b16"

  local background = "#202a42"
  local foreground = "#aeb8d6"

  if tab.is_active then
    background = "#5965a8"
    foreground = "#ffffff"
  elseif hover then
    background = "#334465"
    foreground = "#ffffff"
  end

  local pane = tab.active_pane
  local icon = tab_icons.get(pane)

  local title = tab.tab_title

  if not title or #title == 0 then
    title = pane.title
  end

  -- アイコン＋余白＋丸端のぶんを確保
  title = wezterm.truncate_right(title, max_width - 9)

  local intensity = "Normal"
  if tab.is_active then
    intensity = "Bold"
  end

  return {
    -- タブ間のすき間
    { Background = { Color = bar_background } },
    { Text = " " },

    -- 左丸
    { Background = { Color = bar_background } },
    { Foreground = { Color = background } },
    { Text = LEFT_ROUND },

    -- 本体
    { Background = { Color = background } },
    { Foreground = { Color = foreground } },
    { Attribute = { Intensity = intensity } },
    { Text = "  " .. icon .. "  " .. title .. "  " },

    -- 右丸
    { Background = { Color = bar_background } },
    { Foreground = { Color = background } },
    { Text = RIGHT_ROUND },
  }
end)

return module