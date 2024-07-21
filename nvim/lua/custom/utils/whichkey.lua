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
      ['<leader>/'] = { name = '[/S]earch', _ = 'which_key_ignore' },
      ['<leader>L'] = { name = '[L]ist', _ = 'which_key_ignore' },
      ['<leader>g'] = { name = '[G]it', _ = 'which_key_ignore' },
      ['<leader>t'] = { name = '[T]treesitter', _ = 'which_key_ignore' },
      ['<leader>u'] = { name = '[U]nittest', _ = 'which_key_ignore' },
      ['<leader>1'] = { name = 'UI', _ = 'which_key_ignore' },
      ['<leader><leader>'] = { name = 'Keymap Layer 2', _ = 'which_key_ignore' },
    }
  end,
}
