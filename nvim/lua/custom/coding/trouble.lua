return {
  'folke/trouble.nvim',
  event = 'BufEnter',
  opts = {}, -- for default options, refer to the configuration section for custom setup.
  cmd = 'Trouble',
  init = function()
    vim.api.nvim_create_autocmd('QuickFixCmdPost', {
      callback = function()
        vim.cmd [[Trouble qflist open]]
      end,
    })
  end,
  keys = {
    {
      '<Space>D',
      function()
        require('trouble').toggle { mode = 'diagnostics', win = { relative = 'win', position = 'right' } }
      end,
      desc = '[D]iagnostics (workspace)',
    },
    {
      '<Space>d',
      function()
        require('trouble').toggle { mode = 'diagnostics', filter = { buf = 0 }, win = { relative = 'win', position = 'right' } }
      end,
      desc = '[D]iagnostics (buffer)',
    },
    -- {
    --   '<Space>L',
    --   function()
    --     require('trouble').toggle { mode = 'lsp', win = { relative = 'win', position = 'right' } }
    --   end,
    --   desc = ' report',
    -- },
    {
      '<Space>T',
      function()
        require('trouble').toggle { mode = 'lsp_type_definitions', pinned = true, win = { relative = 'win', position = 'right' } }
      end,
      desc = '[T]ype declarations',
    },
    {
      '<Space>t',
      function()
        require('trouble').toggle { mode = 'lsp_definitions', pinned = true, win = { relative = 'win', position = 'right' } }
      end,
      desc = '[T]ype definitions',
    },
    {
      '<C-g>',
      function()
        require('trouble').toggle { mode = 'lsp_definitions', pinned = true, win = { relative = 'win', position = 'right' } }
      end,
      desc = '[T]ype definitions',
    },
    {
      '<Space>i',
      function()
        require('trouble').toggle { mode = 'lsp_implementations', pinned = true, win = { relative = 'win', position = 'right' } }
      end,
      desc = '[I]mplementations',
    },
    {
      '<Space>r',
      function()
        require('trouble').toggle { mode = 'lsp_references', pinned = true, win = { relative = 'win', position = 'right' } }
      end,
      desc = '[R]eferences',
    },
    {
      '<Space>s',
      function()
        -- Trouble symbols toggle pinned=true win.relative=win win.position=right
        require('trouble').toggle { mode = 'lsp_document_symbols', pinned = true, win = { relative = 'win', position = 'right' } }
      end,
      desc = '[S]ymbols (document)',
    },
    {
      '<Space>c',
      function()
        require('trouble').toggle { mode = 'lsp_incoming_calls', pinned = true, win = { relative = 'win', position = 'right' } }
      end,
      desc = '[C]alls incoming',
    },
    {
      '<Space>C',
      function()
        require('trouble').toggle { mode = 'lsp_outgoing_calls', pinned = true, win = { relative = 'win', position = 'right' } }
      end,
      desc = '[C]alls outgoing',
    },
  },
}
