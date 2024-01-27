-- Some autocmds seems not working in lazyvim config.autocmds
-- Maybe it's because of the VeryLazy event.
-- So I put some autocmds related to stdin here.

vim.api.nvim_create_autocmd("StdinReadPost", {
  pattern = { "*" },
  command = "set nomodified",
})

-- We need to use BufEnter because when reading a file from stdin,
-- we are just visiting it, so BufRead won't be triggered
vim.api.nvim_create_autocmd({ "BufFilePost" }, {
  pattern = { ".gitstatus" },
  callback = function()
    vim.api.nvim_buf_set_keymap(
      0,
      "n",
      "<CR>",
      "<cmd>.w !awk '{print $NF}'|xargs -i tmux neww git difftool -y {}<cr>",
      { noremap = true, silent = true }
    )
  end,
})
