-- [[ Basic Keymaps ]]keymaps
--  See `:help vim.keymap.set()`

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set({ 'n', 'v' }, '<Esc>', "<cmd>execute 'nohlsearch | NoiceDismiss'<CR>")
vim.keymap.set({ 'n', 'v' }, '<leader>p', '"+p', { desc = '[P]aste from system clipboard' })
vim.keymap.set({ 'n', 'v' }, '<leader>y', '"+y', { desc = '[Y]ank to system clipboard' })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', function()
  vim.diagnostic.goto_prev { float = { source = true } }
end, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', function()
  vim.diagnostic.goto_next { float = { source = true } }
end, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>cd', function()
  vim.diagnostic.open_float { source = true }
end, { desc = '[C]ode (line) [D]iagnostics' })

-- :FIXME: not working
-- vim.keymap.set('n', '<leader>r', ';.', { desc = '[R]epeat motion and action' })
-- Buffer keymaps
vim.keymap.set('n', '<leader>bw', '<cmd>w<CR>', { desc = '[B]uffer [W]rite' })
vim.keymap.set({ 'n', 'i' }, '<C-s>', '<cmd>w<cr><esc>', { desc = '[B]uffer [W]rite' })
vim.keymap.set('n', '<leader>ww', '<cmd>wa<CR>', { desc = '[W]orkspace [W]rite' })
vim.keymap.set('n', '<leader>wq', '<cmd>qa<CR>', { desc = '[W]orkspace [Q]quit' })
vim.keymap.set('n', '<leader>wQ', '<cmd>qa!<CR>', { desc = '[W]orkspace [Q]uit force' })

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
vim.keymap.set('n', '<leader>W', '<cmd>close<CR>', { desc = '[W]indow close' })
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
vim.keymap.set('n', '<leader>tw', function()
  vim.wo.wrap = not vim.wo.wrap
  vim.notify('set line wrap to ' .. tostring(vim.wo.wrap), vim.log.levels.WARN)
end, { desc = '[T]oggle [W]rap' })

-- toggle line relativeness
vim.keymap.set('n', '<leader>tl', function()
  vim.opt.relativenumber = not vim.opt.relativenumber
  local log_level = (vim.opt.relativenumber and vim.log.levels.INFO or vim.log.levels.WARN)
  vim.notify('set line wrap to ' .. tostring(vim.opt.relativenumber), log_level)
end, { desc = '[T]oggle relative [L]ines' })

-- toggle lines
vim.keymap.set('n', '<leader>tL', function()
  vim.opt.number = not vim.opt.number
  local log_level = (vim.opt.number and vim.log.levels.INFO or vim.log.levels.WARN)
  vim.notify('set line wrap to ' .. tostring(vim.opt.number), log_level)
end, { desc = '[T]oggle [L]ines' })

-- toggle diagnostics
vim.keymap.set('n', '<leader>td', function()
  if vim.diagnostic.is_disabled() then
    vim.diagnostic.enable()
  else
    vim.diagnostic.disable()
  end
  local is_disabled = vim.diagnostic.is_disabled()
  local log_level = (is_disabled and vim.log.levels.WARN or vim.log.levels.INFO)
  vim.notify('set diagnostics to ' .. tostring(not is_disabled), log_level)
end, { desc = '[T]oggle [D]iagnostics' })

-- toggle lines
vim.keymap.set('n', '<leader>tL', function()
  vim.opt.number = not vim.opt.number
  local log_level = (vim.opt.number and vim.log.levels.INFO or vim.log.levels.WARN)
  vim.notify('set line wrap to ' .. tostring(vim.opt.number), log_level)
end, { desc = '[T]oggle [L]ines' })
