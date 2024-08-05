return{
  -- amongst your other plugins
  'akinsho/toggleterm.nvim', version = "*", opts = {
    --[[ things you want to change go here]]
    size = 20,
    open_mapping = [[<c-\>]],
    hide_numbers = true,
    direction = 'float',
    shading_factor = 2,
    float_opts = {
      border = 'curved',
    },
  }
}
