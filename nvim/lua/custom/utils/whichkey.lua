return { -- Useful plugin to show you pending keybinds.
  'folke/which-key.nvim',
  event = 'VimEnter', -- Sets the loading event to 'VimEnter'
  config = function() -- This is the function that runs, AFTER loading
    require('which-key').setup()

    -- Document existing key chains
    require('which-key').register {
      ['<leader>c'] = { mode = { 'v', 'n' }, name = '[C]ode', _ = 'which_key_ignore' },
      ['<leader>ci'] = { mode = { 'v', 'n' }, name = '[C]ode [I]nfo', _ = 'which_key_ignore' },
      ['<leader>ct'] = { mode = { 'v', 'n' }, name = '[C]ode [T]reesitter', _ = 'which_key_ignore' },
      ['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
      ['<leader>L'] = { name = '[L]ist', _ = 'which_key_ignore' },
      ['<leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
      ['<leader>b'] = { name = '[B]uffer', _ = 'which_key_ignore' },
      ['<leader>g'] = { name = '[G]it', _ = 'which_key_ignore' },
      ['<leader>t'] = { name = '[T]oggle', _ = 'which_key_ignore' },
      ['<leader><leader>'] = { name = 'Keymap Layer 2', _ = 'which_key_ignore' },
    }
  end,
}
