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
  s(">note", fmt(
    [[
    > [!NOTE]
    > {}
    ]], {i(1)}
  ))
})

ls.add_snippets("markdown", {
  s(">demonstration", fmt(
    [[
    > [!NOTE]- Demonstration
    > {}
    ]], {i(1)}
  ))
})

ls.add_snippets("markdown", {
  s(">seealso", fmt(
    [[
    > [!SEEALSO] See Also
    > {}
    ]], {i(1)}
  ))
})

ls.add_snippets("markdown", {
  s(">faq", fmt(
    [[
    > [!FAQ]
    > {}
    ]], {i(1)}
  ))
})

ls.add_snippets("markdown", {
  s(">tip", fmt(
    [[
    > [!TIP]
    > {}
    ]], {i(1)}
  ))
})

ls.add_snippets("markdown", {
  s(">explanation", fmt(
    [[
    > [!TIP] Explanation
    > {}
    ]], {i(1)}
  ))
})

ls.add_snippets("markdown", {
  s(">hint", fmt(
    [[
    > [!HINT]
    > {}
    ]], {i(1)}
  ))
})

ls.add_snippets("markdown", {
  s(">important", fmt(
    [[
    > [!IMPORTANT]
    > {}
    ]], {i(1)}
  ))
})

ls.add_snippets("markdown", {
  s(">key_point", fmt(
    [[
    > [!IMPORTANT] Key Point
    > {}
    ]], {i(1)}
  ))
})

ls.add_snippets("markdown", {
  s(">warning", fmt(
    [[
    > [!WARNING]
    > {}
    ]], {i(1)}
  ))
})

ls.add_snippets("markdown", {
  s(">caution", fmt(
    [[
    > [!CAUTION]
    > {}
    ]], {i(1)}
  ))
})

ls.add_snippets("markdown", {
  s(">attention", fmt(
    [[
    > [!ATTENTION]
    > {}
    ]], {i(1)}
  ))
})

ls.add_snippets("markdown", {
  s(">abstract", fmt(
    [[
    > [!ABSTRACT]
    > {}
    ]], {i(1)}
  ))
})

ls.add_snippets("markdown", {
  s(">summary", fmt(
    [[
    > [!SUMMARY]
    > {}
    ]], {i(1)}
  ))
})

ls.add_snippets("markdown", {
  s(">tldr", fmt(
    [[
    > [!TLDR]
    > {}
    ]], {i(1)}
  ))
})

ls.add_snippets("markdown", {
  s(">info", fmt(
    [[
    > [!INFO]
    > {}
    ]], {i(1)}
  ))
})

ls.add_snippets("markdown", {
  s(">todo", fmt(
    [[
    > [!TODO]
    > {}
    ]], {i(1)}
  ))
})

ls.add_snippets("markdown", {
  s(">success", fmt(
    [[
    > [!SUCCESS]
    > {}
    ]], {i(1)}
  ))
})

ls.add_snippets("markdown", {
  s(">check", fmt(
    [[
    > [!CHECK]
    > {}
    ]], {i(1)}
  ))
})

ls.add_snippets("markdown", {
  s(">done", fmt(
    [[
    > [!DONE]
    > {}
    ]], {i(1)}
  ))
})

ls.add_snippets("markdown", {
  s(">question", fmt(
    [[
    > [!QUESTION]
    > {}
    ]], {i(1)}
  ))
})

ls.add_snippets("markdown", {
  s(">help", fmt(
    [[
    > [!HELP]
    > {}
    ]], {i(1)}
  ))
})

ls.add_snippets("markdown", {
  s(">failure", fmt(
    [[
    > [!FAILURE]
    > {}
    ]], {i(1)}
  ))
})

ls.add_snippets("markdown", {
  s(">missing", fmt(
    [[
    > [!MISSING]
    > {}
    ]], {i(1)}
  ))
})

ls.add_snippets("markdown", {
  s(">danger", fmt(
    [[
    > [!DANGER]
    > {}
    ]], {i(1)}
  ))
})

ls.add_snippets("markdown", {
  s(">error", fmt(
    [[
    > [!ERROR]
    > {}
    ]], {i(1)}
  ))
})

ls.add_snippets("markdown", {
  s(">bug", fmt(
    [[
    > [!BUG]
    > {}
    ]], {i(1)}
  ))
})

ls.add_snippets("markdown", {
  s(">example", fmt(
    [[
    > [!EXAMPLE]
    > {}
    ]], {i(1)}
  ))
})

ls.add_snippets("markdown", {
  s(">quote", fmt(
    [[
    > [!QUOTE]
    > {}
    ]], {i(1)}
  ))
})

ls.add_snippets("markdown", {
  s(">cite", fmt(
    [[
    > [!CITE]
    > {}
    ]], {i(1)}
  ))
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
  s("cpp", fmt(
    [[
    ```cpp
    {}
    ```
    ]], {i(1)}
  ))
})

ls.add_snippets("markdown", {
  s("make", fmt(
    [[
    ```make
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
    \vec{{\mathbf{{{}}}}}
    ]], {i(1)}
  ))
})

ls.add_snippets("markdown", {
  s("univector",fmt(
    [[
    \hat{{\mathbf{{{}}}}}
    ]], {i(1)}
  ))
})

ls.add_snippets("markdown", {
  s("cos",fmt(
    [[
    \cos{{{}}}
    ]], {i(1)}
  ))
})

ls.add_snippets("markdown", {
  s("sin",fmt(
    [[
    \sin{{{}}}
    ]], {i(1)}
  ))
})

ls.add_snippets("markdown", {
  s("tan",fmt(
    [[
    \tan{{{}}}
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
  s("boxed",fmt(
    [[
    \boxed{{{}}}
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
  s("log",fmt(
    [[
    \log{{{}}}
    ]], {i(1)}
  ))
})

ls.add_snippets("markdown", {
  s("ln",fmt(
    [[
    \ln{{{}}}
    ]], {i(1)}
  ))
})

ls.add_snippets("markdown", {
  s("derivative",fmt(
    [[
    \frac{{d{}}}{{d{}}}
    ]], {i(1), i(0)}
  ))
})

ls.add_snippets("markdown", {
  s("partialder",fmt(
    [[
    \frac{{\partial{}}}{{\partial{}}}
    ]], {i(1), i(0)}
  ))
})

ls.add_snippets("markdown", {
  s("integral",fmt(
    [[
    \int_{{{}}}^{{{}}} {}
    ]], {i(1), i(2), i(0)}
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

-- ================= LATEX ====================

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
    t('\\vec{\\mathbf{\\nabla}}')
  })
})

ls.add_snippets("markdown", {
  s("divergent", {
    t('\\vec{\\mathbf{\\nabla}} \\cdot')
  })
})

ls.add_snippets("markdown", {
  s("rot", {
    t('\\vec{\\mathbf{\\nabla}} \\times ')
  })
})

ls.add_snippets("markdown", {
  s("curl", {
    t('\\vec{\\mathbf{\\nabla}} \\times ')
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
  s("approx", {
    t('\\approx')
  })
})

ls.add_snippets("markdown", {
  s("infinity", {
    t('\\infty')
  })
})

ls.add_snippets("markdown", {
  s("Rightarrow", {
    t('\\Rightarrow')
  })
})

