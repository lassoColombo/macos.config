-- show json path in the winbar
if vim.fn.exists '+winbar' == 1 then
  vim.opt_local.winbar = "%{%v:lua.require'jsonpath'.get()%}"
end

-- send json path to clipboard
vim.keymap.set('n', '<Space>yp', function()
  vim.fn.setreg('+', require('jsonpath').get())
end, { desc = '[Y]ank json[P]ath', buffer = true })
