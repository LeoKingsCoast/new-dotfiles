return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function ()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
        ensure_installed = {
          "lua",
          "vim",
          "vimdoc",
          "c",
          "cpp",
          "make",
          "cmake",
          "query",
          "markdown",
          "python",
          "javascript",
          "html",
          "markdown_inline",
          "regex",
          "bash",
          "nasm" 
        },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end
  },
  -- {
  --   'nvim-treesitter/playground'
  -- }
}
