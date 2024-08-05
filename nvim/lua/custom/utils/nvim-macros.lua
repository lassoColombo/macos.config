return {
  'kr40/nvim-macros',
  cmd = { 'MacroSave', 'MacroYank', 'MacroSelect', 'MacroDelete' },
  init = function()
    require('which-key').add {
      {
        { '<leader>m', group = '[M]@cros manager' },
        { '<leader>m_', hidden = true },
      },
    }
  end,
  opts = {
    json_file_path = vim.fs.normalize(vim.fn.stdpath 'config' .. '/macros.json'), -- Location where the macros will be stored
    default_macro_register = 'q', -- Use as default register for :MacroYank and :MacroSave and :MacroSelect Raw functions
    json_formatter = 'none', -- can be "none" | "jq" | "yq" used to pretty print the json file (jq or yq must be installed!)
  },
  keys = {
    {
      '<leader>mw',
      '<cmd>MacroSave<cr>',
      mode = 'n',
      desc = '[M]@cro [S]ave',
    },
    {
      '<leader>ms',
      '<cmd>MacroSelect<cr>',
      mode = 'n',
      desc = '[M]@cro [S]elect',
    },
    {
      '<leader>my',
      '<cmd>MacroYank<cr>',
      mode = 'n',
      desc = '[M]@cro [Y]ank',
    },
    {
      '<leader>md',
      '<cmd>MacroDelete<cr>',
      mode = 'n',
      desc = '[M]@cro [D]elete',
    },
  },
}
