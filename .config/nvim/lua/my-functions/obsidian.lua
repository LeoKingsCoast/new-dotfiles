local M = {}

-- Configuration
local vault_location = os.getenv("VAULT_DIR") or "documents/vault" -- Vault path relative to $HOME directory
local notes_dir = os.getenv("NOTES_DIR") or (vault_location .. "/notes")

-- Optional, customize how note IDs are generated given an optional title.
---@param title string|?
---@return string
local create_note_name = function(title)
  -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
  -- In this case a note with the title 'My new note' will be given an ID that looks
  -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'

  local file_name
  if title ~= nil then
    -- If title is given, transform it into valid file name.
    file_name = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
  else
    -- If title is nil, just add 4 random uppercase letters to the suffix.
    for _ = 1, 4 do
      file_name = string.char(math.random(65, 90))
    end
  end
  return file_name .. ".md"
end

---@param destructive? boolean
local fill_with_template = function (title, destructive)
  local cur_line = vim.api.nvim_buf_line_count(0)
  if destructive then
    cur_line = 0
  end

  local lines = {
    "---",
    "title: " .. title,
    "---",
    "",
    "# " .. title,
  }

  vim.api.nvim_buf_set_lines(0, cur_line, -1, false, lines)
end

M.create_note = function (name)
  local file_name = create_note_name(name)
  local file_path = string.format("%s/%s", notes_dir, file_name)

  -- Ensure the directory exists
  vim.fn.mkdir(notes_dir, "p")

  -- Check if the file exists and create it if it doesn't
  if vim.fn.filereadable(file_path) == 0 then
    local file = io.open(file_path, "w")
    if file then
      vim.cmd("edit " .. vim.fn.fnameescape(file_path))
      fill_with_template(name, true)
      vim.api.nvim_echo({
        { "CREATED NOTE\n", "WarningMsg" },
        { file_path, "WarningMsg" },
      }, false, {})
    else
      print("Failed to create file: " .. file_path)
    end
  else
    print("File already exists: " .. file_path)
  end
end

-- parse date line and generate file path components for the daily note
local function parse_date_line(date_line)
  local year, month, day, weekday = date_line:match("(%d+)%-(%d+)%-(%d+)%-(%w+)")
  if not (year and month and day and weekday) then
    print("No valid date found in the line")
    return nil
  end
  -- month abbreviation
  local title = os.date("%d of %B, %Y", os.time({ year = year + 2000, month = month, day = day }))
  local note_dir = string.format("%s/dailies", vault_location)
  local note_name = string.format("%s-%s-%s-%s.md", year, month, day, weekday)
  return note_dir, note_name, title
end

-- get the full path of the daily note
local function get_daily_note_path(date_line)
  local note_dir, note_name, _ = parse_date_line(date_line)
  if not note_dir or not note_name then
    return nil
  end
  return note_dir .. "/" .. note_name
end

-- Updated create_daily_note function using helper functions
-- Create or find a daily note based on a date line format and open it in Neovim
-- This is used in obsidian markdown files that have the "Link to non-existent
-- document" warning
local function create_daily_note(date_line)
  local full_path = get_daily_note_path(date_line)
  if not full_path then
    return
  end
  local note_dir = full_path:match("(.*/)") -- Extract directory path from full path
  -- Ensure the directory exists
  vim.fn.mkdir(note_dir, "p")
  -- Check if the file exists and create it if it doesn't
  if vim.fn.filereadable(full_path) == 0 then
    local file = io.open(full_path, "w")
    if file then
      local _, _, title = parse_date_line(date_line)
      local lines = {
        "---",
        "id: " .. date_line,
        "alisases: " .. title,
        "tags: ",
        "  - daily-notes",
        "---",
        "",
        "# " .. title,
        "",
        "## Tasks",
        "",
        "- [ ] Anki"
      }
      file:close()
      vim.cmd("edit " .. vim.fn.fnameescape(full_path))
      vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
      vim.cmd("w")
      vim.api.nvim_echo({
        { "CREATED DAILY NOTE\n", "WarningMsg" },
        { full_path, "WarningMsg" },
      }, false, {})
    else
      print("Failed to create file: " .. full_path)
    end
  else
    print("Daily note already exists: " .. full_path)
  end
end

M.markdown_link = function (str, link)
  local bufnr = vim.api.nvim_get_current_buf()

  -- yank visual selection into register z (runs while selection is active)
  vim.cmd('normal! "zy')

  -- get the selected text from register z
  local text = vim.fn.getreg('z')
  text = text:gsub('\n+$', '')      -- trim trailing newlines
  text = text:gsub('%]', '\\]')     -- escape closing bracket in text

  local url = vim.fn.getreg('+')
  if url == '' then
    url = vim.fn.getreg('"')
  end

  url = url:gsub('%s+$', '') -- trim trailing newlines/spaces

  if url:find('%s') then
    url = '<' .. url .. '>'
  end

  local visual = {
    start_pos = vim.fn.getpos("'<"),
    end_pos = vim.fn.getpos("'>"),
  }

  local position = {
    start_row = visual.start_pos[2] - 1,
    start_col = visual.start_pos[3] - 1,
    end_row = visual.end_pos[2] - 1,
    end_col = visual.end_pos[3],
  }

  local replacement = string.format("[%s](%s)", text, url)

  vim.api.nvim_buf_set_text(bufnr, position.start_row, position.start_col, position.end_row, position.end_col, { replacement })
end

-- Function to switch to the daily note or create it if it does not exist
-- Example:
--  switch_to_daily_note("25-05-18-Sun")
M.switch_to_daily_note = function(date_line)
  local full_path = get_daily_note_path(date_line)
  if not full_path then
    return
  end
  create_daily_note(date_line)
  vim.cmd("edit " .. vim.fn.fnameescape(full_path))
end

return M
