return { -- Useful plugin to show you pending keybinds.
  'folke/which-key.nvim',
  event = 'VimEnter', -- Sets the loading event to 'VimEnter'
  config = function() -- This is the function that runs, AFTER loading
    require('which-key').setup {
      icons = {
        mappings = false,
      },
    }

    require('which-key').add {
      {
        { '<leader>1', group = '[T]oggle' },
        { '<leader>1_', hidden = true },
        { '<leader>r', group = '[R]egisters' },
        { '<leader>r_', hidden = true },
        { '<Space><Space>', group = '[L]SP specific' },
        { '<Space><Space>_', hidden = true },
        { ']', group = '[]Next' },
        { ']_', hidden = true },
        { '[', group = '[]Prev' },
        { '[_', hidden = true },
        { '\\', group = '\\S]earch' },
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
