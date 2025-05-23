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

