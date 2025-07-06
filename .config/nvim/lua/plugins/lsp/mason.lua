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
          "ts_ls",
          "html",
          "emmet_ls",
          "pyright",
          "autotools_ls",
          "arduino_language_server"
        },
        handlers = {
          function (server_name) -- default handler (optional)
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            local server = require("lspconfig")[server_name].setup ({
              capabilities = capabilities,
              inlay_hints = { enabled = true },
            })

            local lspconfig = require('lspconfig')

            lspconfig.html.setup({
              settings = {
                html = {
                  autoClosingTags = true, -- this is optional, the behavior comes from snippets too
                }
              },
              capabilities = require('cmp_nvim_lsp').default_capabilities(),
            })
          end,
        }
      }
    end
  },
}
