-- Write all your systemverilog file specific command here
local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set
local opt = vim.opt

keymap("n", "<leader>rr", function()
  local word = vim.fn.expand("<cword>") -- 获取光标下的单词
  local pattern_q = "_q$" -- 匹配 _q 结尾
  local pattern_d = "_d$" -- 匹配 _d 结尾

  if word:find(pattern_q) then
    -- 如果是 "_q" 结尾，切换到 "reg_d"
    vim.cmd("/\\<" .. word:gsub(pattern_q, "_d") .. "\\>")
  elseif word:find(pattern_d) then
    -- 如果是 "_d" 结尾，切换到 "reg_q"
    vim.cmd("/\\<" .. word:gsub(pattern_d, "_q") .. "\\>")
  else
    -- 如果既不是 "_q" 也不是 "_d" 结尾，可以输出一个消息
    print("no _q or _d postfix")
  end
end, { noremap = true, silent = true, desc = "Toggle _q and _d" })
keymap("n", "<leader>rq", "/<C-R>/<BS><BS><BS>q<CR>", { desc = "jump to reg_q" })
keymap("n", "<leader>rd", "/<C-R>/<BS><BS><BS>d<CR>", { desc = "jump to reg_d" })
-- add _i and _o to all signal
keymap("n", "<leader>ri", "* :%s/<C-R>//\\0_i/ge<CR> | <c-o>", { desc = "add _i" })
keymap("n", "<leader>ro", "* :%s/<C-R>//\\0_o/ge<CR> | <c-o>", { desc = "add _o" })
-- change all wire and reg to logic
keymap(
  "n",
  "<leader>rs",
  "<cmd>%s/\\<wire\\>/logic/ge<CR> | <cmd>%s/\\<reg\\>/logic/ge<CR> | <cmd>%s/always\\s*@(\\s*\\*\\s*)/always_comb/ge<CR> | <cmd>%s/always\\s*@(\\s*posedge/always_ff @(posedge/ge<CR>",
  { desc = "v to sv" }
)
-- delete all space before trailing semicolon/comma
keymap("n", "<leader>rt", "<cmd>%s/\\s*;$/;/g<CR> | <cmd>%s/\\s*,$/,/g<CR>", { desc = "delete space before ;," })

-- run cog and verilog mode
keymap("n", "<F5>", "! emacs -l ~/opt/verilog-mode.el --batch % -f verilog-batch-auto <CR>")

opt.commentstring = "// %s"
