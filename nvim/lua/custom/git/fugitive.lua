return {
  'tpope/vim-fugitive',
  keys = {
    { '<leader>gb', '<cmd>Git blame<cr>', desc = '[G]it [B]lame' },
    { '<leader>gL', '<cmd>Git log<cr>', desc = '[G]it [L]og' },
    { '<leader>gs', '<cmd>Git status<cr>', desc = '[G]it [S]tatus' },
    { '<leader>gP', '<cmd>Git push<cr>', desc = '[G]it [P]ush' },
    { '<leader>gp', '<cmd>Git pull<cr>', desc = '[G]it [P]ull' },
  },
  config = function()
    return {}
  end,
}
