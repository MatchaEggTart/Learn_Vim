-- local dashboard = require("dashboard")
local status, dashboard = pcall(require, "dashboard")
if not status then
  vim.notify("can't find dashboard")
  return
end                           

local function repeat_str (str, times)
	return times > 0 and str..repeat_str(str, times-1) or ""
end


local empty_line = [[]]
local header = {
  '',
  '',
  '',
  '',
  ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
  ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
  ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
  ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
  ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
  ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
 '',
 '',
 '',
 '',
}

-- local splash = vim.fn.system("shuf -n 1 "..vim.fn.stdpath("config").."/splashes"):sub(1,-2).."!"
-- local padding = (#header[#header] - #splash) / 2 - 2
-- splash = repeat_str(" ", padding).."[ "..splash.." ]"

-- Add the splash string followed by two empty lines
-- table.insert(header, splash)
-- table.insert(header, empty_line)
-- table.insert(header, empty_line)
-- table.insert(header, empty_line)


dashboard.custom_header  = header
dashboard.custom_footer = {
  "",
  "",
  "https://github.com/nshen/learn-neovim-lua",
}
dashboard.custom_center = {
  {
    icon = "  ",
    desc = "Projects        ",
    action = "Telescope projects",
  },
  {
    icon = "  ",
    desc = "New file        ",
    -- shortcut = ":enew",
    action = "enew",
  },
  {
    icon = "  ",
    desc = "Recently files  ",
    action = "Telescope oldfiles",
  },
  {
    icon = "  ",
    desc = "Find file       ",
    -- shortcut = "SPC f",
    action = "Telescope find_files hidden=true no_ignore=true",
  },
  {
    icon = "  ",
    desc = "Edit keybindings",
    action = "edit ~/.config/nvim/lua/keybindings.lua",
  },
  {
    icon = "  ",
    desc = "Edit Projects   ",
    action = "edit ~/.local/share/nvim/project_nvim/project_history",
  },
  {
    icon = "  ",
    desc = "Update plugins  ",
    -- shortcut = ":PackerSync",
    action = "PackerSync",
  },
--  {
--    icon = "  ",
--    desc = "Browse dotfiles                        ",
--    shortcut = "SPC v d",
--    action = "Telescope find_files cwd=~/.config/nvim/ search_dirs=Ultisnips,lua,viml,init.vim",
--  },
--  {
--    icon = "  ",
--    desc = "Open floating terminal                 ",
--    shortcut = "SPC t t",
--    action = "FloatermToggle",
--  },
  {
    icon = "  ",
    desc = "Close neovim    ",
    -- shortcut = ":qa!",
    action = "qa!",
  },
}
