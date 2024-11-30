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
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
    end
  },
  {
    "eldritch-theme/eldritch.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      on_highlights = function(highlights)
        -- highlights["@markup.heading.1.markdown"] = { fg = "#f265b5", bold = true }

        -- Colors gotten by inserting the theme colors on this website and choosing a low percentage: https://www.w3schools.com/colors/colors_picker.asp
        highlights.DiffAdd = { bg = "#067a42", fg = "white" }
        highlights.DiffChange = { bg = "#02697e", fg = "white" }
        highlights.DiffDelete = { bg = "#750a47", fg = "white" }

        highlights["@markup.strong"] = { fg = "#f265b5", bold = true }
        highlights["@markup.italic"] = { fg = "#37f499", bold = true }
        highlights["@markup.strikethrough"] = { fg = "#323449", bold = true }
        highlights["RenderMarkdownInfo"] = { fg = "#4269f5", bold = true }
        highlights["RenderMarkdownQuestion"] = { fg = "#6eaf44", bold = true }
        highlights["RenderMarkdownHint"] = { fg = "#37f499", bold = true }
      end
    },
  }
}
