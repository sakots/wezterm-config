local wezterm = require 'wezterm'

local module = {}

local ICON = {
  powershell = wezterm.nerdfonts.cod_terminal_powershell,
  ssh        = wezterm.nerdfonts.cod_remote,
  wsl        = wezterm.nerdfonts.cod_terminal_linux,
  terminal   = wezterm.nerdfonts.cod_terminal,
}

function module.get(pane)
  local domain = (pane.domain_name or ""):lower()
  local process = (pane.foreground_process_name or ""):lower()

  -- WSL Domain
  if domain:find("^wsl:") then
    return ICON.wsl
  end

  -- SSH / SSHMUX Domain
  if domain:find("^ssh:") or domain:find("^sshmux:") then
    return ICON.ssh
  end

  -- ssh.exe を直接実行
  if process:find("ssh%.exe$")
      or process:find("[/\\]ssh$") then
    return ICON.ssh
  end

  -- wsl.exe を直接実行
  if process:find("wsl%.exe$") then
    return ICON.wsl
  end

  -- PowerShell
  if process:find("pwsh%.exe$")
      or process:find("powershell%.exe$")
      or process:find("[/\\]pwsh$") then
    return ICON.powershell
  end

  return ICON.terminal
end

return module