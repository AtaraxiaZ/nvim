return {
  { "nvim-mini/mini.nvim", version = false },
  {
    "nvim-mini/mini.align",
    opts = {
      -- automatic call `require("mini.align").setup(opts)`
    },
  },
  {
    "nvim-mini/mini.surround",
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
