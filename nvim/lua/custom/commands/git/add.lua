vim.api.nvim_create_user_command('GitAdd', function(opts)
  local file_path = vim.api.nvim_buf_get_name(0)
end, { bang = true, range = true })
