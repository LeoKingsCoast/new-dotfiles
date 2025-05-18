return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      -- local capabilities = require('cmp_nvim_lsp').default_capabilities()
      require("mason-lspconfig").setup {
        automatic_enable = true,
        ensure_installed = {
          "lua_ls",
          "rust_analyzer",
          "clangd",
          "marksman",
          "html",
          "pyright",
          "autotools_ls",
          "arduino_language_server"
        },
        handlers = {
          function (server_name) -- default handler (optional)
            require("lspconfig")[server_name].setup ({
              capabilities = capabilities,
              inlay_hints = { enabled = true },
            })
          end,
        }
      }
    end
  },
}
