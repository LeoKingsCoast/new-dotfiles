return{
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    opts = {},
  config = function()
    local highlight = {
      "RainbowRed",
      "RainbowYellow",
      "RainbowBlue",
      "RainbowOrange",
      "RainbowGreen",
      "RainbowViolet",
      "RainbowCyan",
    }

    local hooks = require "ibl.hooks"
    -- create the highlight groups in the highlight setup hook, so they are reset
    -- every time the colorscheme changes
    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#e9969d" })
      vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#eacc95" })
      vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#8bc4f4" })
      vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#dcb189" })
      vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#aed095" })
      vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#d499e6" })
      vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#a1d6dd" })
    end)

    require("ibl").setup { indent = { highlight = highlight } }
  end
}
