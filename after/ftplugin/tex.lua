local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

keymap("i", "<C-l>", "<c-g>u<Esc>[s1z=`]a<c-g>u", { desc = "revise last spell error" })
