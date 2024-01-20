-- bootstrap lazy.nvim, LazyVim and your plugins
if vim.g.vscode then
  vim.cmd([[nnoremap <silent> gr <cmd>lua require('vscode-neovim').call('editor.action.referenceSearch.trigger')<cr>]])
  vim.cmd(
    [[nnoremap <silent> <s-h> <cmd>lua require('vscode-neovim').call('workbench.action.previousEditorInGroup')<cr>]]
  )
  vim.cmd([[nnoremap <silent> <s-l> <cmd>lua require('vscode-neovim').call('workbench.action.nextEditorInGroup')<cr>]])
  vim.cmd([[nnoremap <silent> <esc> <cmd>noh<cr><esc>]])
else
  -- It may make a mass in vscode
  require("config.lazy")
end
