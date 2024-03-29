return {
  {
    "stevearc/aerial.nvim",
    -- Optional dependencies
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      on_attach = function(bufnr)
        -- Jump forwards/backwards with '{' and '}'
        vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
        vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
      end,
    },
  },
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = true,
    opts = {
      size = 10,
      autochdir = false,
      start_in_insert = true,
      open_mapping = [[<c-\>]],
      direction = "horizontal",
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = {
        width = 30,
      },
      filesystem = {
        filtered_items = {
          visible = true,
          show_hidden_count = true,
          hide_dotfiles = false,
          hide_gitignored = true,
          hide_by_name = {
            "tags",
            ".git",
            ".DS_Store",
            -- 'thumbs.db',
          },
          never_show = {},
        },
      },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      {
        "<leader>fP",
        function()
          require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root })
        end,
        desc = "Find Plugin File",
      },
    },
  },
  {
    "nvim-telescope/telescope-project.nvim",
    dependencies = { "nvim-telescope/telescope-file-browser.nvim" },
    config = function()
      require("telescope").load_extension("project")
    end,
    keys = {
      { "<leader>fp", "<cmd>lua require'telescope'.extensions.project.project{}<cr>", desc = "Find Project Files" },
    },
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    tag = "v3.4.1", --The latest v3.5 have bugs
  },
}
