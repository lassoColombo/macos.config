return {
  'kazhala/close-buffers.nvim',
  opts = {
    filetype_ignore = {}, -- Filetype to ignore when running deletions
    file_glob_ignore = {}, -- File name glob pattern to ignore when running deletions (e.g. '*.md')
    file_regex_ignore = {}, -- File name regex pattern to ignore when running deletions (e.g. '.*[.]md')
    preserve_window_layout = { 'this', 'nameless' }, -- Types of deletion that should preserve the window layout
    next_buffer_cmd = function(windows) -- Custom function to retrieve the next buffer when preserving window layout
      -- :NOTE:
      -- Nvim-bufferline.lua can rearrange the buffer orders ignoring the buffer ID.
      -- The following will use the cycle command provided by nvim-bufferline.lua
      -- to get the next buffer when preserving the window layout.
      require('bufferline').cycle(1)
      local bufnr = vim.api.nvim_get_current_buf()
      for _, window in ipairs(windows) do
        vim.api.nvim_win_set_buf(window, bufnr)
      end
    end,
  },
  keys = {
    {
      '<leader>b',
      function()
        require('close_buffers').delete { type = 'this' } -- Delete the current buffer
      end,
      mode = 'n',
      desc = '[B]uffer [C]lose',
    },
    {
      '<leader>B',
      function()
        -- Define the options
        local choices = { 'all', 'all-force', 'other', 'hidden', 'nameless', 'regex', 'glob' }

        -- Prompt the user to select an option
        vim.ui.select(choices, {
          prompt = 'Select condition:',
          format_item = function(item)
            return item
          end,
        }, function(choice)
          -- Call the appropriate function based on user choice
          if choice == 'all' or choice == 'other' or choice == 'hidden' or choice == 'nameless' then
            require('close_buffers').delete { type = choice }
            return
          end
          if choice == 'all-force' then
            require('close_buffers').delete { type = choice, force = true }
          end
          if choice == 'regex' then
            vim.ui.input({ prompt = 'regex: ' }, function(input)
              if input then
                require('close_buffers').delete { regex = input }
              end
            end)
          end
          if choice == 'glob' then
            vim.ui.input({ prompt = 'glob: ' }, function(input)
              if input then
                require('close_buffers').delete { glob = input }
              end
            end)
          end
        end)
      end,
      mode = 'n',
      desc = '[B]uffer [C]lose on condition',
    },
    -- {
    --   '<leader>B',
    --   function()
    --     -- Define the options
    --     local choices = { 'numbered', 'list' }
    --     -- Prompt the user to select an option
    --     vim.ui.select(choices, {
    --       prompt = 'Select TOC format:',
    --       format_item = function(item)
    --         return 'Generate ' .. item .. ' TOC'
    --       end,
    --     }, function(choice)
    --       -- Call the appropriate function based on user choice
    --       if choice == 'numbered' then
    --         require('nvim-toc').generate_md_toc 'numbered'
    --       elseif choice == 'list' then
    --         require('nvim-toc').generate_md_toc 'list'
    --       end
    --     end)
    --   end,
    --   mode = 'n',
    --   desc = '[C]lose [B]uffers by condition',
    -- },
  },
}
