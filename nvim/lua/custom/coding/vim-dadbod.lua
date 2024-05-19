return {
  { 'tpope/vim-dadbod', ft = { 'sql', 'mysql', 'plsql' }, event = 'BufEnter', config = function() end },
  {
    'kristijanhusak/vim-dadbod-completion',
    dependencies = {
      'tpope/vim-dadbod',
    },
    event = 'VeryLazy',
    ft = { 'sql', 'mysql', 'plsql', 'mongo' },
    config = function() end,
  },
  {
    'kristijanhusak/vim-dadbod-ui',
    event = 'VeryLazy',
    dependencies = {
      { 'tpope/vim-dadbod', lazy = true },
      { 'kristijanhusak/vim-dadbod-completion', lazy = true },
    },
    ft = { 'sql', 'mysql', 'plsql', 'mongo' },
    keys = {
      {
        '<leader>Tu',
        '<cmd>DBUIToggle<cr>',
        mode = 'n',
        desc = '[T]oggle DB [U]I',
        ft = { 'sql', 'mysql', 'plsql', 'mongo' },
      },
    },
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
  },
}
