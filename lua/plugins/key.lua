return {
  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      defaults = {
        ["<localleader>l"] = { name = "+vimtex" },
        ["<leader>r"] = { name = "+register" },
        ["<leader>gd"] = { name = "+Diffview" },
        ["<leader>gh"] = { name = "+Gitsign" },
      },
    },
  },
  {
    "keaising/im-select.nvim",
    config = function()
      require("im_select").setup({})
    end,
  },
}
