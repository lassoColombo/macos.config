require('which-key').add {
  {
    { '<leader><leader>', group = '[L]SP' },
    { '<leader><leader>_', hidden = true },
    {
      mode = { 'n', 'v' },
      { '<leader><leader>', group = '[L]SP', mode = { 'n', 'v' } },
      { '<leader><leader>_', hidden = true, mode = { 'n', 'v' } },
    },
  },
}
return {}
