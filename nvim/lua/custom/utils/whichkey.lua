return { -- Useful plugin to show you pending keybinds.
  'folke/which-key.nvim',
  event = 'VimEnter', -- Sets the loading event to 'VimEnter'
  config = function() -- This is the function that runs, AFTER loading
    require('which-key').setup {
      icons = {
        mappings = false,
      },
    }

    -- Document existing key chains
    require('which-key').add {
      {
        { ']', group = '[]Next' },
        { ']_', hidden = true },
        { '[', group = '[]Prev' },
        { '[_', hidden = true },
        { '/', group = '/[S]earch' },
        { '/_', hidden = true },
        { '\\', group = '\\[L]ist' },
        { '\\_', hidden = true },
        { '-', group = '[D]ebug' },
        { '-_', hidden = true },
        { '=', group = '[U]nittest' },
        { '=_', hidden = true },
        { '<leader>u', group = '[U]I' },
        { '<leader>u_', hidden = true },
        { '<leader>g', group = '[G]it' },
        { '<leader>g_', hidden = true },
        { '<leader><leader>', group = '[L]SP' },
        { '<leader><leader>_', hidden = true },
        {
          mode = { 'n', 'v' },
          { '<leader>C', group = '[C]omment block' },
          { '<leader>C_', hidden = true },
          { '<leader>c', group = '[C]omment line' },
          { '<leader>c_', hidden = true },
          { '<leader>f', group = '[F]ormat' },
          { '<leader>f_', hidden = true },
          { '<leader><leader>', group = '[L]SP', mode = { 'n', 'v' } },
          { '<leader><leader>_', hidden = true, mode = { 'n', 'v' } },
        },
      },
    }
  end,
}
