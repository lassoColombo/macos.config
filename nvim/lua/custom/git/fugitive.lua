return {
  'tpope/vim-fugitive',
  config = function()
    return {}
  end,
  keys = {
    {
      '<leader>gi',
      function()
        vim.ui.input({ prompt = 'Revision: ' }, function(input)
          vim.api.nvim_command('Gedit ' .. input .. ':%')
        end)
      end,
      mode = 'n',
      desc = '[G]it [I]nspect',
    },
    {
      '<leader>gp',
      '<cmd>Git push<cr>',
      mode = 'n',
      desc = '[G]it [P]ush',
    },
    {
      '<leader>gP',
      '<cmd>Git push --force<cr>',
      mode = 'n',
      desc = '[G]it [P]ush force',
    },
  },
}
