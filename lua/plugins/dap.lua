return {
  {
    "mfussenegger/nvim-dap",
    optional = true,
    -- To mimic VSCode's shortcut
    keys = {
      {
        "<F9>",
        function()
          require("dap").toggle_breakpoint()
        end,
        desc = "Toggle Breakpoint",
      },
      {
        "<F5>",
        function()
          require("dap").continue()
        end,
        desc = "Continue",
      },
      {
        "<F11>",
        function()
          require("dap").step_into()
        end,
        desc = "Step Into",
      },
      {
        "<F23>", -- shift + F11 == F23
        function()
          require("dap").step_out()
        end,
        desc = "Step Out",
      },
      {
        "<F10>",
        function()
          require("dap").step_over()
        end,
        desc = "Step Over",
      },
      {
        "<F6>",
        function()
          require("dap").pause()
        end,
        desc = "Pause",
      },
      {
        "<F17>", -- shift + F5 == F17
        function()
          require("dap").terminate()
        end,
        desc = "Terminate",
      },
    },
  },
}
