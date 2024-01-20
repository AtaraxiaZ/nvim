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
      require("im_select").setup({
        default_im_select = "1",
        default_command = "fcitx-remote",
        set_default_events = { "VimEnter", "FocusGained", "InsertLeave", "CmdlineLeave" },
        set_previous_events = { "InsertEnter" },
        keep_quiet_on_no_binary = false,
        async_switch_im = true,
      })
    end,
  },
}
