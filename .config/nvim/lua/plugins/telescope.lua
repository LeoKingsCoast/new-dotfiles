return {
  {
    'nvim-telescope/telescope.nvim',
    branch = 'master',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
      { "LinArcX/telescope-env.nvim" },
    },

    config = function()
      local telescope = require("telescope");
      telescope.setup({
        defaults = {
          path_displays = "smart",
          sorting_strategy = "ascending",
          borderchars = { "─", "│", "", "", "", "", "", "" },
          layout_config = {
            width = 0.99,
            height = 0.99,
            prompt_position = "top",
          },
        },

        extensions = {
          fzf = {},
        }
      })

      telescope.load_extension('fzf')
      telescope.load_extension('env')

      local builtin = require('telescope.builtin')

      vim.keymap.set('n', '<leader>ff', builtin.find_files,
      { desc = "Find files" })

      vim.keymap.set('n', '<leader>fh', builtin.help_tags,
      { desc = "Help tags" })

      vim.keymap.set('n', '<leader>fk', builtin.keymaps,
      { desc = "Find Keymaps" })

      vim.keymap.set('n', '<leader>fp', builtin.planets,
      { desc = "Find Planets" })

      vim.keymap.set('n', '<leader>fof', builtin.oldfiles,
      { desc = "Find Old Files" })

      vim.keymap.set('n', '<leader>fm', builtin.man_pages,
      { desc = "Find Manpages" })

      vim.keymap.set('n', '<leader>fr', builtin.registers,
      { desc = "Find Registers" })

      vim.keymap.set('n', '<leader>fc', builtin.colorscheme,
      { desc = "Find Colorscheme" })

      vim.keymap.set('n', '<leader>fgs', builtin.git_status,
      { desc = "Git Status?" })

      vim.keymap.set('n', '<leader>fgc', builtin.git_commits,
      { desc = "Find Commit" })

      vim.keymap.set('n', '<leader>fgbc', builtin.git_bcommits,
      { desc = "Find Buffer Commit" })

      vim.keymap.set('n', '<leader>fgbr', builtin.git_bcommits,
      { desc = "Find Git Branch" })

      vim.keymap.set('n', '<leader>fs', function ()
        builtin.grep_string({ search = vim.fn.input("Grep > ") })
      end, { desc = "Find string" })

      vim.keymap.set('n', '<leader>fe', "<cmd>Telescope env<cr>",
      { desc = "Find Env Variables" })
    end
  },
}
