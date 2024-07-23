return {
  -- integrations with git
  -- See `:help gitsigns` to understand what the configuration keys do
  -- Adds git related signs to the gutter, as well as utilities for managing changes
  'lewis6991/gitsigns.nvim',
  event = 'BufEnter',
  opts = function()
    return {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '-' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    }
  end,
  keys = {
    {
      '<leader>gs',
      '<cmd>Gitsigns stage_hunk<cr>',
      mode = 'n',
      desc = '[G]it [S]tage hunk',
    },
    {
      '<leader>gS',
      '<cmd>Gitsigns stage_buffer<cr>',
      mode = 'n',
      desc = '[G]it [S]tage buffer',
    },
    {
      '<leader>gu',
      '<cmd>Gitsigns undo_stage_hunk<cr>',
      mode = 'n',
      desc = '[G]it [U]nstage hunk',
    },
    {
      '<leader>gr',
      '<cmd>Gitsigns undo_stage_hunk<cr>',
      mode = 'n',
      desc = '[G]it [R]eset hunk',
    },
    {
      '<leader>gR',
      '<cmd>Gitsigns undo_stage_buffer<cr>',
      mode = 'n',
      desc = '[G]it [R]eset buffer',
    },
    {
      '<leader>gb',
      '<cmd>Gitsigns blame<cr>',
      mode = 'n',
      desc = '[G]it [B]lame',
    },
    {
      '<leader>gB',
      '<cmd>Gitsigns toggle_current_line_blame<cr>',
      mode = 'n',
      desc = '[G]it [B]lame line',
    },
    {
      '<leader>uB',
      '<cmd>Gitsigns toggle_current_line_blame<cr>',
      mode = 'n',
      desc = '[U]i git [B]lame line',
    },
    {
      '<leader>ug',
      '<cmd>Gitsigns toggle_signs<cr>',
      mode = 'n',
      desc = '[U]i [G]it signs',
    },
    {
      ']g',
      '<cmd>Gitsigns next_hunk<cr>',
      mode = 'n',
      desc = ']Next git hunk',
    },
    {
      '[g',
      '<cmd>Gitsigns prev_hunk<cr>',
      mode = 'n',
      desc = '[Prev git hunk',
    },
  },
}
