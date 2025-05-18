-- ╔═════════════════════════════════════════════════════════════════════════╗
-- ║                              Neovim Keymaps                             ║
-- ╠════════════════════════════╦════════════════════════════════════════════╝
-- ║ File: lua/nvim_keymaps.lua ║                                            
-- ╚════════════════════════════╝

-- Move lines in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Move through the QuickFix list
-- Note: <M- > means "Alt"
vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<M-q>", "<cmd>cclose<CR>")
vim.keymap.set("n", "<leader>j", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lprev<CR>zz")

-- Stay centered on C-d and C-u
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Press <leader>d to delete without copying to the register
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

-- Needs to be unset here for the hover information config to work in the
-- file plugins/lsp/blink.lua
vim.keymap.set('n', 'K', "<nop>")
