-- luasnip.lua

local ls = require "luasnip"
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local fmt = require("luasnip.extras.fmt").fmt

local getdate = function ()
  return os.date("%Y-%m-%d")
end

ls.add_snippets("c", {
  s("file", fmt(
    [[
    /***************************************************************************
     *
     * @file {}
     * @brief {}
     *
     * {}
     *
     * @author Leonardo Costa
     * @date {}
     *
     **************************************************************************/
    ]],
    {
      i(1, { "[TODO:filename]" }),
      i(2, { "[TODO:description]"}),
      i(3, { "[TODO(optional):detailed description]"}),
      f(getdate)
    }
  ))
})

ls.add_snippets("c", {
  s("todo", fmt(
    "// TODO(Leo): {}",
    {i(1)}
  ))
})
