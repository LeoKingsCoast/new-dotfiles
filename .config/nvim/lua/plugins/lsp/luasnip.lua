return {
  "L3MON4D3/LuaSnip",
  -- follow latest release.
  version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
  -- install jsregexp (optional!).
  build = "make install_jsregexp",

  config = function ()
    require("plugins.lsp.snippets.lua_snippets")
    require("plugins.lsp.snippets.markdown_snippets")
    require("plugins.lsp.snippets.c_snippets")
  end
}
