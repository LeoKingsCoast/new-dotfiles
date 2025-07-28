return {
  "danymat/neogen",
  -- config = true,
  -- Uncomment next line if you want to follow only stable versions
  -- version = "*" 
  config = function ()
    require('neogen').setup({ snippet_engine = "luasnip" })

    vim.keymap.set("n", "<leader>nf", function ()
      require('neogen').generate()
    end)
  end
}
