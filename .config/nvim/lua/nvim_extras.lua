local open_daily_note = require("my-functions.daily-notes")

-- HACK: Open your daily note in Neovim with a single keymap
-- https://youtu.be/W3hgsMoUcqo
--
-- Keymap to switch to the daily note or create it if it does not exist
vim.keymap.set("n", "<leader>od", function()
  local current_line = vim.api.nvim_get_current_line()
  local date_line = current_line:match("%d+%-%d+%-%d+%-%w") or (os.date("%y-%m-%d-%a"))
  open_daily_note(date_line)
end, { desc = "Go to or create daily note" })

