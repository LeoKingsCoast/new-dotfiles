require("nvim_config")

-- Config lazy must run after nvim_config to have termguicolors set, but must
-- come before nvim_keymaps and nvim_extras, because they use the <leader>
-- keymap
require("config.lazy")
require("my-functions.load_colorscheme")()

require("nvim_keymaps")
require("nvim_extras")

