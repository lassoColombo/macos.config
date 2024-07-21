return { -- Useful plugin to show you pending keybinds.
  'folke/which-key.nvim',
  event = 'VimEnter', -- Sets the loading event to 'VimEnter'
  config = function() -- This is the function that runs, AFTER loading
    require('which-key').setup()

    -- Document existing key chains
    require('which-key').register {
      ['<leader>c'] = { mode = { 'v', 'n' }, name = '[C]omment line', _ = 'which_key_ignore' },
      ['<leader>C'] = { mode = { 'v', 'n' }, name = '[C]omment block', _ = 'which_key_ignore' },
      ['<leader>d'] = { mode = { 'n' }, name = '[D]ebug', _ = 'which_key_ignore' },
      ['<leader>f'] = { mode = { 'v', 'n' }, name = '[F]ormat', _ = 'which_key_ignore' },
      ['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
      ['<leader>L'] = { name = '[L]ist', _ = 'which_key_ignore' },
      ['<leader>g'] = { name = '[G]it', _ = 'which_key_ignore' },
      ['<leader>t'] = { name = '[T]treesitter', _ = 'which_key_ignore' },
      ['<leader>u'] = { name = '[U]nittest', _ = 'which_key_ignore' },
      ['<leader><leader>'] = { name = 'Keymap Layer 2', _ = 'which_key_ignore' },
      ['<leader><leader>t'] = { name = '[T]oggle', _ = 'which_key_ignore' },
      ['<leader><leader>T'] = { name = '[T]odo comments', _ = 'which_key_ignore' },
      ['<leader><leader>Tl'] = { name = '[T]odo comments [L]ist', _ = 'which_key_ignore' },
      ['<leader><leader>Ts'] = { name = '[T]odo comments [S]earch', _ = 'which_key_ignore' },
      ['<leader>1'] = { name = 'UI', _ = 'which_key_ignore' },
    }
  end,
}
