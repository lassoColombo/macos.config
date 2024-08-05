vim.keymap.set({ 'n' }, 'q', '<cmd>q<CR>', { desc = 'quit', buffer = true })

vim.keymap.set('n', 'dd', function()
  -- Save the current window and cursor position
  local current_win = vim.api.nvim_get_current_win()
  local current_pos = vim.fn.getpos '.'

  local qf_list = vim.fn.getqflist()
  local current_idx = vim.fn.line '.'
  table.remove(qf_list, current_idx)
  vim.fn.setqflist(qf_list, 'r')

  if current_idx <= #qf_list then
    vim.cmd('cc ' .. current_idx)
  end

  -- Restore the window and cursor position
  vim.api.nvim_set_current_win(current_win)
  vim.fn.setpos('.', current_pos)
end, { desc = '[D]elete quickfix entry' })
