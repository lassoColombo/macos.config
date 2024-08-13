return {
  'folke/persistence.nvim',
  event = 'BufReadPre', -- this will only start session saving when an actual file was opened
  opts = {},
  --   -- :FIXME: . Create autocommand to clear unnamed and other nasty buffers before restoring a session
  -- init = function()
  --   vim.api.nvim_create_autocmd('PersistenceSavePre', {
  --     callback = function()
  --       for _, buf in ipairs(vim.api.nvim_list_bufs()) do
  --         if vim.api.nvim_buf_get_name(buf) == '' or vim.api.nvim_buf_get_option(buf, 'filetype') == '' then
  --           if not vim.api.nvim_buf_get_option(buf, 'buflisted') then
  --             pcall(vim.api.nvim_buf_delete, buf, { force = true })
  --           end
  --         end
  --       end
  --     end,
  --   })
  --   return {}
  -- end,
}
