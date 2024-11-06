return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = function()
    local lualine_require = require 'lualine_require'
    lualine_require.require = require

    vim.o.laststatus = vim.g.lualine_laststatus

    local trouble = require 'trouble'
    local symbols = trouble.statusline {
      mode = 'lsp_document_symbols',
      groups = {},
      title = false,
      filter = { range = true },
      format = '{kind_icon}{symbol.name:Normal}',
      -- The following line is needed to fix the background color
      -- Set it to the lualine section you want to use
      hl_group = 'lualine_c_normal',
    }

    return {
      options = {
        theme = 'auto',
        globalstatus = true,
        disabled_filetypes = { statusline = { 'dashboard', 'alpha', 'starter', 'help', 'qf', 'jqx', 'neotest-output', 'neotest-summary' } },
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = {
          { 'branch' },
          {
            'filename',
            file_status = false,
            newfile_status = false,
            path = 1, -- 0: Just the filename 1: Relative path 2: Absolute path 3: Absolute path, with tilde as the home directory 4: Filename and parent dir, with tilde as the home directory
            shorting_target = 40, -- Shortens path to leave 40 spaces in the window
            symbols = {
              modified = '[+]', -- Text to show when the file is modified.
              readonly = '[-]', -- Text to show when the file is non-modifiable or readonly.
              unnamed = '[No Name]', -- Text to show for unnamed buffers.
              newfile = '[New]', -- Text to show for newly created file before first write
            },
          },
        },
        lualine_c = {
          { 'location', padding = { left = 0, right = 1 } },
          { 'progress', padding = { left = 1, right = 1 } },
          { symbols.get, cond = symbols.has },
          {
            'diagnostics',
            symbols = {
              error = '❗',
              warn = '❕',
              info = '🔎',
              hint = '🕯',
            },
          },
        },
        lualine_x = {
          {
            function()
              local reg = vim.fn.reg_recording()
              if reg == '' then
                return ''
              end
              return '🔴 recording macro: ' .. reg
            end,
            cond = function()
              local reg = vim.fn.reg_recording()
              return reg ~= ''
            end,
          },
        },
        lualine_y = {
          { 'encoding' },
          { 'fileformat' },
        },
        lualine_z = {
          { 'filetype', icon_only = false, padding = { left = 1, right = 1 } },
          {
            function()
              return require 'custom.UI.lualine-commands.get_clients'()
            end,
          },
          {
            function()
              local schema = require('yaml-companion').get_buf_schema(0)
              if schema.result[1].name == 'none' then
                return '🔬 no schema'
              end
              return '🔬' .. schema.result[1].name
            end,
            cond = function()
              local ft = vim.bo.filetype
              if ft == 'yaml' or ft == 'yaml.docker-compose' or ft == 'yaml.ansible' then
                return true
              end
              return false
            end,
          },
          { 'rest' },
        },
      },
      extensions = { 'neo-tree', 'lazy' },
    }
  end,
}
