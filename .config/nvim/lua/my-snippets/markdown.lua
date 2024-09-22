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
  s("alpha", {
    t('\\alpha')
  })
})

ls.add_snippets("markdown", {
  s("beta", {
    t('\\beta')
  })
})

ls.add_snippets("markdown", {
  s("gamma", {
    t('\\gamma')
  })
})

ls.add_snippets("markdown", {
  s("Gamma", {
    t('\\Gamma')
  })
})

ls.add_snippets("markdown", {
  s("delta", {
    t('\\delta')
  })
})

ls.add_snippets("markdown", {
  s("Delta", {
    t('\\Delta')
  })
})

ls.add_snippets("markdown", {
  s("eta", {
    t('\\eta')
  })
})

ls.add_snippets("markdown", {
  s("epsilon", {
    t('\\epsilon')
  })
})

ls.add_snippets("markdown", {
  s("varepsilon", {
    t('\\varepsilon')
  })
})

ls.add_snippets("markdown", {
  s("mu", {
    t('\\mu')
  })
})

ls.add_snippets("markdown", {
  s("sigma", {
    t('\\sigma')
  })
})

ls.add_snippets("markdown", {
  s("Sigma", {
    t('\\Sigma')
  })
})

ls.add_snippets("markdown", {
  s("pi", {
    t('\\pi')
  })
})

ls.add_snippets("markdown", {
  s("rho", {
    t('\\rho')
  })
})

ls.add_snippets("markdown", {
  s("theta", {
    t('\\theta')
  })
})

ls.add_snippets("markdown", {
  s("zeta", {
    t('\\zeta')
  })
})

ls.add_snippets("markdown", {
  s("kappa", {
    t('\\kappa')
  })
})

ls.add_snippets("markdown", {
  s("lambda", {
    t('\\lambda')
  })
})

ls.add_snippets("markdown", {
  s("Lambda", {
    t('\\Lambda')
  })
})

ls.add_snippets("markdown", {
  s("phi", {
    t('\\phi')
  })
})

ls.add_snippets("markdown", {
  s("omega", {
    t('\\omega')
  })
})

ls.add_snippets("markdown", {
  s("Omega", {
    t('\\Omega')
  })
})

ls.add_snippets("markdown", {
  s("tau", {
    t('\\tau')
  })
})

ls.add_snippets("markdown", {
  s("upsilon", {
    t('\\upsilon')
  })
})

ls.add_snippets("markdown", {
  s("psi", {
    t('\\psi')
  })
})

ls.add_snippets("markdown", {
  s("chi", {
    t('\\chi')
  })
})

ls.add_snippets("markdown", {
  s("nabla", {
    t('\\nabla')
  })
})

ls.add_snippets("markdown", {
  s("partial", {
    t('\\partial')
  })
})

ls.add_snippets("markdown", {
  s("cdot", {
    t('\\cdot')
  })
})

ls.add_snippets("markdown", {
  s("times", {
    t('\\times')
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
  s("text",fmt(
    [[
    \text{{{}}}
    ]], {i(1)}
  ))
})

ls.add_snippets("markdown", {
  s("sqrt",fmt(
    [[
    \sqrt{{{}}}
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

