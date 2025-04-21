local ls = require("luasnip")

-- local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local extras = require("luasnip.extras")
local rep = extras.rep

-- Add prefix ";" to each one of my snippets using the extend_decorator
-- I use this in combination with blink.cmp. This way I don't have to use
-- the transform_items function in blink.cmp that removes the ";" at the
-- beginning of each snippet. I added this because snippets that start with
-- a symbol like ```bash aren't having their ";" removed
-- https://github.com/L3MON4D3/LuaSnip/discussions/895
-- NOTE: THis extend_decorator works great, but I also tried to add the ";"
-- prefix to all of the snippets loaded from friendly-snippets, but I was
-- unable to do so, so I still have to use the transform_items in blink.cmp
local extend_decorator = require("luasnip.util.extend_decorator")
-- Create trigger transformation function
local function auto_semicolon(context)
  if type(context) == "string" then
    return { trig = ";" .. context }
  end
  return vim.tbl_extend("keep", { trig = ";" .. context.trig }, context)
end
-- Register and apply decorator properly
extend_decorator.register(ls.s, {
  arg_indx = 1,
  extend = function(original)
    return auto_semicolon(original)
  end,
})
local s = extend_decorator.apply(ls.s, {})

ls.add_snippets("lua", {
  s("hello", {
    t('print("hello world")')
  })
})

ls.add_snippets("lua", {
  s("p", {
    t('print("'), i(1), t(': " .. '), rep(1), t(')')
  })
})
