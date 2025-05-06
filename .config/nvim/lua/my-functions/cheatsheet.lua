local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

local buf;
local win;
local open_cheatsheets = function (opts)
    local curr_win = vim.api.nvim_get_current_win();
    opts = opts or {
        buf = -1,
        cheatsheet_path = "/home/leore/sync-folder/obsidian/cheatsheets/cheatsheet.md",
        win_config = {
            split = "right",
            win = curr_win,
        }
    }

    -- Get cheatsheet files with telescope
    local filepath;
    require("telescope.builtin").find_files({
        attach_mappings = function (prompt_bufnr, map)
            actions.select_default:replace(function ()
                actions.close(prompt_bufnr)
                local entry = action_state.get_selected_entry()
                filepath = entry.path or entry.value
                buf = vim.fn.bufnr(vim.fn.fnameescape(filepath), true)
                -- vim.cmd("vsplit " .. vim.fn.fnameescape(filepath))
                win = vim.api.nvim_open_win(buf, true, opts.win_config)

                vim.keymap.set("n", "q", function ()
                    vim.api.nvim_win_close(win, true)
                end, {
                        buffer = buf,
                    })
            end)
            return true
        end,
        cwd = "/home/leore/sync-folder/obsidian/cheatsheets/",
    })


end

vim.api.nvim_create_user_command("Cheatsheet", function ()
    open_cheatsheets()
end, {})

vim.keymap.set("n", "<leader>ch", "<cmd>Cheatsheet<CR>")
