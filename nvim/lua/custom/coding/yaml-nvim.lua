return {
  'cuducos/yaml.nvim',
  ft = { 'yaml' },
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-telescope/telescope.nvim', -- optional
  },
  opts = function()
    require('which-key').register {
      ['<leader>Y'] = { name = '[Y]aml', _ = 'which_key_ignore' },
      ['<leader>Yy'] = { name = '[Y]aml [Y]ank', _ = 'which_key_ignore' },
    }
  end,
  keys = {
    {
      '<leader>Yv',
      '<cmd>YAMLView<cr>',
      mode = 'n',
      desc = '[Y]aml [V]view path',
      ft = 'yaml',
    },
    {
      '<leader>Yyp',
      '<cmd>YAMLYank<cr>',
      mode = 'n',
      desc = '[Y]aml [Y]ank [P]ath',
      ft = 'yaml',
    },
    {
      '<leader>Yyk',
      '<cmd>YAMLYankKey<cr>',
      mode = 'n',
      desc = '[Y]aml [Y]ank [K]ey',
      ft = 'yaml',
    },
    {
      '<leader>Yyv',
      '<cmd>YAMLYankValue<cr>',
      mode = 'n',
      desc = '[Y]aml [Y]ank [V]alue',
      ft = 'yaml',
    },
    {
      '<leader>Yt',
      '<cmd>YAMLTelescope<cr>',
      mode = 'n',
      desc = '[C]ode [Y]aml [T]elescope',
      ft = 'yaml',
    },
  },
}
