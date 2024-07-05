return { -- Highlight, edit, and navigate code
  'nvim-treesitter/nvim-treesitter',
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
    'nvim-treesitter/nvim-treesitter-context',
  },
  event = { 'BufReadPre', 'BufNewFile' },
  build = ':TSUpdate',

  keys = {
    {
      '<leader>tt',
      '<cmd>InspectTree<CR>',
      mode = 'n',
      desc = '[C]ode [T]elescope [T]ree',
    },
  },
  config = function()
    -- [[ Configure Treesitter ]] See `:help nvim-treesitter`

    ---@diagnostic disable-next-line: missing-fields
    require('nvim-treesitter.configs').setup {
      ensure_installed = {
        'bash',
        'lua',
        'http',
        'markdown',
        'xml',
        'vim',
        'vimdoc',
        'ninja',
        'python',
        'toml',
        'json',
        'json5',
        'jsonc',
        'yaml',
        'sql',
        'dockerfile',
        'gitignore',
        'graphql',
      },
      -- Autoinstall languages that are not installed
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<leader>tv', -- set to `false` to disable one of the mappings
          node_incremental = 'gn',
          scope_incremental = 'gs',
          node_decremental = 'gN',
        },
      },
    }
    -- There are additional nvim-treesitter modules that you can use to interact
    -- with nvim-treesitter. You should go explore a few and see what interests you:
    --
    --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
    --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
    --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
  end,
}
