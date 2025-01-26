return{
    'ThePrimeagen/harpoon',
    dependencies = 'nvim-lua/plenary.nvim',
    config = function ()
        local mark = require("harpoon.mark")
        local ui = require("harpoon.ui")
        vim.keymap.set("n", "<leader>ha", function () mark.add_file() print("File added to Harpoon") end, { desc = "Add file to Harpoon" })
        vim.keymap.set("n", "<leader>hu", ui.toggle_quick_menu, { desc = "Open Harpoon UI" })

        vim.keymap.set("n", "<leader>1", function() ui.nav_file(1) end, { desc = "Go Harpoon 1" })
        vim.keymap.set("n", "<leader>2", function() ui.nav_file(2) end, { desc = "Go Harpoon 2" })
        vim.keymap.set("n", "<leader>3", function() ui.nav_file(3) end, { desc = "Go Harpoon 3" })
        vim.keymap.set("n", "<leader>4", function() ui.nav_file(4) end, { desc = "Go Harpoon 4" })
    end
}
