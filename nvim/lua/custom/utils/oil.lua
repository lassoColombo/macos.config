return {
  'stevearc/oil.nvim',
  keys = {
    {
      '<leader><leader>o',
      '<cmd>Oil .<cr>',
      mode = 'n',
      desc = '[O]il workspace',
    },
    {
      '<leader><leader>O',
      '<cmd>Oil<cr>',
      mode = 'n',
      desc = '[O]il buffer',
    },
  },
  opts = {
    keymaps = {
      ['g?'] = 'actions.show_help',
      ['<CR>'] = 'actions.select',
      ['H'] = 'actions.select',
      ['<C-v>'] = 'actions.select_vsplit',
      ['<C-s>'] = 'actions.select_split',
      ['<C-t>'] = 'actions.select_tab',
      ['<C-p>'] = 'actions.preview',
      ['<C-c>'] = 'actions.close',
      ['<C-n>'] = 'actions.refresh',
      ['-'] = 'actions.parent',
      ['L'] = 'actions.parent',
      ['<'] = 'actions.parent',
      ['_'] = 'actions.open_cwd',
      ['`'] = 'actions.cd',
      ['~'] = 'actions.tcd',
      ['gs'] = 'actions.change_sort',
      ['gx'] = 'actions.open_external',
      ['g.'] = 'actions.toggle_hidden',
      ['C-h'] = 'actions.toggle_hidden',
      ['g\\'] = 'actions.toggle_trash',
    },
  },
  -- Optional dependencies
  dependencies = { 'nvim-tree/nvim-web-devicons' },
}
