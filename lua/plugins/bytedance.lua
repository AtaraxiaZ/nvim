local isEnabled = vim.fn.has("macunix")
if not isEnabled then
  return {}
end

return {
  {
    "git@code.byted.org:lizhe.99/codeverse.nvim.git",
    dependencies = {
      "hrsh7th/nvim-cmp",
    },
    config = function()
      require("codeverse").setup({})
    end,
  },
}
