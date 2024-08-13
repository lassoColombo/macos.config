return {
  'rafaelsq/nvim-goc.lua',
  ft = 'go',
  init = function()
    require('which-key').add {
      {
        { '=c', group = '[U]nittest [C]overage' },
        { '=c_', hidden = true },
      },
    }
  end,
  opts = {
    verticalSplit = false,
  },
  keys = {
    {
      '=cc',
      function()
        require('nvim-goc').CoverageFunc()
      end,
      mode = 'n',
      desc = '[U]nittest func [C]overage',
    },
    -- {
    --   '==!',
    --   function(asd)
    --     local callback = function(path)
    --       if path then
    --         vim.cmd(':silent exec "!open ' .. path .. '"')
    --       end
    --     end
    --     require('nvim-goc').CoverageFunc(nil, callback, 0)
    --     -- require('nvim-goc').Coverage(nil, callback)
    --   end,
    --   mode = 'n',
    --   desc = '[U]nittest func [C]overage browser',
    -- },
    {
      '=cc',
      function()
        require('nvim-goc').Coverage()
      end,
      mode = 'n',
      desc = '[U]nittest file [C]overage',
    },
    -- {
    --   '==@',
    --   function(asd)
    --     local callback = function(path)
    --       if path then
    --         vim.cmd(':silent exec "!open ' .. path .. '"')
    --       end
    --     end
    --     require('nvim-goc').Coverage(nil, callback)
    --   end,
    --   mode = 'n',
    --   desc = '[U]nittest file [C]overage browser',
    -- },
    {
      '=cp',
      function()
        require('nvim-goc').ClearCoverage()
      end,
      mode = 'n',
      desc = '[U]nittest percent file [C]overage',
    },
  },
}
-- vim.keymap.set('n', '[a', goc.AlternateSplit, {silent=true})
