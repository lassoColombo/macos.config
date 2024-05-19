return {
  cmd = { 'sqls', '-config', '~/.config/sqls/config.yml' },
  on_attach = function(client, bufnr)
    require('sqls').on_attach(client, bufnr) -- require sqls.nvim
    require('which-key').register {
      ['<leader>ll'] = { name = '[C]ode [L]SP [L]ist', _ = 'which_key_ignore' },
      ['<leader>ls'] = { name = '[C]ode [L]SP [S]witch', _ = 'which_key_ignore' },
    }
    vim.keymap.set({ 'n', 'v' }, '<leader><leader>X', '<cmd>SqlsExecuteQuery<CR>', { desc = 'e[X]ecute' })
    vim.keymap.set('n', '<leader>lld', '<cmd>SqlsShowDatabases<CR>', { desc = '[L]SP [L]ist [D]atabases' })
    vim.keymap.set('n', '<leader>lls', '<cmd>SqlsShowSchemas<CR>', { desc = '[L]SP [L]ist [S]chema' })
    vim.keymap.set('n', '<leader>llc', '<cmd>SqlsShowConnections<CR>', { desc = '[L]SP [L]ist [C]onnections' })
    vim.keymap.set('n', '<leader>lsd', '<cmd>SqlsSwitchDatabase<CR>', { desc = '[L]SP [S]witch [D]atabase' })
    vim.keymap.set('n', '<leader>lsc', '<cmd>SqlsSwitchConnection<CR>', { desc = '[L]SP [S]witch [C]onnection' })
  end,
}
