return {
  'folke/trouble.nvim',
  event = 'BufEnter',
  opts = {}, -- for default options, refer to the configuration section for custom setup.
  cmd = 'Trouble',
  keys = {
    {
      '<leader><leader>D',
      function()
        require('trouble').toggle { mode = 'diagnostics', win = { relative = 'win', position = 'right' } }
      end,
      desc = '[L]SP [D]iagnostics (workspace)',
    },
    {
      '<leader><leader>d',
      function()
        require('trouble').toggle { mode = 'diagnostics', filter = { buf = 0 }, win = { relative = 'win', position = 'right' } }
      end,
      desc = '[L]SP [D]iagnostics (buffer)',
    },
    -- {
    --   '<leader><leader>L',
    --   function()
    --     require('trouble').toggle { mode = 'lsp', win = { relative = 'win', position = 'right' } }
    --   end,
    --   desc = '[L]SP report',
    -- },
    {
      '<leader><leader>T',
      function()
        require('trouble').toggle { mode = 'lsp_type_definitions', pinned = true, win = { relative = 'win', position = 'right' } }
      end,
      desc = '[L]SP [T]ype declarations',
    },
    {
      '<leader><leader>t',
      function()
        require('trouble').toggle { mode = 'lsp_definitions', pinned = true, win = { relative = 'win', position = 'right' } }
      end,
      desc = '[L]SP [T]ype definitions',
    },
    {
      '<C-g>',
      function()
        require('trouble').toggle { mode = 'lsp_definitions', pinned = true, win = { relative = 'win', position = 'right' } }
      end,
      desc = '[L]SP [T]ype definitions',
    },
    {
      '<leader><leader>i',
      function()
        require('trouble').toggle { mode = 'lsp_implementations', pinned = true, win = { relative = 'win', position = 'right' } }
      end,
      desc = '[L]SP [I]mplementations',
    },
    {
      '<leader><leader>r',
      function()
        require('trouble').toggle { mode = 'lsp_references', pinned = true, win = { relative = 'win', position = 'right' } }
      end,
      desc = '[L]SP [R]eferences',
    },
    {
      '<leader><leader>s',
      function()
        -- Trouble symbols toggle pinned=true win.relative=win win.position=right
        require('trouble').toggle { mode = 'lsp_document_symbols', pinned = true, win = { relative = 'win', position = 'right' } }
      end,
      desc = '[L]SP [S]ymbols (document)',
    },
    {
      '<leader><leader>c',
      function()
        require('trouble').toggle { mode = 'lsp_incoming_calls', pinned = true, win = { relative = 'win', position = 'right' } }
      end,
      desc = '[L]SP [C]alls incoming',
    },
    {
      '<leader><leader>C',
      function()
        require('trouble').toggle { mode = 'lsp_outgoing_calls', pinned = true, win = { relative = 'win', position = 'right' } }
      end,
      desc = '[L]SP [C]alls outgoing',
    },
  },
}
