return {
  cmd = { 'sqls', '-config', '~/.config/sqls/config.yml' },
  on_attach = function(client, bufnr)
    require('sqls').on_attach(client, bufnr) -- require sqls.nvim
    require('which-key').register {
      ['<leader>csl'] = { name = '[C]ode [L]SP [L]ist', _ = 'which_key_ignore' },
      ['<leader>css'] = { name = '[C]ode [L]SP [S]witch', _ = 'which_key_ignore' },
    }
    vim.keymap.set({ 'n', 'v' }, '<leader>cx', '<cmd>SqlsExecuteQuery<CR>', { desc = '[C]ode e[X]ecute' })
    vim.keymap.set('n', '<leader>clld', '<cmd>SqlsShowDatabases<CR>', { desc = '[C]ode [L]SP [L]ist [D]atabases' })
    vim.keymap.set('n', '<leader>clls', '<cmd>SqlsShowSchemas<CR>', { desc = '[C]ode [L]SP [L]ist [S]chema' })
    vim.keymap.set('n', '<leader>cllc', '<cmd>SqlsShowConnections<CR>', { desc = '[C]ode [L]SP [L]ist [C]onnections' })
    vim.keymap.set('n', '<leader>clsd', '<cmd>SqlsSwitchDatabase<CR>', { desc = '[C]ode [L]SP [S]witch [D]atabase' })
    vim.keymap.set('n', '<leader>clsc', '<cmd>SqlsSwitchConnection<CR>', { desc = '[C]ode [L]SP [S]witch [C]onnection' })
  end,
}
