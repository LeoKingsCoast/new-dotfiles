return {
    {
        'nvim-telescope/telescope.nvim',
        branch = 'master',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find files" })
            vim.keymap.set('n', '<leader>fg', function ()
                builtin.grep_string({ search = vim.fn.input("Grep > ") })
            end, { desc = "Find grep" })
            vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Find buffers" })
            vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "Help tags" })
        end
    },
}
