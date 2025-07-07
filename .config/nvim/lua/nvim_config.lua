-- ╔═════════════════════════════════════════════════════════════════════════╗
-- ║                           Neovim Configuration                          ║
-- ╠═══════════════════════════╦═════════════════════════════════════════════╝
-- ║ File: lua/nvim_config.lua ║                                            
-- ╚═══════════════════════════╝

-- =============================== Behavior ==================================

-- Set tab configuration
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

-- Set automatic indentation
vim.opt.smartindent = true

-- Highlight search
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Set true colors
vim.opt.termguicolors = true

-- File behavior
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

-- Set conceal level for obsidian nvim
vim.opt.conceallevel = 1

-- Scrolling never goes beyond 8 characters
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

-- ================================ Yanking ==================================

-- Share register with the clipboard
vim.api.nvim_set_option("clipboard", "unnamedplus")

-- Highlight text when yanking
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight text when yanking",
  callback = function ()
    vim.highlight.on_yank()
  end
})

-- ============================== Appearance =================================

-- Setup line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- Set line number colors
vim.api.nvim_set_hl(0, "Normal", { bg = "none"})
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none"})

local colors = require("my-functions.colors")
vim.api.nvim_set_hl(0, "LineNrAbove", { fg=colors["blue_base"], bold=false })
vim.api.nvim_set_hl(0, "LineNr", { fg=colors["pure_white"], bold=true })
vim.api.nvim_set_hl(0, "LineNrBelow", { fg=colors["magenta_base"], bold=false })

-- Activate vertical bar on 78 characters
vim.opt.colorcolumn = "78"
