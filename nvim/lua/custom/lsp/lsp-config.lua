return { -- LSP Configuration & Plugins
  'neovim/nvim-lspconfig',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    -- Automatically install LSPs and related tools to stdpath for neovim
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    -- Useful status updates for LSP.
    -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
    { 'j-hui/fidget.nvim', opts = {} },
  },
  config = function()
    -- `:help lsp-vs-treesitter`
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
      callback = function(event)
        local map = function(keys, func, desc)
          vim.keymap.set('n', keys, func, { buffer = event.buf, desc = desc })
        end

        require('which-key').add {
          {
            { '<Space>', group = '' },
            { '<Space>_', hidden = true },
          },
        }
        map('<Space>R', '<cmd>LspRestart<CR>', '[R]estart')
        map('<Space>I', '<cmd>LspInfo<cr>', '[I]nfo')
        map('<Space>r', vim.lsp.buf.rename, '[R]ename')
        map('<Space>a', vim.lsp.buf.code_action, '[A]ction')
        map('<Space>k', vim.lsp.buf.hover, '[D]ocumentation')
        vim.keymap.set('n', '<Space>v', function()
          vim.diagnostic.open_float { source = true }
        end, { desc = '[V]iew line diagnostics' })
        vim.keymap.set('n', '[d', function()
          vim.diagnostic.goto_prev { float = { source = true } }
        end, { desc = '[Prev [D]iagnostic message' })
        vim.keymap.set('n', ']d', function()
          vim.diagnostic.goto_next { float = { source = true } }
        end, { desc = ']Next [D]iagnostic message' })

        -- The following two autocommands are used to highlight references of the
        -- word under cursor when your cursor rests there for a little while.
        -- See `:help CursorHold` for information about when this is executed
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client.server_capabilities.documentHighlightProvider then
          vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            buffer = event.buf,
            callback = vim.lsp.buf.document_highlight,
          })

          vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
            buffer = event.buf,
            callback = vim.lsp.buf.clear_references,
          })
        end
      end,
    })

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

    local servers = {
      lua_ls = require 'custom.lsp.configs.luals',
      pyright = require 'custom.lsp.configs.pyright',
      yamlls = require 'custom.lsp.configs.yamlls',
      jsonls = require 'custom.lsp.configs.jsonls',
      taplo = require 'custom.lsp.configs.taplo',
      sqls = require 'custom.lsp.configs.sqls',
      ansiblels = require 'custom.lsp.configs.ansiblels',
      gopls = {},
    }

    require('mason').setup()
    vim.keymap.set('n', '<Space>m', '<cmd>Mason<cr>', { desc = '[M]ason' })

    local ensure_installed = vim.tbl_keys(servers or {})
    vim.list_extend(ensure_installed, {
      -- lua
      'lua_ls',
      'stylua',
      -- python
      'pyright',
      'pylint',
      'black',
      'isort',
      -- yaml
      'yamlls',
      'prettier',
      -- json
      'jsonls',
      -- bash
      'bashls',
      -- sql
      'sqls',
      'sqlfmt',
      -- docker
      'dockerls',
      'docker_compose_language_service',
      -- bash
      'bashls',
      -- toml
      'taplo',
      -- ansible
      'ansiblels',
      'ansible-lint',
      -- markdown
      'marksman',
      -- go
      'gopls',
      'goimports',
      -- html
      'html',
    })
    require('mason-tool-installer').setup { ensure_installed = ensure_installed }

    require('mason-lspconfig').setup {
      handlers = {
        function(server_name)
          local server = servers[server_name] or {}
          -- This handles overriding only values explicitly passed
          -- by the server configuration above. Useful when disabling
          -- certain features of an LSP (for example, turning off formatting for tsserver)
          server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
          require('lspconfig')[server_name].setup(server)
        end,
      },
    }
  end,
}
