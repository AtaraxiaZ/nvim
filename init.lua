-- bootstrap lazy.nvim, LazyVim and your plugins
if vim.g.vscode then
  -- Key maps
  vim.cmd([[nnoremap <silent> gr <cmd>lua require('vscode-neovim').call('editor.action.referenceSearch.trigger')<cr>]])
  vim.cmd(
    [[nnoremap <silent> <s-h> <cmd>lua require('vscode-neovim').call('workbench.action.previousEditorInGroup')<cr>]]
  )
  vim.cmd([[nnoremap <silent> <s-l> <cmd>lua require('vscode-neovim').call('workbench.action.nextEditorInGroup')<cr>]])
  vim.cmd([[nnoremap <silent> <esc> <cmd>noh<cr><esc>]])
  vim.cmd([[nmap j gj]])
  vim.cmd([[nmap k gk]])

  -- Options
  vim.opt.ignorecase = true
  vim.opt.clipboard:append("unnamedplus")
  require("vscode.im-select")
else
  -- It may make a mass in vscode
  require("pre.autocmds")
  require("config.lazy")
end

if vim.fn.has("macunix") then
  require("bytedance.lsp")
end
