
-- =========================== Yanking =============================
vim.api.nvim_set_option("clipboard", "unnamedplus")

-- Highlight text when yanking
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight text when yanking",
  callback = function ()
    vim.highlight.on_yank()
  end
})

