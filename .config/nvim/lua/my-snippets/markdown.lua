-- luasnip.lua

local ls = require "luasnip"
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("markdown", {
  s("hello", {
    t('print("hello world)')
  })
})

ls.add_snippets("markdown", {
  s("bash", {
    t('```bash'),
    t({ "" , "" }), i(1),
    t({ "", '```'})
  })
})

ls.add_snippets("markdown", {
  s("ccode", fmt(
    [[
    ```c
    {}
    ```
    ]], {i(1)}
  ))
})

ls.add_snippets("markdown", {
  s("python", fmt(
    [[
    ```python
    {}
    ```
    ]], {i(1)}
  ))
})

-- ls.add_snippets("markdown", {
--   s("frac", {
--     t("\\frac{"), i(1), t("}{"), i(0), t("}")
--   })
-- })

ls.add_snippets("markdown", {
  s("frac",fmt(
    [[
    \frac{{{}}}{{{}}}{}
    ]], {i(1), i(2), i(0)}
  ))
})

ls.add_snippets("markdown", {
  s("equation",fmt(
    [[
    ${} $
    ]], {i(1)}
  ))
})

ls.add_snippets("markdown", {
  s("math",fmt(
    [[
    $$
    {}
    $$
    ]], {i(1)}
  ))
})

ls.add_snippets("markdown", {
  s("math-multiline",fmt(
    [[
    $$
    \begin{{aligned}}
    {}
    \end{{aligned}}
    $$
    ]], {i(1)}
  ))
})

ls.add_snippets("markdown", {
  s("subscript",fmt(
    [[
    {}_{{{}}}
    ]], {i(1), i(0)}
  ))
})

ls.add_snippets("markdown", {
  s("power",fmt(
    [[
    {}^{{{}}}
    ]], {i(1), i(0)}
  ))
})

ls.add_snippets("markdown", {
  s("vector",fmt(
    [[
    \vec{{{}}}
    ]], {i(1)}
  ))
})

ls.add_snippets("markdown", {
  s("chem",fmt(
    [[
    $\ce{{{}}}$
    ]], {i(1)}
  ))
})

ls.add_snippets("markdown", {
  s("chem-multi",fmt(
    [[
    $$
    \begin{{aligned}}
    \ce{{{}}}
    \end{{aligned}}
    $$
    ]], {i(1)}
  ))
})

