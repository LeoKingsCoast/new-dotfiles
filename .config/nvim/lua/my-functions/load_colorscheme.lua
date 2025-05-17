local load_colorscheme = function (colorscheme)
  colorscheme = colorscheme or "eldritch"
  local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
  if not status_ok then
    vim.notify("colorscheme " .. colorscheme .. " not found!")
    return
  end
end

return load_colorscheme
