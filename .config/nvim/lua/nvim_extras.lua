local obsidian = require("my-functions.obsidian")

-- Keymap to switch to the daily note or create it if it does not exist
vim.keymap.set("n", "<leader>od", function()
  local current_line = vim.api.nvim_get_current_line()
  local date_line = current_line:match("%d+%-%d+%-%d+%-%w") or (os.date("%y-%m-%d-%a"))
  obsidian.switch_to_daily_note(date_line)
end, { desc = "Go to or create daily note" })

vim.keymap.set("n", "<leader>on", function ()
  local input = vim.fn.input("New note title: ")
  obsidian.create_note(input)
end, { desc = "Create New Note"} )

-- Create markdown links from clipboard
vim.keymap.set("v", "<leader>ol", obsidian.markdown_link, { desc = "Create link on selection" })

-- =========================== AUTOCOMMANDS ===============================

local cache_dir = os.getenv("XDG_CACHE_HOME") or (os.getenv("HOME") .. "/.cache")

-- Store vim current directory every time we leave it. This is so that we can
-- have a script to cd the terminal to the nvim directory on exit.
-- See: ~/.zshrc, function nvim()
  vim.api.nvim_create_autocmd("VimLeavePre", {
    callback = function()
      local cwd_file = cache_dir .. "/nvim_last_cwd"
      local cwd = vim.fn.getcwd()
      local f = io.open(cwd_file, "w")
      if f then
        f:write(cwd)
        f:close()
      end
    end,
  })
