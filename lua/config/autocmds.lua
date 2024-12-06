-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "java" },
  command = "set ts=4 sw=4 sts=4 et",
 })

-- disable auto comment on new lines
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "*" },
  command = "set formatoptions-=cro"
})
