local status, db = pcall(require, "dashboard")

if not status then
  vim.notify("can not find dashboard!")
  return
end

db.preview_file_height = 12
db.preview_file_width = 80
db.hide_tabline = false
db.custom_header = {
  '                                                       ',
  '                                                       ',
  '                                                       ',
  '                                                       ',
  '                                                       ',
  '          ▀████▀▄▄              ▄█ ',
  '            █▀    ▀▀▄▄▄▄▄    ▄▄▀▀█ ',
  '    ▄        █          ▀▀▀▀▄  ▄▀  ',
  '   ▄▀ ▀▄      ▀▄              ▀▄▀  ',
  '  ▄▀    █     █▀   ▄█▀▄      ▄█    ',
  '  ▀▄     ▀▄  █     ▀██▀     ██▄█   ',
  '   ▀▄    ▄▀ █   ▄██▄   ▄  ▄  ▀▀ █  ',
  '    █  ▄▀  █    ▀██▀    ▀▀ ▀▀  ▄▀  ',
  '   █   █  █      ▄▄           ▄▀   ',
  '                                                       ', 
  '                                                       ',
  '                                                       ',
  '                                                       ',
  '                                                       ',
}
db.custom_center = {
  {
    icon = "  ",
    desc = "Projects                                       ",
    action = "Telescope projects",
  }, 
  {
    icon = "  ",
    desc = "Recently files                                 ",
    action = "Telescope oldfiles",
  },  
  {
    icon = "  ",
    desc = "Edit keybindings                               ",
    action = "edit ~/.config/nvim/lua/keybindings.lua",
  },
  {
    icon = "  ",
    desc = "Edit Projects                                  ",
    action = "edit ~/.local/share/nvim/project_nvim/project_history",
  },
  {
    icon = "  ",
    desc = "Find file                                      ",
    action = "Telescope find_files",
  },
  -- {
  --   icon = '  ',
  --   desc = 'Recently laset session                  ',
  --   shortcut = 'SPC s l',
  --   action = 'SessionLoad'
  -- },  
  -- {
  --   icon = '  ',
  --   desc = 'Recently opened files                   ',
  --   action = 'DashboardFindHistory',
  --   shortcut = 'SPC f h'
  -- }, {
  --   icon = '  ',
  --   desc = 'Find  File                              ',
  --   action = 'Telescope find_files find_command=rg,--hidden,--files',
  --   shortcut = 'SPC f f'
  -- }, {
  --   icon = '  ',
  --   desc = 'File Browser                            ',
  --   action = 'Telescope file_browser',
  --   shortcut = 'SPC f b'
  -- }, {
  --   icon = '  ',
  --   desc = 'Find  word                              ',
  --   aciton = 'DashboardFindWord',
  --   shortcut = 'SPC f w'
  -- }
}
