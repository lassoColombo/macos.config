return {
  'lassoColombo/rest.nvim',
  ft = 'http',
  dependencies = { 'luarocks.nvim' },
  config = function()
    require('rest-nvim').setup()
  end,
  keys = {
    {
      '<leader><leader>x',
      '<cmd>Rest run<cr>',
      mode = 'n',
      desc = 'e[X]ecute',
      ft = 'http',
    },
    {
      '<leader><leader>e',
      function()
        local pattern = _G._rest_nvim.env_pattern
        local command = string.format("fd -HI '%s'", pattern)
        local result = io.popen(command):read '*a'

        local env_list = {}
        for line in result:gmatch '[^\r\n]+' do
          table.insert(env_list, line)
        end

        local rest_functions = require 'rest-nvim.functions'

        vim.ui.select(env_list, {
          prompt = 'Select env file ',
          format_item = function(item)
            return item
          end,
        }, function(choice)
          if choice == nil then
            return
          end
          rest_functions.env('set', choice)
        end)
      end,
      mode = 'n',
      desc = '[E]nvironment',
      ft = 'http',
    },
  },
}
