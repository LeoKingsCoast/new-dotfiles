return{
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      local custom_theme = require('lualine.themes.eldritch');
      local colors = require("my-functions.colors")
      custom_theme.normal.b.bg = colors["black_var1"];
      custom_theme.normal.c.bg = colors["black_var1"];
      custom_theme.insert.b.bg = colors["black_var1"];
      custom_theme.visual.b.bg = colors["black_var1"];
      custom_theme.replace.b.bg = colors["black_var1"];
      custom_theme.command.b.bg = colors["black_var1"]
      custom_theme.terminal.b.bg = colors["black_var1"]

      require('lualine').setup({
      options = {
        icons_enabled = true,
        theme = custom_theme,
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        }
      },
      sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {'filename'},
        lualine_x = {
          'encoding',
          'fileformat',
          'filetype',
          -- {
          --   require("noice").api.statusline.mode.get,
          --   cond = require("noice").api.statusline.mode.has,
          --   color = { fg = "#ff9e64" },
          -- }
        },
        lualine_y = {'progress'},
        lualine_z = {'location'}
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {}
      })
    end
}
