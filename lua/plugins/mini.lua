return {
  { "echasnovski/mini.nvim", version = false },
  {
    "echasnovski/mini.align",
    opts = {
      -- automatic call `require("mini.align").setup(opts)`
    },
  },
  {
    "echasnovski/mini.surround",
    opts = {
      mappings = {
        add = "gsa",
        delete = "gsd",
        find = "gsf",
        find_left = "gsF",
        highlight = "gsh",
        replace = "gsr",
        update_n_lines = "gsn",
      },
    },
  },
}
