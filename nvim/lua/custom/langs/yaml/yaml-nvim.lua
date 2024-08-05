return {
  'cuducos/yaml.nvim',
  ft = { 'yaml', 'yaml.docker-compose', 'yaml.ansible' },
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-telescope/telescope.nvim', -- optional
  },
  opts = function()
    vim.api.nvim_create_autocmd({ 'BufEnter', 'CursorMoved' }, {
      pattern = { '*.yaml', '*.yml' },
      callback = function()
        vim.opt_local.winbar = require('yaml_nvim').get_yaml_key_and_value()
      end,
    })
    return {}
  end,
  keys = {
    {
      '<Space><Space>v',
      function()
        require('yaml_nvim').view()
      end,
      mode = 'n',
      desc = '[Y]aml [V]view path',
      ft = { 'yaml', 'yaml.docker-compose', 'yaml.ansible' },
    },
    {
      '<Space><Space>y',
      '<cmd>YAMLYankKey<cr>',
      mode = 'n',
      desc = '[Y]aml [Y]ank [P]ath',
      ft = { 'yaml', 'yaml.docker-compose', 'yaml.ansible' },
    },
    {
      '<Space><Space>Y',
      '<cmd>YAMLYankKey +<cr>',
      mode = 'n',
      desc = '[Y]aml [Y]ank [P]ath (system clipboard)',
      ft = { 'yaml', 'yaml.docker-compose', 'yaml.ansible' },
    },
    {
      '<Space><Space>t',
      function()
        require('yaml_nvim').telescope()
      end,
      mode = 'n',
      desc = '[C]ode [Y]aml [T]elescope',
      ft = { 'yaml', 'yaml.docker-compose', 'yaml.ansible' },
    },
  },
}
