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
        {
          mode = { 'n', 'v' },
          { '<leader>f', group = '[F]ormat' },
          { '<leader>f_', hidden = true },
        },
      },
    }
  end,
}
