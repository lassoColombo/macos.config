local function get_clients()
  local clients = vim.lsp.get_clients()
  local n = #clients
  local s = ''

  for i = 1, n - 1 do
    local name = clients[i].name
    if name ~= 'null-ls' then
      s = s .. '⚙︎ ' .. name .. ' '
    end
  end

  local name = clients[#clients].name
  if name ~= 'null-ls' then
    s = s .. '⚙︎ ' .. name
  end
  return s
end
return get_clients
