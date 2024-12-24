return {
  {
    -- You need to go to the directory of the project and run `npm install` to install the dependencies
    -- cd ~/.local/share/nvim/lazy/markdown-preview.nvim && npm install
    "iamcco/markdown-preview.nvim",
    config = function()
      vim.g.mkdp_refresh_slow = 1
      vim.g.mkdp_open_to_the_world = 1
      vim.g.mkdp_open_ip = "127.0.0.1"
      vim.g.mkdp_echo_preview_url = 1
      vim.g.mkdp_port = "7777"
      vim.g.mkdp_page_title = "「${name}」"
      vim.g.mkdp_preview_options = {
        mkit = {},
        katex = {},
        uml = { server = "http://localhost:7777" },
        disable_sync_scroll = 0,
        sync_scroll_type = "middle",
        hide_yaml_meta = 1,
        sequence_diagrams = {},
        flowchart_diagrams = {},
        content_editable = false,
        disable_filename = 1,
      }
    end,
  },
  {
    "weirongxu/plantuml-previewer.vim",
    dependencies = { "tyru/open-browser.vim" },
  },
}
