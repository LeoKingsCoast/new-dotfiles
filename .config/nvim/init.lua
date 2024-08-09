require("vim_config")
require("my-snippets.markdown")
require("config.lazy")

-- Line number colors
vim.api.nvim_set_hl(0, "Normal", { bg = "none"})
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none"})

vim.api.nvim_set_hl(0, "LineNrAbove", { fg='#51B3EC', bold=false })
vim.api.nvim_set_hl(0, "LineNr", { fg='white', bold=true })
vim.api.nvim_set_hl(0, "LineNrBelow", { fg='#FB508F', bold=false })
