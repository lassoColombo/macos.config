return {
  'folke/trouble.nvim',
  event = 'BufEnter',
  opts = {}, -- for default options, refer to the configuration section for custom setup.
  cmd = 'Trouble',
  keys = {
    {
      '<leader>LD',
      function()
        require('trouble').toggle { mode = 'diagnostics' }
      end,
      desc = '[L]ist [D]iagnostics (workspace)',
    },
    {
      '<leader>Ld',
      function()
        require('trouble').toggle { mode = 'diagnostics', filter = { buf = 0 } }
      end,
      desc = '[L]ist [D]iagnostics (buffer)',
    },
    {
      '<leader>LL',
      function()
        require('trouble').toggle { mode = 'lsp' }
      end,
      desc = '[L]ist LSP report',
    },
    {
      '<leader>LT',
      function()
        require('trouble').toggle { mode = 'lsp_type_declarations' }
      end,
      desc = '[L]ist [T]ype declarations',
    },
    {
      '<leader>Lt',
      function()
        require('trouble').toggle { mode = 'lsp_definitions' }
      end,
      desc = '[L]ist [T]ype definitions',
    },
    {
      '<leader>Li',
      function()
        require('trouble').toggle { mode = 'lsp_implementations' }
      end,
      desc = '[L]ist [I]mplementations',
    },
    {
      '<leader>Lr',
      function()
        require('trouble').toggle { mode = 'lsp_references' }
      end,
      desc = '[L]ist [R]eferences',
    },
    {
      '<leader>Ls',
      function()
        require('trouble').toggle { mode = 'lsp_document_symbols' }
      end,
      desc = '[L]ist LSP [S]ymbols (workspace)',
    },
    {
      '<leader>Lc',
      function()
        require('trouble').toggle { mode = 'lsp_incoming_calls' }
      end,
      desc = '[L]ist [C]alls incoming',
    },
    {
      '<leader>LC',
      function()
        require('trouble').toggle { mode = 'lsp_outgoing_calls' }
      end,
      desc = '[L]ist [C]alls outgoing',
    },
  },
}
