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
                ensure_installed = { "lua_ls", "rust_analyzer", "clangd", "marksman", "pyright", "autotools_ls", "arduino_language_server" },
            }
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            require("mason-lspconfig").setup_handlers {
                -- The first entry (without a key) will be the default handler
                -- and will be called for each installed server that doesn't have
                -- a dedicated handler.
                function (server_name) -- default handler (optional)
                    require("lspconfig")[server_name].setup ({
                        capabilities = capabilities,
                        inlay_hints = { enabled = true },
                    })
                end,
            }
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            vim.keymap.set({'n'}, '<leader>ca', vim.lsp.buf.code_action, { desc = "LSP Code Action" })
            -- Mappings.
            vim.api.nvim_create_autocmd('LspAttach', {
                group = vim.api.nvim_create_augroup('user_lsp_attach', {clear = true}),
                callback = function(event)
                    local opts = {buffer = event.buf}

                    -- vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
                    -- vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
                    -- vim.keymap.set('n', '<leader>vws', function() vim.lsp.buf.workspace_symbol() end, opts)
                    -- vim.keymap.set('n', '<leader>vd', function() vim.diagnostic.open_float() end, opts)
                    -- vim.keymap.set('n', '[d', function() vim.diagnostic.goto_next() end, opts)
                    -- vim.keymap.set('n', ']d', function() vim.diagnostic.goto_prev() end, opts)
                    -- vim.keymap.set('n', '<leader>vca', function() vim.lsp.buf.code_action() end, opts)
                    -- vim.keymap.set('n', '<leader>vrr', function() vim.lsp.buf.references() end, opts)
                    -- vim.keymap.set('n', '<leader>vrn', function() vim.lsp.buf.rename() end, opts)
                    -- vim.keymap.set('i', '<C-h>', function() vim.lsp.buf.signature_help() end, opts)
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
                    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
                    vim.keymap.set('n', 'gr', vim.lsp.buf.references, { desc = "References" })
                    vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, { desc = "Open diagnostic" })
                    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })
                    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })
                    vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, { desc = "Set diagnostic list" })

                    vim.keymap.set('n', '<space>il', function ()
                        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
                    end, { desc = "Show Inlay Hints" })

                    vim.keymap.set('n', 'gh', "<cmd>ClangdSwitchSourceHeader<CR>", { desc = "Switch between Source and Header" })
                end,
            })
        end
    }
}
