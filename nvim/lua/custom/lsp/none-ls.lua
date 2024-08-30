return {
  'nvimtools/none-ls.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = {},
  config = function()
    local null_ls = require 'null-ls'
    local sources = {
      null_ls.builtins.code_actions.ts_node_action,
      -- null_ls.builtins.diagnostics.pylint,
      -- already included in ansiblels
      -- null_ls.builtins.diagnostics.ansiblelint,
    }
    null_ls.setup { sources = sources }
  end,
}
