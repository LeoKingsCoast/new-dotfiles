return{
  {
    'uloco/bluloco.nvim',
    lazy = false,
    priority = 1000,
    dependencies = { 'rktjmp/lush.nvim' },
    -- your optional config goes here, see below.
  },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  {
    "miikanissi/modus-themes.nvim",
    priority = 1000,
    config = function ()
      vim.cmd.colorscheme "modus_vivendi"
    end
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
    end
  }
}
