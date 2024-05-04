return {
  'sindrets/diffview.nvim',
  event = 'VeryLazy',
  keys = {
    -- :TODO: create keymap to toggle between diffview open and close
    { '<leader>gd', '<cmd>DiffviewOpen<cr>', desc = '[G]it open [D]iff' },
    { '<leader>gD', '<cmd>DiffviewClose<cr>', desc = '[G]it close [D]iff' },
    { '<leader>gh', '<cmd>DiffviewFileHistory<cr>', desc = '[G]it [H]istory' },
  },
  opts = {},
}
