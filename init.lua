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

-- TSInstall并不会直接将systemrdl的query文件复制到~/.local/share/nvim/lazy/nvim-treesitter/queries/
-- 需要手动将highlight.scm文件复制过去
local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.systemrdl = {
  install_info = {
    url = "~/projects/systemrdl/tree-sitter-systemrdl/", -- local path or git repo
    files = { "src/parser.c" }, -- note that some parsers also require src/scanner.c or src/scanner.cc
    -- optional entries:
    branch = "add-highlights-query", -- default branch in case of git repo if different from master
    generate_requires_npm = false, -- if stand-alone parser without npm dependencies
    requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
  },
  filetype = "rdl", -- if filetype does not match the parser name
}
