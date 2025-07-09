local colors = require("my-functions.colors")

return {
    "eldritch-theme/eldritch.nvim",
    lazy = true,
    name = "eldritch",
    opts = {
        -- Overriding colors globally using a definitions table
        on_colors = function(global_colors)
            -- Define all color overrides in a single table
            local color_definitions = {
                -- https://github.com/eldritch-theme/eldritch.nvim/blob/master/lua/eldritch/colors.lua
                bg = colors["black_background"],
                fg = colors["pure_white"],
                selection = colors["white_light"],
                comment = colors["white_var3"],
                red = colors["red_base"], -- default #f16c75
                orange = colors["orange"], -- default #f7c67f
                yellow = colors["yellow_base"], -- default #f1fc79
                green = colors["green_base"],
                purple = colors["purple"], -- default #a48cf2
                cyan = colors["cyan_base"],
                pink = colors["magenta_base"], -- default #f265b5
                bright_red = colors["red_light"],
                bright_green = colors["green_light"],
                bright_yellow = colors["yellow_light"],
                bright_blue = colors["blue_light"],
                bright_magenta = colors["magenta_light"],
                bright_cyan = colors["cyan_light"],
                bright_white = colors["white_light"],
                menu = colors["black_background"],
                visual = colors["white_light"],
                gutter_fg = colors["white_light"],
                nontext = colors["white_light"],
                white = colors["pure_white"],
                black = colors["black_base"],
                git = {
                    change = colors["cyan_base"],
                    add = colors["green_base"],
                    delete = colors["red_base"],
                },
                gitSigns = {
                    change = colors["cyan_base"],
                    add = colors["green_base"],
                    delete = colors["red_base"],
                },
                bg_dark = colors["black_background"],
                -- Lualine line across
                bg_highlight = colors["black_background"],
                terminal_black = colors["black_background"],
                fg_dark = colors["pure_white"],
                fg_gutter = colors["black_var2"],
                dark3 = colors["black_background"],
                dark5 = colors["black_background"],
                bg_visual = colors["white_light"],
                dark_cyan = colors["cyan_dark"],
                magenta = colors["magenta_base"],
                magenta2 = colors["magenta_light"],
                magenta3 = colors["magenta_dark"],
                dark_yellow = colors["yellow_dark"],
                dark_green = colors["green_dark"],
            }

            -- Apply each color definition to global_colors
            for key, value in pairs(color_definitions) do
                global_colors[key] = value
            end
        end,

        -- This function is found in the documentation
        on_highlights = function(highlights)
            local highlight_definitions = {
                -- Makes background transparent
                Normal = { bg = "none" },
                NormalFloat = { bg = "none" },

                -- nvim-spectre or grug-far.nvim highlight colors
                DiffChange = { bg = colors["cyan_base"], fg = "black" },
                DiffDelete = { bg = colors["red_base"], fg = "black" },
                DiffAdd = { bg = colors["green_base"], fg = "black" },
                TelescopeResultsDiffDelete = { bg = colors["magenta_light"], fg = "black" },

                -- horizontal line that goes across where cursor is
                CursorLine = { bg = colors["black_var2"] },

                -- Set cursor color, these will be called by the "guicursor" option in
                -- the options.lua file, which will be used by neovide
                Cursor = { bg = colors["green_base"] },
                lCursor = { bg = colors["green_base"] },
                CursorIM = { bg = colors["green_base"] },

                -- I do the line below to change the color of bold text
                ["@markup.strong"] = { fg = colors["magenta_base"], bold = true },
                ["@markup.italic"] = { fg = colors["green_base"], italic = true },


                -- Inline code in markdown
                ["@markup.raw.markdown_inline"] = { fg = colors["yellow_base"] },

                -- Change the spell underline color
                SpellBad = { sp = colors["red_light"], undercurl = true, bold = true, italic = true },
                SpellCap = { sp = colors["yellow_light"], undercurl = true, bold = true, italic = true },
                SpellLocal = { sp = colors["yellow_light"], undercurl = true, bold = true, italic = true },
                SpellRare = { sp = colors["blue_base"], undercurl = true, bold = true, italic = true },

                -- Codeblocks for the render-markdown plugin
                RenderMarkdownCode = { bg = colors["black_var1"] },

                DiagnosticInfo = { fg = colors["blue_base"] },
                DiagnosticHint = { fg = colors["magenta_light"] },
                DiagnosticWarn = { fg = colors["yellow_light"] },
                DiagnosticOk = { fg = colors["green_base"] },
                DiagnosticError = { fg = colors["red_light"] },
                RenderMarkdownQuote = { fg = colors["yellow_light"] },

                -- visual mode selection
                Visual = { bg = colors["white_light"], fg = colors["black_base"] },
                PreProc = { fg = colors["green_dark"] },
                ["@operator"] = { fg = colors["green_base"] },

                TelescopeNormal = { fg = colors["pure_white"], bg = colors["black_background"] },
                TelescopeMultiSelection = { fg = colors["green_base"], bg = colors["black_base"] },
                TelescopeSelection = { fg = colors["pure_white"], bg = colors["black_light"] },

                LspInlayHint = { fg = colors["white_var3"]},
            }

            -- Apply all highlight definitions at once
            for group, props in pairs(highlight_definitions) do
                highlights[group] = props
            end

            local color_fg = colors["black_background"]
            if vim.g.md_heading_bg == "transparent" then
                vim.cmd(
                    string.format([[highlight Headline1Bg cterm=bold gui=bold guibg=%s guifg=%s]], color_fg, colors["blue_dark"])
                )
                vim.cmd(
                    string.format([[highlight Headline2Bg cterm=bold gui=bold guibg=%s guifg=%s]], color_fg, colors["green_dark"])
                )
                vim.cmd(
                    string.format([[highlight Headline3Bg cterm=bold gui=bold guibg=%s guifg=%s]], color_fg, colors["magenta_dark"])
                )
                vim.cmd(
                    string.format([[highlight Headline4Bg cterm=bold gui=bold guibg=%s guifg=%s]], color_fg, colors["red_dark"])
                )
                vim.cmd(
                    string.format([[highlight Headline5Bg cterm=bold gui=bold guibg=%s guifg=%s]], color_fg, colors["yellow_dark"])
                )
                vim.cmd(
                    string.format([[highlight Headline6Bg cterm=bold gui=bold guibg=%s guifg=%s]], color_fg, colors["cyan_dark"])
                )
            else
                color_fg = colors["black_base"]
                vim.cmd(
                    string.format([[highlight Headline1Bg cterm=bold gui=bold guifg=%s guibg=%s]], color_fg, colors["blue_dark"])
                )
                vim.cmd(
                    string.format([[highlight Headline2Bg cterm=bold gui=bold guifg=%s guibg=%s]], color_fg, colors["green_dark"])
                )
                vim.cmd(
                    string.format([[highlight Headline3Bg cterm=bold gui=bold guifg=%s guibg=%s]], color_fg, colors["magenta_dark"])
                )
                vim.cmd(
                    string.format([[highlight Headline4Bg cterm=bold gui=bold guifg=%s guibg=%s]], color_fg, colors["red_dark"])
                )
                vim.cmd(
                    string.format([[highlight Headline5Bg cterm=bold gui=bold guifg=%s guibg=%s]], color_fg, colors["yellow_dark"])
                )
                vim.cmd(
                    string.format([[highlight Headline6Bg cterm=bold gui=bold guifg=%s guibg=%s]], color_fg, colors["cyan_dark"])
                )
            end

        end,
    },
}
