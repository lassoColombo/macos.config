return {
  'L3MON4D3/LuaSnip',
  event = 'BufEnter',
  keys = {
    {
      'C-n',
      function()
        require('luasnip').change_choice(1)
      end,
      mode = { 'i', 'v' },
      desc = 'next choice',
    },
    {
      'C-n',
      function()
        require('luasnip').change_choice(-1)
      end,
      mode = { 'i', 'v' },
      desc = 'prev choice',
    },
    {
      'C-P',
      function()
        require 'luasnip.extras.select_choice'()
      end,
      mode = { 'i', 'v' },
      desc = 'pick choice',
    },
  },
  build = (function()
    if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
      return
    end
    return 'make install_jsregexp'
  end)(),
}
