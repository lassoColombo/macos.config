return {
  'mistweaverco/kulala.nvim',
  -- event = 'VeryLazy',
  config = function()
    require('kulala').setup {
      -- default_view, body or headers
      default_view = 'body',
      -- dev, test, prod, can be anything
      -- see: https://learn.microsoft.com/en-us/aspnet/core/test/http-files?view=aspnetcore-8.0#environment-files
      default_env = 'dev',
      -- enable/disable debug mode
      debug = false,
      -- default formatters for different content types
      formatters = {
        json = { 'jq', '.' },
        xml = { 'xmllint', '--format', '-' },
        html = { 'xmllint', '--format', '--html', '-' },
      },
      -- default icons
      icons = {
        inlay = {
          loading = '⏳',
          done = '✅',
          error = '❌',
        },
        lualine = '🐼',
      },
      -- additional cURL options
      -- see: https://curl.se/docs/manpage.html
      additional_curl_options = {},
    }
  end,
  ft = 'http',
  keys = {
    {
      '<leader>x',
      function()
        require('kulala').run()
      end,
      mode = 'n',
      desc = 'e[X]ecute request',
      ft = 'http',
    },
    {
      '<leader>hx',
      function()
        require('kulala').run()
      end,
      mode = 'n',
      desc = 'e[X]ecute request',
      ft = 'http',
    },
    {
      '<leader>hy',
      function()
        require('kulala').copy()
      end,
      mode = 'n',
      desc = '[H]ttp copy request',
      ft = 'http',
    },
    {
      '<leader>hv',
      function()
        require('kulala').toggle_view()
      end,
      mode = 'n',
      desc = '[H]ttp toggle [V]iew',
      ft = 'http',
    },
    {
      '<leader>he',
      function()
        require('kulala').set_selected_env()
      end,
      mode = 'n',
      desc = '[H]ttp [E]nv',
      ft = 'http',
    },
    {
      '[h',
      function()
        require('kulala').jump_prev()
      end,
      mode = 'n',
      desc = '[Prev [H]ttp request',
      ft = 'http',
    },
    {
      ']h',
      function()
        require('kulala').jump_next()
      end,
      mode = 'n',
      desc = ']Next [H]ttp request',
      ft = 'http',
    },
  },
}
