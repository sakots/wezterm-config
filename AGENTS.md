# AGENTS.md

## Project Context

.luaで書かれた、weztermの設定ファイル群。

## ファイル構成

`wezterm.lua`から、OSがwindowsなら`profiles/windows.lua`を、
そうでないならubuntuと判断し`profiles/ubuntu.lua`を読み込む。

`wezterm-alt.lua`は起動オプションで起動する別のプロファイルである。
こちらで起動した場合`profiles/main.lua`のかわりに`profiles/alt.lua`を読み込む。
`common.lua`は共通設定。
