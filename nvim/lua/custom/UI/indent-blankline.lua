return {
  'lukas-reineke/indent-blankline.nvim',
  event = 'BufEnter',
  opts = {
    indent = {
      char = '│',
      tab_char = '│',
    },
    scope = { enabled = false },
    exclude = {
      filetypes = {
        'help',
        'alpha',
        'dashboard',
        'neo-tree',
        'Trouble',
        'trouble',
        'lazy',
        'mason',
        'notify',
        'toggleterm',
        'lazyterm',
      },
    },
  },
  main = 'ibl',
  -- :TODO: find a way to toggle
  -- keys = {
  --   {
  --     '<leader>0i',
  --     function()
  --     :TODO:
  --     end,
  --     mode = 'n',
  --     desc = '[T]oggle [I]ndent highlight',
  --   },
  -- },
}
