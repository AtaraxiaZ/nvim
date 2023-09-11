-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- vim.api.nvim_create_user_command({name}, {command}, {opts})
-- :help user-commands

-- Here is autocommand
-- For the list of events :help events
-- More about autocommands :help autocmd-intro
local augroup = vim.api.nvim_create_augroup("user_cmds", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "help", "man" },
  group = augroup,
  desc = "Use q to close the window",
  command = "nnoremap <buffer> q <cmd>quit<cr>",
})

vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup,
  desc = "Highlight on yank",
  callback = function(event)
    vim.highlight.on_yank({ higroup = "Visual", timeout = 200 })
  end,
})

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = { "*.v", "*.sv", "*.svh", "*.py" },
  group = augroup,
  desc = "Generate tags when saving",
  command = "silent !ctags --tag-relative=never -R ./*",
})

-- Disable autoformat for lua files
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "systemverilog" },
  callback = function()
    vim.b.autoformat = false
  end,
})
