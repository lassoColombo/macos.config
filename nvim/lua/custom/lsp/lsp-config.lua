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

        require('which-key').register {
          ['<leader>l'] = { mode = { 'v', 'n' }, name = '[L]SP', _ = 'which_key_ignore' },
        }
        map('<leader>lr', '<cmd>LspRestart<CR>', { desc = '[L]SP [R]estart' })

        map('<leader>lr', vim.lsp.buf.rename, '[L]SP [R]ename')
        map('<leader>la', vim.lsp.buf.code_action, '[L]SP [A]ction')
        map('<leader>li', '<cmd>LspInfo<cr>', '[L]SP [I]nfo')
        map('<leader>lk', vim.lsp.buf.hover, 'Hover Documentation')
        -- telescope lsp mappings
        -- stylua: ignore start
        local telescope = require 'telescope.builtin'
        map('<leader>sr', telescope.lsp_references, '[S]earch [R]eferences')
        map('<leader>st', telescope.lsp_definitions, '[S]earch [D]efinitions')
        map('<leader>sT', telescope.lsp_type_definitions, '[S]earch type [D]efinitions')
        map('<leader>sr', telescope.lsp_references, '[S]earch [R]eferences')
        map('<leader>si', telescope.lsp_implementations, '[S]earch [I]mplementation')
        map('<leader>ss', telescope.lsp_document_symbols, '[S]earc [S]ymbols (document)')
        map('<leader>sS', telescope.lsp_dynamic_workspace_symbols, '[S]earch [S]ymbols (workspace)')
        map('<leader>sD', telescope.diagnostics, '[S]earch [D]iagnostics (workspace)')
        map('<leader>sd', function() telescope.diagnostics { bufnr = 0 } end, '[S]earch [D]iagnostics (buffer)')
        -- trouble lsp mappings
        local trouble = require 'trouble'
        map('<leader>Ld', function () trouble.toggle 'document_diagnostics' end, '[L]ist [D]iagnostics (document)')
        map('<leader>LD', function () trouble.toggle 'workspace_diagnostics' end, '[L]ist [D]iagnostics (workspace)')
        map('<leader>Lr', function () trouble.toggle 'lsp_references' end, '[L]ist [R]eferences')
        map('<leader>Lq', function () trouble.toggle 'quickfix' end, '[L]ist [Q]uickfix')
        map('<leader>Ll', function () trouble.toggle 'loclist' end, '[L]ist [L]oc')
        -- :TODO: drop builtins in favour of the following (not working!!)
        -- map(']d', function () require("trouble").next({skip_groups = true, jump = true}) end, '[next [D]iagnostic')
        -- map('[d', function () require("trouble").previous({skip_groups = true, jump = true}) end, '[previous [D]iagnostic')
        --
        -- stylua: ignore end

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
      sqls = require 'custom.lsp.configs.sqls',
      gopls = {},
    }

    require('mason').setup()
    vim.keymap.set('n', '<leader>cm', '<cmd>Mason<CR>', { desc = '[C]ode [M]ason' })

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
      -- 'ansible-lint',
      -- markdown
      'marksman',
      -- go
      'gopls',
      'goimports',
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
