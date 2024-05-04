return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },

  keys = {
    {
      '<leader>cif',
      '<cmd>ConformInfo<cr>',
      mode = 'n',
      desc = '[C]ode [I]nfo [F]ormat',
    },
    {
      '<leader>cf',
      function()
        require('conform').format { async = true, lsp_fallback = true }
      end,
      mode = { 'n', 'v' },
      desc = '[C]ode [F]ormat',
    },
    {
      '<leader>tf',
      function()
        local log_level = (vim.g.autoformat_on_save and vim.log.levels.WARN or vim.log.levels.INFO)
        vim.g.autoformat_on_save = not vim.g.autoformat_on_save
        vim.notify('set autoformat on save to ' .. tostring(vim.g.autoformat_on_save), log_level)
      end,
      mode = 'n',
      desc = '[T]oggle auto[F]ormat',
    },
  },

  opts = function()
    local opts = {
      notify_on_error = true,
      format_on_save = function(bufnr)
        -- Disable with a global variable
        if not vim.g.autoformat_on_save then
          return
        end
        -- Disable autoformat on certain filetypes
        local ignore_filetypes = { 'sql', 'java' }
        if vim.tbl_contains(ignore_filetypes, vim.bo[bufnr].filetype) then
          return
        end
        -- Disable autoformat for files in a certain path
        local ignore_paths = { '/node_modules/', '/venv/', '/.venv/' }
        local bufname = vim.api.nvim_buf_get_name(bufnr)
        for _, path in ipairs(ignore_paths) do
          if bufname:match(path) then
            return
          end
        end
        return { timeout_ms = 500, lsp_fallback = true }
      end,

      formatters_by_ft = {
        lua = { 'stylua' },
        python = { 'isort', 'black' },
        sql = { 'sqlfmt' },
        yaml = { 'prettier' },
        json = { 'prettier' },
        -- Conform can also run multiple formatters sequentially
        -- go = { 'goimports', 'gofumpt' },
        -- You can use a sub-list to tell conform to run *until* a formatter
        -- is found.
        -- javascript = { { "prettierd", "prettier" } },
      },
    }
    -- puntual configuration
    -- require('conform').formatters.black = {
    --   args = { '--lime-length', '130' },
    -- }
    return opts
    -- :NOTE: old user commands to toggle autoformat
    --
    -- disable
    -- vim.api.nvim_create_user_command('FormatDisable', function(args)
    --   vim.g.autoformat_on_save = true
    --   vim.notify('set autoformat on save to ' .. tostring(not vim.g.autoformat_on_save), vim.log.levels.INFO)
    -- end, {
    --   desc = 'Disable autoformat-on-save',
    -- })
    -- -- enable
    -- vim.api.nvim_create_user_command('FormatEnable', function()
    --   vim.g.autoformat_on_save = false
    --   vim.notify('set autoformat on save to ' .. tostring(not vim.g.autoformat_on_save), vim.log.levels.INFO)
    -- end, {
    --   desc = 'Enable autoformat-on-save',
    -- })
    -- -- toggle
    -- vim.api.nvim_create_user_command('FormatToggle', function(args)
    --   local log_level = (vim.g.autoformat_on_save and vim.log.levels.WARN or vim.log.levels.INFO)
    --   vim.g.autoformat_on_save = not vim.g.autoformat_on_save
    --   vim.notify('set autoformat on save to ' .. tostring(not vim.g.autoformat_on_save), vim.log.levels.INFO)
    -- end, {
    --   desc = 'Toggle autoformat on save',
    -- })
  end,
}
