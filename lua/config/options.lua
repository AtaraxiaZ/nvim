-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- add your path here, you need to use ** for recursive search, not *
-- And you can't use ~ here, you must expand it, or use
-- (vim.env.HOME .. "/projects/some-project/**")
vim.opt.path:append("/home/zhe/Documents/projects/**")
vim.opt.path:append("/home/zhe/Nutstore\\ Files/Typora/**")

local options = {
  -- :h option-list to check more options
  suffixesadd = { ".sv", ".py", ".c", ".cpp" },
  backup = false, -- creates a backup file
  winbar = "%=%m %f", -- It will put filename on top of the window
  clipboard = "unnamedplus", -- allows neovim to access the system clipboard
  spell = true, -- enable spell check
  cmdheight = 2, -- more space in the neovim command line for displaying messages
  completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  conceallevel = 0, -- so that `` is visible in markdown files
  fileencoding = "utf-8", -- the encoding written to a file
  hlsearch = true, -- highlight all matches on previous search pattern
  ignorecase = true, -- ignore case in search patterns
  mouse = "a", -- allow the mouse to be used in neovim
  pumheight = 10, -- pop up menu height
  showmode = false, -- we don't need to see things like -- INSERT -- anymore
  showtabline = 2, -- always show tabs
  smartcase = true, -- smart case
  smartindent = true, -- make indenting smarter again
  splitbelow = true, -- force all horizontal splits to go below current window
  wildignore = { "*/cache/*", "*/tmp/*" }, -- It's also ok to use = '*/cache/*,*/tmp/*'
  splitright = true, -- force all vertical splits to go to the right of current window
  swapfile = false, -- creates a swapfile
  termguicolors = true, -- set term gui colors (most terminals support this)
  timeoutlen = 1000, -- time to wait for a mapped sequence to complete (in milliseconds)
  autochdir = true,
  autoread = true,
  undofile = true, -- enable persistent undo
  updatetime = 300, -- faster completion (4000ms default)
  writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  expandtab = true, -- convert tabs to spaces
  shiftwidth = 4, -- the number of spaces inserted for each indentation
  background = "dark",
  incsearch = true,
  tabstop = 4, -- insert 2 spaces for a tab
  breakindent = true, -- Preserve the indentation of a virtual line. These "virtual lines" are the ones only visible when wrap is enabled.
  cursorline = true, -- highlight the current line
  number = true, -- set numbered lines
  relativenumber = true, -- set relative numbered lines
  numberwidth = 4, -- set number column width to 2 {default 4}
  signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
  wrap = true, -- display lines as one long line, or true to wrap within screen
  linebreak = true, -- companion to wrap, don't split words
  scrolloff = 8, -- is one of my fav
  sidescrolloff = 8,
  guifont = "monospace:h17", -- the font used in graphical neovim applications
}

vim.opt.shortmess:append("c")

for k, v in pairs(options) do
  vim.opt[k] = v
end

-- vim.cmd can execute multiple lines of vimscript.
-- vim.cmd [[
--   syntax enable
--   colorscheme rubber
-- ]]
vim.cmd("set whichwrap+=<,>,[,],h,l")
-- vim.cmd([[set iskeyword+=-]])
vim.cmd([[set formatoptions-=cro]]) -- TODO: this doesn't seem to work

vim.opt.complete:remove({ "]" })
