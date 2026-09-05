local wezterm = require 'wezterm'
local tab_icons = require 'tab_icons'

local module = {}

function module.apply_to_config(config)

  -- =========================================================
  -- MAIN profile
  -- 元のWezTermタブに近いデザイン
  -- =========================================================

  config.use_fancy_tab_bar = false
  config.tab_max_width = 32

  -- ＋ボタンは残す
  config.show_new_tab_button_in_tab_bar = true

  -- タブバー背景
  config.colors = {
    tab_bar = {
      background = "rgba(0, 0, 0, 0.0)",

      new_tab = {
        bg_color = "#303b40",
        fg_color = "#bfc9cc",
      },

      new_tab_hover = {
        bg_color = "#47565c",
        fg_color = "#ffffff",
      },
    },
  }

end


-- =========================================================
-- MAIN tab renderer
-- 元の四角いタブ + アイコン
-- =========================================================

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)

  local background = "#5c6d74"
  local foreground = "#ffffff"

  if tab.is_active then
    background = "#c23737"
    foreground = "#ffffff"
  elseif hover then
    background = "#71848c"
    foreground = "#ffffff"
  end

  local pane = tab.active_pane
  local icon = tab_icons.get(pane)

  local title = tab.tab_title

  if not title or #title == 0 then
    title = pane.title
  end

  -- アイコンと左右余白を考慮
  title = wezterm.truncate_right(title, max_width - 9)

  return {
    { Background = { Color = background } },
    { Foreground = { Color = foreground } },

    -- 最初の設定と同じような広めの左右余白
    { Text = "   " .. icon .. "  " .. title .. "   " },
  }
end)

-- タブバー右側に現在日時を表示
wezterm.on("update-status", function(window, pane)
  window:set_right_status(wezterm.format({
    { Foreground = { Color = "#bfc9cc" } },
    { Text = wezterm.strftime("%Y-%m-%d %H:%M") .. "  " },
  }))
end)

return module
