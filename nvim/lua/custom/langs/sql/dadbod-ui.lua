return {
  'kristijanhusak/vim-dadbod-ui',
  event = 'VeryLazy',
  dependencies = {
    { 'tpope/vim-dadbod', lazy = true },
    { 'kristijanhusak/vim-dadbod-completion', lazy = true },
  },
  ft = { 'sql', 'mysql', 'plsql', 'mongo' },
  cmd = {
    'DBUI',
    'DBUIToggle',
    'DBUIAddConnection',
    'DBUIFindBuffer',
  },
  init = function()
    vim.g.db_ui_use_nerd_fonts = 1
    vim.g.db_ui_table_helpers = {
      mongo_db = {
        Count = 'select count(*) from "{table}"',
      },
    }
  end,
}
