return {
  -- integrations with git
  -- See `:help gitsigns` to understand what the configuration keys do
  { -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    event = 'BufEnter',
    keys = {},
    opts = function()
      local symb = require 'custom.globals.icons'
      return {
        signs = {
          add = { text = symb.git_add_symbol },
          change = { text = symb.git_change_symbol },
          delete = { text = symb.git_delete_symbol },
          topdelete = { text = symb.git_todelete_symbol },
          changedelete = { text = symb.git_changedelete_symbol },
        },
      }
    end,
  },
}
