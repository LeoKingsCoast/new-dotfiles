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

    vim.diagnostic.config({ virtual_text = true })

    -- Mappings.
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('user_lsp_attach', {clear = true}),
      callback = function(event)
        local opts = {buffer = event.buf}

        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = "LSP Code Action" })
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc = "Go to declaration" })
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = "Go to definition" })
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = "Show hover information" })
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { desc = "Go to implementation" })
        vim.keymap.set('n', 'go', vim.lsp.buf.type_definition, { desc = "Go to type definition" })
        vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set('n', '<space>wl', function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, { desc = "References" })
        vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = "Open diagnostic" })
        vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })
        vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })
        vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = "Set diagnostic list" })

        vim.keymap.set('n', '<space>il', function ()
          vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
        end, { desc = "Show Inlay Hints" })

        vim.keymap.set('n', 'gh', "<cmd>ClangdSwitchSourceHeader<CR>", { desc = "Switch between Source and Header" })
      end,
    })
  end
}
