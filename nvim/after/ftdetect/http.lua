if vim.filetype then
  vim.filetype.add {
    extension = {
      ['http'] = 'http',
    },
  }
else
  vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
    pattern = {
      '*.http',
    },
    callback = function()
      vim.bo.filetype = 'http'
    end,
  })
end
