return {
  -- add any tools you want to have installed below
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua", -- To read stylua.toml
        "shellcheck",
        "shfmt",
        "pyright", -- For static type check
        "verible",
        "marksman",
        "black", -- For python formatter
        "debugpy",
        "clangd",
        "texlab",
        "codelldb",
        "checkmake",
        "hadolint",
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- pyright will be automatically installed with mason and loaded with lspconfig
        pyright = {
          settings = {
            pyright = { autoImportCompletion = true },
            python = {
              analysis = {
                autoSearchPaths = true,
                diagnosticMode = "openFilesOnly",
                useLibraryCodeForTypes = true,
                typeCheckingMode = "off",
              },
            },
          },
        },
        texlab = {
          keys = {
            { "<Leader>K", "<cmd>VimtexDocPackage<cr>", desc = "Vimtex Docs", silent = true },
          },
        },
      },
      setup = {
        clangd = function(_, opts)
          opts.capabilities.offsetEncoding = { "utf-16" }
        end,
      },
    },
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = {
          auto_trigger = true,
        },
      })
    end,
  },
  {
    "p00f/clangd_extensions.nvim",
    opts = {
      inlay_hints = {
        inline = true,
      },
    },
  },
  {
    {
      "scalameta/nvim-metals",
      ft = { "scala", "sbt" },
      dependencies = {
        "nvim-lua/plenary.nvim",
      },
    -- stylua: ignore
    keys = {
      { "<leader>cW", function () require('metals').hover_worksheet() end, desc = "Metals Worksheet" },
      { "<leader>cM", function () require('telescope').extensions.metals.commands() end, desc = "Telescope Metals Commands" },
    },
      init = function()
        local metals_config = require("metals").bare_config()

        metals_config.settings = {
          showImplicitArguments = true,
          showImplicitConversionsAndClasses = true,
          showInferredType = true,
          superMethodLensesEnabled = true,
        }
        metals_config.init_options.statusBarProvider = "on"
        metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()

        local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
        vim.api.nvim_create_autocmd("FileType", {
          pattern = { "scala", "sbt" },
          callback = function()
            require("metals").initialize_or_attach(metals_config)
          end,
          group = nvim_metals_group,
        })
      end,
    },
  },
}
