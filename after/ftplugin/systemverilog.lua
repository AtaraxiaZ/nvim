-- Write all your systemverilog file specific command here
local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set
local opt = vim.opt

-- Jump between register q and d
keymap("n", "<leader>rq", "/<C-R>/<BS><BS><BS>q<CR>", { desc = "jump to reg_q" })
keymap("n", "<leader>rd", "/<C-R>/<BS><BS><BS>d<CR>", { desc = "jump to reg_d" })
-- add _i and _o to all signal
keymap("n", "<leader>ri", ":%s/<C-R>//\\0_i/ge<CR>", { desc = "add _i" })
keymap("n", "<leader>ro", ":%s/<C-R>//\\0_o/ge<CR>", { desc = "add _o" })

-- run cog and verilog mode
keymap(
  "n",
  "<F5>",
  "! python ~/anaconda3/pkgs/cogapp*/bin/cog.py -r % <CR> ! emacs -l ~/bin/verilog-mode.el --batch % -f verilog-batch-auto <CR> ! sed -i '' 's/[ \t]*$//g' % <CR> <cmd>e! | retab | update <cr>"
)

opt.commentstring = "// %s"
