return{
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup {
        ensure_installed = { "lua_ls", "rust_analyzer", "clangd", "marksman" },
      }
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      require("mason-lspconfig").setup_handlers {
        -- The first entry (without a key) will be the default handler
        -- and will be called for each installed server that doesn't have
        -- a dedicated handler.
        function (server_name) -- default handler (optional)
          require("lspconfig")[server_name].setup ({capabilities = capabilities})
        end,
      }
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()

      vim.keymap.set({'n'}, '<leader>ca', vim.lsp.buf.code_action, { desc = "LSP Code Action" })
    end
  }
}
