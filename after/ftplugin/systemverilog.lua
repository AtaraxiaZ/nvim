-- Write all your systemverilog file specific command here
local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set
local opt = vim.opt

-- Jump between register q and d
keymap("n", "<leader>rq", "/<C-R>/<BS><BS><BS>q<CR>", { desc = "jump to reg_q" })
keymap("n", "<leader>rd", "/<C-R>/<BS><BS><BS>d<CR>", { desc = "jump to reg_d" })
-- add _i and _o to all signal
keymap("n", "<leader>ri", "* :%s/<C-R>//\\0_i/ge<CR> | <c-o>", { desc = "add _i" })
keymap("n", "<leader>ro", "* :%s/<C-R>//\\0_o/ge<CR> | <c-o>", { desc = "add _o" })
-- change all wire and reg to logic
keymap("n", "<leader>rr", "<cmd>%s/\\<wire\\>/logic/ge<CR> | <cmd>%s/\\<reg\\>/logic/ge<CR>", { desc = "v to sv" })
-- delete all space before trailing semicolon/comma
keymap("n", "<leader>rt", "<cmd>%s/\\s*;$/;/g<CR> | <cmd>%s/\\s*,$/,/g<CR>", { desc = "delete space before ;," })

-- run cog and verilog mode
keymap("n", "<F5>", "! emacs -l ~/bin/verilog-mode.el --batch % -f verilog-batch-auto <CR>")

opt.commentstring = "// %s"
