-- bootstrap lazy.nvim, LazyVim and your plugins
if vim.g.vscode then
else
  -- It may make a mass in vscode
  require("config.lazy")
end
