return {
  'folke/trouble.nvim',
  event = 'BufEnter',
  opts = {}, -- for default options, refer to the configuration section for custom setup.
  cmd = 'Trouble',
  keys = {
    {
      '<leader>sD',
      function()
        require('trouble').toggle { mode = 'diagnostics' }
      end,
      desc = '[S]earch [D]iagnostics (workspace)',
    },
    {
      '<leader>sd',
      function()
        require('trouble').toggle { mode = 'diagnostics', filter = { buf = 0 } }
      end,
      desc = '[S]earch [D]iagnostics (buffer)',
    },
    {
      '<leader>sL',
      function()
        require('trouble').toggle { mode = 'lsp' }
      end,
      desc = '[S]earch LSP report',
    },
    {
      '<leader>sT',
      function()
        require('trouble').toggle { mode = 'lsp_type_definitions' }
      end,
      desc = '[S]earch [T]ype declarations',
    },
    {
      '<leader>st',
      function()
        require('trouble').toggle { mode = 'lsp_definitions' }
      end,
      desc = '[S]earch [T]ype definitions',
    },
    {
      '<leader>si',
      function()
        require('trouble').toggle { mode = 'lsp_implementations' }
      end,
      desc = '[S]earch [I]mplementations',
    },
    {
      '<leader>sr',
      function()
        require('trouble').toggle { mode = 'lsp_references' }
      end,
      desc = '[S]earch [R]eferences',
    },
    {
      '<leader>ss',
      function()
        require('trouble').toggle { mode = 'lsp_document_symbols' }
      end,
      desc = '[S]earch LSP [S]ymbols (workspace)',
    },
    {
      '<leader>sc',
      function()
        require('trouble').toggle { mode = 'lsp_incoming_calls' }
      end,
      desc = '[S]earch [C]alls incoming',
    },
    {
      '<leader>sC',
      function()
        require('trouble').toggle { mode = 'lsp_outgoing_calls' }
      end,
      desc = '[S]earch [C]alls outgoing',
    },
  },
}
