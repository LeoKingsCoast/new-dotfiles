return {
  "eldritch-theme/eldritch.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    on_colors = function (global_colors)
      local color_definitions = {
        bg = "none",
      }
      for key, value in pairs(color_definitions) do
        global_colors[key] = value
      end
      vim.api.nvim_set_hl(0, "LspInlayHint", { fg = "#9DA9A0" })
    end,
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

    end,
  },
  config = function ()
    vim.cmd.colorscheme "eldritch"
  end,
}
