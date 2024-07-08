local function is_private_ssh_key(file)
  if file:match '.pub$' then
    return false
  end
  return true
end

-- Function to list all private SSH keys in the ~/.ssh directory
local function list_private_ssh_keys()
  local ssh_dir = os.getenv 'HOME' .. '/.ssh'

  -- Open the directory
  local paths = {}
  local p = io.popen('ls -1 "' .. ssh_dir .. '"')
  ---@diagnostic disable-next-line: need-check-nil
  for file in p:lines() do
    -- Construct the full file path
    local file_path = ssh_dir .. '/' .. file

    -- Check if the file is a regular file and a private SSH key
    local attr = io.popen('test -f "' .. file_path .. '" && echo "file"'):read '*l'
    if attr == 'file' and is_private_ssh_key(file) then
      table.insert(paths, file_path)
    end
  end
  return paths
end

vim.api.nvim_create_user_command('SshAdd', function(opts)
  local paths = list_private_ssh_keys()
  vim.ui.select(paths, {
    prompt = 'Select key to add',
    format_item = function(item)
      return item
    end,
  }, function(choice)
    if choice == nil then
      return
    end
    local command = '!ssh-add ' .. choice
    os.execute(command)
    vim.notify('added key' .. choice, vim.log.levels.INFO)
  end)
end, {})
