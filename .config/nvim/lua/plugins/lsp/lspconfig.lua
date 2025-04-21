return {
    "neovim/nvim-lspconfig",
    config = function ()
    -- Add blink.cmp capabilities settings to lspconfig
    -- This should be executed before you configure any language server
    local lspconfig_defaults = require('lspconfig').util.default_config
    lspconfig_defaults.capabilities = vim.tbl_deep_extend(
      'force',
      lspconfig_defaults.capabilities,
      require('blink.cmp').get_lsp_capabilities()
    )

    require("lspconfig").lua_ls.setup {}
  end
}
