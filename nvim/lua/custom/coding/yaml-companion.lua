return {
  'someone-stole-my-name/yaml-companion.nvim',
  event = 'BufEnter',
  opts = {
    lspconfig = {
      settings = {
        yaml = {
          validate = true,
          schemaStore = {
            enable = false,
            url = '',
          },
          schemas = {},
        },
      },
    },
    config = function()
      require('telescope').load_extension 'yaml_schema'
    end,
    keys = {
      {
        '<leader>cls',
        function()
          require('yaml-companion').open_ui_select()
        end,
        mode = 'n',
        desc = '[C]ode [L]SP select [S]chema',
      },
    },
  },
}
