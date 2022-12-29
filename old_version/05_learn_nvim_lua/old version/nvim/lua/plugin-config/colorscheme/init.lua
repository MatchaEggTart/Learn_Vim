-- 选择已安装主题
local colorscheme = "tokyonight"
-- 检查主题是否正常运行
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " can not be found!")
  return
end
