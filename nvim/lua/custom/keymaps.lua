-- [[ Basic Keymaps ]]keymaps
--  See `:help vim.keymap.set()`

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set({ 'n', 'v' }, '<Esc>', "<cmd>execute 'nohlsearch | NoiceDismiss'<CR>", { desc = 'dismiss hilight and notifications' })
vim.keymap.set({ 'n', 'v' }, '<leader>p', '"+p', { desc = '[P]aste from system clipboard' })
vim.keymap.set({ 'n', 'v' }, '<leader>y', '"+y', { desc = '[Y]ank to system clipboard' })

-- :FIXME: not working
-- vim.keymap.set('n', '<leader>r', ';.', { desc = '[R]epeat motion and action' })
--
-- Buffer keymaps
-- vim.keymap.set('n', '<leader>bw', '<cmd>w<CR>', { desc = '[B]uffer [W]rite' })
vim.keymap.set({ 'n', 'i' }, '<C-s>', '<cmd>w<cr><esc>', { desc = '[B]uffer [W]rite' })
vim.keymap.set('n', '<leader>Q', '<cmd>qa!<CR>', { desc = '[Q]uit (qa!)' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
-- vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.key
--  Use CTRL+<hjkl> to switch between windows
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<leader>|', '<cmd>vsplit<CR>', { desc = 'Split window vertically' })
vim.keymap.set('n', '<leader>-', '<cmd>hsplit<CR>', { desc = 'Split window horizontally' })
vim.keymap.set('n', '<leader>w', '<cmd>close<CR>', { desc = 'close [W]indow' })
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
vim.keymap.set('n', '<C-right>', '<cmd>vertical resize +5<CR>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-left>', '<cmd>vertical resize -5<CR>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-up>', '<cmd>horizontal resize +3<CR>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-down>', '<cmd>horizontal resize -3<CR>', { desc = 'Move focus to the lower window' })

-- toggle keymaps
-- toggle word wrap
vim.keymap.set('n', '<leader>1w', function()
  vim.wo.wrap = not vim.wo.wrap
  vim.notify('set line wrap to ' .. tostring(vim.wo.wrap), vim.log.levels.WARN)
end, { desc = '[U]I [W]rap' })

-- toggle lines
vim.keymap.set('n', '<leader>1L', function()
  vim.opt.number = not vim.opt.number
  local log_level = (vim.opt.number and vim.log.levels.INFO or vim.log.levels.WARN)
  vim.notify('set line wrap to ' .. tostring(vim.opt.number), log_level)
end, { desc = '[U]I [L]ines' })

-- toggle line relativeness
vim.keymap.set('n', '<leader>1l', function()
  vim.opt.relativenumber = not vim.opt.relativenumber
  local log_level = (vim.opt.relativenumber and vim.log.levels.INFO or vim.log.levels.WARN)
  vim.notify('set line wrap to ' .. tostring(vim.opt.relativenumber), log_level)
end, { desc = '[U]I relative [L]ines' })

-- toggle diagnostics
vim.keymap.set('n', '<leader>1d', function()
  if vim.diagnostic.is_enabled() then
    vim.diagnostic.enable(false)
  else
    vim.diagnostic.enable(true)
  end
  local is_enabled = vim.diagnostic.is_enabled()
  local log_level = (is_enabled and vim.log.levels.INFO or vim.log.levels.WARN)
  vim.notify('set diagnostics to ' .. tostring(not is_enabled), log_level)
end, { desc = '[U]I [D]iagnostics' })
