local M = {}

-- Configuration
local vault_location = "sync/vault" -- Vault path relative to $HOME directory

-- Optional, customize how note IDs are generated given an optional title.
---@param title string|?
---@return string
local create_note_id = function(title)
  -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
  -- In this case a note with the title 'My new note' will be given an ID that looks
  -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
  local id
  if title ~= nil then
    -- If title is given, transform it into valid file name.
    id = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
  else
    -- If title is nil, just add 4 random uppercase letters to the suffix.
    for _ = 1, 4 do
      id = string.char(math.random(65, 90))
    end
  end
  return id .. "-" .. os.date("%y%m%d")
end

-- print(create_note_id("My cool Note"))

-- Optional, customize how note file names are generated given the ID, target directory, and title.
---@param id string?
---@return string
local create_note_file_name = function(id)
  -- This is equivalent to the default behavior.
  local file_name = id
  return file_name .. ".md"
end

---@param destructive? boolean
local fill_with_template = function (title, id, destructive)
  local cur_line = vim.api.nvim_buf_line_count(0)
  if destructive then
    cur_line = 0
  end

  -- local ok, lines = pcall(vim.fn.readfile, template_path)
  -- if not ok then
  --   vim.notify("Failed to read template: " .. template_path, vim.log.levels.ERROR)
  --   return
  -- end

  local lines = {
    "---",
    "id: " .. id,
    "alisases: " .. title,
    "tags: ",
    "---",
    "",
    "# " .. title,
  }

  -- local lines = vim.api.nvim_buf_get_lines(template_path, 0, -1, false)
  vim.api.nvim_buf_set_lines(0, cur_line, -1, false, lines)
end



M.create_note = function (name)
  local id = create_note_id(name)
  local file_name = create_note_file_name(id)
  local destination_path = string.format("%s/%s/%s", os.getenv("HOME"), vault_location, file_name)
  local note_dir = destination_path:match("(.*/)") -- Extract directory path from full path
  -- Ensure the directory exists
  vim.fn.mkdir(note_dir, "p")
  -- Check if the file exists and create it if it doesn't
  if vim.fn.filereadable(destination_path) == 0 then
    local file = io.open(destination_path, "w")
    if file then
      vim.cmd("edit " .. vim.fn.fnameescape(destination_path))
      fill_with_template(name, id, true)
      vim.api.nvim_echo({
        { "CREATED NOTE\n", "WarningMsg" },
        { destination_path, "WarningMsg" },
      }, false, {})
    else
      print("Failed to create file: " .. destination_path)
    end
  else
    print("File already exists: " .. destination_path)
  end
end

-- create_note_from_template("foo", "lua/my-functions/templates.lua")


-- parse date line and generate file path components for the daily note
local function parse_date_line(date_line)
  local home = os.getenv("HOME")
  local year, month, day, weekday = date_line:match("(%d+)%-(%d+)%-(%d+)%-(%w+)")
  if not (year and month and day and weekday) then
    print("No valid date found in the line")
    return nil
  end
  -- month abbreviation
  local title = os.date("%d of %B, %Y", os.time({ year = year + 2000, month = month, day = day }))
  local note_dir = string.format("%s/%s/dailies", home, vault_location)
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
