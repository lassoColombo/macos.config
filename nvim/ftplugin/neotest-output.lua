vim.keymap.set({ 'n' }, 'q', '<cmd>q<CR>', { desc = 'quit', buffer = true })

-- vim.api.nvim_create_autocmd({ 'BuufEnter' }, {
--   callback = function()
--     vim.api.nvim_win_set_cursor(0, { vim.api.nvim_buf_line_count(0), 0 })
--   end,
--   opts = { buffer = 0 },
-- })
