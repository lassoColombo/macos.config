return {
  'folke/trouble.nvim',
  event = 'BufEnter',
  opts = {}, -- for default options, refer to the configuration section for custom setup.
  cmd = 'Trouble',
  keys = {
    {
      '\\D',
      function()
        require('trouble').toggle { mode = 'diagnostics' }
      end,
      desc = '[L]ist [D]iagnostics (workspace)',
    },
    {
      '\\d',
      function()
        require('trouble').toggle { mode = 'diagnostics', filter = { buf = 0 } }
      end,
      desc = '[L]ist [D]iagnostics (buffer)',
    },
    {
      '\\L',
      function()
        require('trouble').toggle { mode = 'lsp' }
      end,
      desc = '[L]SP report',
    },
    {
      '\\T',
      function()
        require('trouble').toggle { mode = 'lsp_type_definitions' }
      end,
      desc = '[L]ist [T]ype declarations',
    },
    {
      '\\t',
      function()
        require('trouble').toggle { mode = 'lsp_definitions' }
      end,
      desc = '[L]ist [T]ype definitions',
    },
    {
      '\\i',
      function()
        require('trouble').toggle { mode = 'lsp_implementations' }
      end,
      desc = '[L]ist [I]mplementations',
    },
    {
      '\\r',
      function()
        require('trouble').toggle { mode = 'lsp_references' }
      end,
      desc = '[L]ist [R]eferences',
    },
    {
      '\\s',
      function()
        require('trouble').toggle { mode = 'lsp_document_symbols' }
      end,
      desc = '[L]ist LSP [S]ymbols (workspace)',
    },
    {
      '\\c',
      function()
        require('trouble').toggle { mode = 'lsp_incoming_calls' }
      end,
      desc = '[L]ist [C]alls incoming',
    },
    {
      '\\C',
      function()
        require('trouble').toggle { mode = 'lsp_outgoing_calls' }
      end,
      desc = '[L]ist [C]alls outgoing',
    },
  },
}
