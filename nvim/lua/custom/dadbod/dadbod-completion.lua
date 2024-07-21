return {
  'kristijanhusak/vim-dadbod-completion',
  dependencies = {
    'tpope/vim-dadbod',
  },
  event = 'VeryLazy',
  ft = { 'sql', 'mysql', 'plsql', 'mongo' },
  config = function() end,
}
