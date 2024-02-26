-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- vim.api.nvim_create_user_command({name}, {command}, {opts})
-- :help user-commands

-- Here is autocommand
-- For the list of events :help events
-- More about autocommands :help autocmd-intro
local augroup = vim.api.nvim_create_augroup("user_cmds", { clear = true })

vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup,
  desc = "Highlight on yank",
  callback = function(event)
    vim.highlight.on_yank({ higroup = "Visual", timeout = 200 })
  end,
})

-- Disable autoformat for certain filetypes
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "c", "cpp", "verilog", "systemverilog", "bib" },
  callback = function()
    vim.b.autoformat = false
  end,
})

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = { "*.v", "*.sv", "*.svh", "*.py", "*.c", "*.h", "*.scala", "*.cpp", "*.cc" },
  group = augroup,
  desc = "Generate tags when saving",
  command = "silent !ctags --tag-relative=never -R ./*",
})

-- Disable diagnostic for certain filetypes
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "systemverilog" },
  callback = function()
    -- vim.diagnostic.disable() -- prevent all annoying svls messages
  end,
})

vim.api.nvim_create_autocmd("BufRead", {
  pattern = { "*.v" },
  group = augroup,
  desc = "Set filetype to verilog",
  command = "set filetype=verilog",
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "c" },
  callback = function()
    -- If you want to use math.h lib, use :make -lm
    vim.opt_local.makeprg = "gcc -Wall -Wextra -Werror -std=c99 -pedantic -g % -o %<"
  end,
})
