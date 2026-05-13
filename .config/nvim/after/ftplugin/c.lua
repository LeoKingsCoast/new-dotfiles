vim.opt_local.tabstop = 4
vim.opt_local.shiftwidth = 4
vim.opt_local.expandtab = true
vim.opt_local.indentexpr = ""
vim.opt_local.cindent = true
vim.opt_local.cinoptions = ':0,l1,g0,(0,W4,m1'

vim.opt_local.makeprg = "gcc -o prog %"

local function compile_c_project(opts)
  local target = ""
  if opts then
    target = opts.args
  end

  local build_script = os.getenv("SCRIPTS_DIR") .. "/send-commands-to-build"
  local cmd = "make " .. target

  vim.system({build_script, cmd}, { text = true }, function (obj)
    if obj.code ~= 0 then
      vim.notify(obj.stderr, vim.log.levels.ERROR)
    end
  end)
end

vim.api.nvim_create_user_command("Make", function(opts)
  compile_c_project(opts)
end, {
  nargs = "*"
})

local group = vim.api.nvim_create_augroup("CompileCProject", { clear = true })

vim.api.nvim_create_autocmd({'BufWritePost'}, {
  group = group,
  pattern =  {'*.c', '*.h'},

  callback =  function ()
    compile_c_project()
  end
})
