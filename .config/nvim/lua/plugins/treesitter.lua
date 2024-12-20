return{
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function ()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
          ensure_installed = { "c", "cpp", "make", "cmake", "lua", "vim", "vimdoc", "query", "markdown", "python", "javascript", "html", "latex", "markdown_inline", "regex", "bash" },
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },
        })
    end
 }

