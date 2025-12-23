local trigger_text = ";"

return {
  "saghen/blink.cmp",
  enabled = true,
  -- version = "v0.13.1",
  dependencies = {
    "moyiz/blink-emoji.nvim",
    'rafamadriz/friendly-snippets'
  },
  build = 'cargo build --release',
  opts = function(_, opts)
    -- UNCOMMENT THIS IF TELESCOPE GETS SLOW
    opts.enabled = function()
      -- Get the current buffer's filetype
      local filetype = vim.bo[0].filetype
      -- Disable for Telescope buffers
      if filetype == "TelescopePrompt" or filetype == "minifiles" or filetype == "snacks_picker_input" then
        return false
      end
      return true
    end

    opts.sources = vim.tbl_deep_extend("force", opts.sources or {}, {
      default = { "lsp", "path", "snippets", "buffer", "emoji", },
      providers = {
        lsp = {
          name = "lsp",
          enabled = true,
          module = "blink.cmp.sources.lsp",
          min_keyword_length = 0,
          score_offset = 90, -- the higher the number, the higher the priority
        },
        path = {
          name = "Path",
          module = "blink.cmp.sources.path",
          score_offset = 25,
          -- Don't show snippets or buffer suggestions if there is a path found
          fallbacks = { "snippets", "buffer" },
          -- min_keyword_length = 2,
          opts = {
            trailing_slash = false,
            label_trailing_slash = true,
            get_cwd = function(context)
              return vim.fn.expand(("#%d:p:h"):format(context.bufnr))
            end,
            show_hidden_files_by_default = true,
          },
        },
        buffer = {
          name = "Buffer",
          enabled = true,
          max_items = 3,
          module = "blink.cmp.sources.buffer",
          min_keyword_length = 2,
          score_offset = 15, -- the higher the number, the higher the priority
        },
        snippets = {
          name = "snippets",
          enabled = true,
          max_items = 15,
          min_keyword_length = 1,
          module = "blink.cmp.sources.snippets",
          score_offset = 85, -- the higher the number, the higher the priority
          -- Only show snippets if I type the trigger_text characters, so
          -- to expand the "bash" snippet, if the trigger_text is ";" I have to
        },
        -- https://github.com/moyiz/blink-emoji.nvim
        emoji = {
          module = "blink-emoji",
          name = "Emoji",
          score_offset = 93, -- the higher the number, the higher the priority
          min_keyword_length = 2,
          opts = { insert = true }, -- Insert emoji (default) or complete its name
        },
      },
    })

    opts.cmdline = {
      enabled = true,
    }

    opts.completion = {
      menu = {
        auto_show = true,
        border = "rounded",
      },
      documentation = {
        auto_show = false,
        window = {
          border = "rounded",
        },
      },
      ghost_text = {
        enabled = true,
        -- Show the ghost text when an item has been selected
        -- show_with_selection = true,
        -- Show the ghost text when no item has been selected, defaulting to the first item
        show_without_selection = false,
        -- Show the ghost text when the menu is open
        show_with_menu = true,
        -- Show the ghost text when the menu is closed
        show_without_menu = true,
      }
    }

    opts.snippets = {
      preset = "luasnip", -- Choose LuaSnip as the snippet engine
    }

    -- Keymap configuration
    -- https://cmp.saghen.dev/configuration/keymap.html#default
    opts.keymap = {
      preset = "default",
      ["<Tab>"] = { "snippet_forward", "fallback" },

      ["<S-Tab>"] = { "snippet_backward", "fallback" },
      ["<C-y>"] = { "select_and_accept" },
      ["<C-k>"] = { "show_signature", "hide_signature", "fallback" },

      ["<Up>"] = { "select_prev", "fallback" },
      ["<Down>"] = { "select_next", "fallback" },
      ["<C-p>"] = { "select_prev", "show", "fallback" },
      ["<C-n>"] = { "select_next", "show", "fallback" },

      ["<S-k>"] = { "scroll_documentation_up", "fallback" },
      ["<S-j>"] = { "scroll_documentation_down", "fallback" },

      ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
      ["<C-e>"] = { "hide", "fallback" },
    }

    opts.signature = { enabled = true }

    return opts
  end,
}
