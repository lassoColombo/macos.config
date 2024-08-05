local function append_client(s, client, buf, isLast)
  local name = client.name
  if name == 'null-ls' then
    return s
  end
  local bufs = client.attached_buffers
  if not bufs[buf] then
    return s
  end

  s = s .. '🔭' .. name
  if not isLast then
    s = s .. ' '
  end
  return s
end

local function get_clients()
  local clients = vim.lsp.get_clients()
  local n = #clients
  local s = ''
  local buf = vim.api.nvim_get_current_buf()

  for i = 1, n - 1 do
    s = append_client(s, clients[i], buf, false)
  end
  s = append_client(s, clients[#clients], buf, true)

  if s == '' then
    return '🔭 no LSP '
  end

  return s
end
return get_clients
