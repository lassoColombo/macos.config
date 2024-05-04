return {
  'CKolkey/ts-node-action',
  event = 'VimEnter',
  dependencies = { 'nvim-treesitter' },
  opts = function()
    vim.keymap.set('n', '<leader>ctA', require('ts-node-action').available_actions, { desc = '[C]ode [T]reesitter available [A]ctions' })
    vim.keymap.set('n', '<leader>cta', require('ts-node-action').node_action, { desc = '[C]ode [T]reesitter [A]ctions' })
    require('ts-node-action').setup {
      python = require 'custom.treesitter.node-actions.python',
      lua = require 'custom.treesitter.node-actions.lua-actions',
    }
  end,
  -- config = function()
  --   vim.keymap.set('n', '<leader>cta', require('ts-node-action').node_action, { desc = '[C]ode [T]reesitter [A]ctions' })
  -- end,
  setup = {},
}
