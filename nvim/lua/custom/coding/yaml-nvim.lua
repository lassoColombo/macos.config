return {
  'cuducos/yaml.nvim',
  ft = { 'yaml' },
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-telescope/telescope.nvim', -- optional
  },
  opts = function()
    require('which-key').add {
      {
        { '<leader><leader>y', group = '[Y]aml' },
        { '<leader><leader>y_', hidden = true },
      },
    }
    require('which-key').register {
      ['<leader>Y'] = { name = '[Y]aml', _ = 'which_key_ignore' },
    }
  end,
  keys = {
    {
      '<leader>yv',
      '<cmd>YAMLView<cr>',
      mode = 'n',
      desc = '[Y]aml [V]view path',
      ft = 'yaml',
    },
    {
      '<leader>yy',
      '<cmd>YAMLYank<cr>',
      mode = 'n',
      desc = '[Y]aml [Y]ank [P]ath',
      ft = 'yaml',
    },
    {
      '<leader>yt',
      '<cmd>YAMLTelescope<cr>',
      mode = 'n',
      desc = '[C]ode [Y]aml [T]elescope',
      ft = 'yaml',
    },
  },
}
