local function OScapture(cmd, raw)
  local f = assert(io.popen(cmd, 'r'))
  local s = assert(f:read '*a')
  f:close()
  if raw then
    return s
  end
  s = string.gsub(s, '^%s+', '')
  s = string.gsub(s, '%s+$', '')
  s = string.gsub(s, '[\n\r]+', ' ')
  return s
end

vim.api.nvim_create_user_command('GitInspect', function(opts)
  local rev = opts.args:match '^%s*(.-)%s*$'
  if rev == '' then
    rev = 'HEAD~1'
  end
  local file_path = vim.api.nvim_buf_get_name(0)
  local cwd = vim.fn.getcwd()
  local path = vim.fn.fnamemodify(file_path, ':.')
  -- local buf = vim.api.nvim_create_buf(true, false)
  -- vim.api.nvim_buf_set_lines(buf, 0, -1, false, { out })
end, { bang = false, range = false, nargs = '?' })
