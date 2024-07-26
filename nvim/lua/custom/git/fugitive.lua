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
  },
}
