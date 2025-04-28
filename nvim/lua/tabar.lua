local M = {}
local fn = vim.fn
local txt = require("nvchad.tabufline.utils").txt

M.state = {}

M.set_name = function(tab, name)
  M.state[tab] = name
  vim.cmd.redrawtabline()
end

local format_tab = function(x)
  local state = require("tabar").state
  local active = x == fn.tabpagenr()

  local hl = "TabO" .. (active and "n" or "ff")
  local label = (state[x] or "Tab")
  label = (active and "󰅬 " or "󰓪  ") .. label
  label = " " .. label .. " "

  return txt(label, hl) .. "%#linenr#" .. "|"
end

M.ui = function()
  local result, tabs = "", fn.tabpagenr "$"

  for nr = 1, tabs, 1 do
    result = result .. format_tab(nr)
  end

  return result
end

return M
