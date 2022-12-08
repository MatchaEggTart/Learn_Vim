local status, surround = pcall(require, "surround")

if not status then
  vim.notify("can not find surround")
  return
end

surround.setup({
  mappings_style = "surround",
})
