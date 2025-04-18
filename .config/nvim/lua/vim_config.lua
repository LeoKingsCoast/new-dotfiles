-- Setting tabs as 2 spaces
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

-- Setting space as leader key
vim.g.mapleader = " "

vim.api.nvim_set_option("clipboard", "unnamedplus")

-- Setting line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- undotree
vim.o.undofile = true;
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Undotree" })

-- Setting indentation
vim.opt.smartindent = true

-- Wrap lines that are too long
-- vim.opt.wrap = true
-- vim.opt.linebreak = true
-- vim.opt.breakindent = true
-- vim.opt.textwidth = 80
vim.opt.colorcolumn = "80"
vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function()
        -- vim.opt_local.textwidth = 79
        -- vim.opt_local.columns=80
    vim.opt_local.wrap = true
    vim.wo.linebreak = true
    vim.opt.showbreak = ">> "  -- Optional: visually indicate wrapped lines
    end,
})

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

-- highlight search
vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.conceallevel = 1

-- Highlight text when yanking
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight text when yanking",
    callback = function ()
        vim.highlight.on_yank()
    end
})

-- Keymaps --------------------------------

-- vim.keymap.set("n", "J", "<nop>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Move through the QuickFix list
-- Note: <M- > means "Alt"
vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>")
vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>")

vim.keymap.set('n', '<leader>sw', function()
  vim.wo.wrap = true
  vim.wo.linebreak = true
  return '<Cmd>vertical rightbelow new | set winbar="" nonumber norelativenumber<CR><C-w>h<C-w>' .. (vim.v.count ~= 0 and vim.v.count or 100) .. '|'
  end,
{expr = true})


-- File explorer
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Go to file manager" })

-- Ctrl+C for copying to clipboard
vim.keymap.set("v", "<C-c>", "\"+y")


vim.keymap.set("n", "<leader>wd", '<cmd>silent !tmux split-window -dv -l 15; tmux split-window -dh -l 70<CR>', { desc = "Open tmux development setup" })

-- vim.keymap.set('n', '<leader>op', function ()
--   -- cmd = cmd.format("<cmd>ObsidianPasteImg %s", os.time())
--   local obsidian = require("obsidian")
--   require("obsidian.commands.paste_img")(obsidian.get_client(), {fname="aaa"})
--   -- return cmd
-- end)

-- Use <CR> to fold when in normal mode
-- To see help about folds use `:help fold`
vim.keymap.set("n", "<CR>", function()
  -- Get the current line number
  local line = vim.fn.line(".")
  -- Get the fold level of the current line
  local foldlevel = vim.fn.foldlevel(line)
  if foldlevel == 0 then
    vim.notify("No fold found", vim.log.levels.INFO)
  else
    vim.cmd("normal! za")
  end
end, { desc = "[P]Toggle fold" })

