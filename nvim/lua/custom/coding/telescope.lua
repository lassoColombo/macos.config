return { -- Fuzzy Finder (files, lsp, etc)
  'nvim-telescope/telescope.nvim',
  event = 'VimEnter',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    { 'nvim-telescope/telescope-ui-select.nvim' },
    { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
  },

  config = function()
    require('telescope').setup {
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
      },
    }
    -- See `:help telescope.builtin`
    local builtin = require 'telescope.builtin'
    -- lsp keymaps
    local telescope = require 'telescope.builtin'
    vim.keymap.set('n', '<leader>sr', telescope.lsp_references, { desc = '[S]earch [R]eferences' })
    vim.keymap.set('n', '<leader>st', telescope.lsp_definitions, { desc = '[S]earch [D]efinitions' })
    vim.keymap.set('n', '<leader>sT', telescope.lsp_type_definitions, { desc = '[S]earch type [D]efinitions' })
    vim.keymap.set('n', '<leader>si', telescope.lsp_implementations, { desc = '[S]earch [I]mplementation' })
    vim.keymap.set('n', '<leader>ss', telescope.lsp_document_symbols, { desc = '[S]earc [S]ymbols (document)' })
    vim.keymap.set('n', '<leader>sS', telescope.lsp_dynamic_workspace_symbols, { desc = '[S]earch [S]ymbols (workspace)' })
    vim.keymap.set('n', '<leader>sD', telescope.diagnostics, { desc = '[S]earch [D]iagnostics (workspace)' })
    vim.keymap.set('n', '<leader>sd', function()
      telescope.diagnostics { bufnr = 0 }
    end, { desc = '[S]earch [D]iagnostics (buffer)' })
    -- grep searches
    vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
    vim.keymap.set('n', '<leader>sg', builtin.current_buffer_fuzzy_find, { desc = '[S]earch [G]rep (buffer)' })
    vim.keymap.set('n', '<leader>sG', builtin.live_grep, { desc = '[S]earch [G]rep (workspace)' })
    -- code object searches
    vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
    vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
    -- file/buffer searches
    vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
    vim.keymap.set('n', '<leader>sF', function()
      builtin.find_files { hidden = true, no_ignore = true }
    end, { desc = '[S]earch [F]iles (hidden)' })
    vim.keymap.set('n', '<leader>sb', builtin.buffers, { desc = '[S]earch [B]uffers ' })
    vim.keymap.set('n', '<leader><leader>s', builtin.buffers, { desc = '[S]earch [B]uffers ' })
    -- other searches
    vim.keymap.set('n', '<leader>sR', builtin.resume, { desc = '[S]earch [R]esume' })
    vim.keymap.set('n', '<leader>sn', function()
      builtin.find_files { cwd = vim.fn.stdpath 'config' }
    end, { desc = '[S]earch [N]eovim files' })
    vim.keymap.set('n', '<leader>/', function()
      builtin.current_buffer_fuzzy_find(require('telescope.themes').get_ivy {
        winblend = 0,
        previewer = true,
      })
    end, { desc = '[/] Fuzzily search in current buffer' })

    -- examples
    --
    -- Also possible to pass additional configuration options.
    --  See `:help telescope.builtin.live_grep()` for information about particular keys
    -- vim.keymap.set('n', '<leader>s/', function()
    --   builtin.live_grep {
    --     grep_open_files = true,
    --     prompt_title = 'Live Grep in Open Files',
    --   }
    -- end, { desc = '[S]earch [/] in Open Files' })
    --
  end,
}
