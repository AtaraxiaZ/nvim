return {
  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      spec = {
        { "<leader>gd", group = "+Diffview" },
        { "<leader>gh", group = "+Gitsign" },
        { "<leader>r", group = "+register" },
      },
    },
  },
  {
    -- Default configuration can change between differeent OS,
    -- so don't do it by yourself
    "keaising/im-select.nvim",
    config = function()
      require("im_select").setup({})
    end,
  },
}
