return {
  cmd = { 'sqls', '-config', '~/.config/sqls/config.yml' },
  on_attach = function(client, bufnr)
    require('sqls').on_attach(client, bufnr) -- require sqls.nvim

    require('which-key').add {
      {
        { '<leader><leader>S', group = '[L]SP [S]chema/[D]atabase' },
        { '<leader><leader>S_', hidden = true },
      },
    }
    vim.keymap.set({ 'n', 'v' }, '<leader><leader>x', '<cmd>SqlsExecuteQuery<CR>', { desc = 'e[X]ecute' })
    -- :NOTE: useless
    -- vim.keymap.set('n', '<leader>lld', '<cmd>SqlsShowDatabases<CR>', { desc = '[L]SP [L]ist [D]atabases' })
    -- vim.keymap.set('n', '<leader>lls', '<cmd>SqlsShowSchemas<CR>', { desc = '[L]SP [L]ist [S]chema' })
    -- vim.keymap.set('n', '<leader>llc', '<cmd>SqlsShowConnections<CR>', { desc = '[L]SP [L]ist [C]onnections' })
    vim.keymap.set('n', '<leader><leader>SD', '<cmd>SqlsSwitchDatabase<CR>', { desc = '[L]SP [S]witch [D]atabase' })
    vim.keymap.set('n', '<leader><leader>SS', '<cmd>SqlsSwitchConnection<CR>', { desc = '[L]SP [S]witch [C]onnection' })
  end,
}
