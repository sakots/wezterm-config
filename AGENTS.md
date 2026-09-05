# AGENTS.md

## Project Context

.luaで書かれた、weztermの設定ファイル群。

## ファイル構成

OSがWindowsなら`profiles/windows/`を、
そうでないならUbuntuと判断し`profiles/ubuntu/`を使用する。

各OSのディレクトリには、通常プロファイルの`main.lua`、
別プロファイルの`alt.lua`、OS固有の共通設定の`common.lua`を配置する。
ルートの`common.lua`は全OS・全プロファイルの共通設定。

Windows用のラウンチメニューは`profiles/windows/launch_menu.lua`に配置し、
`profiles/windows/common.lua`から読み込む。

`wezterm.lua`はOS別の`main.lua`、ルートの`common.lua`、
OS別の`common.lua`の順に読み込む。

`wezterm-alt.lua`は起動オプションで指定する別のプロファイルである。
ルートの`common.lua`、OS別の`alt.lua`、OS別の`common.lua`の順に読み込む。
