local helpers = require 'ts-node-action.helpers'

local function indent(text, spaces)
  return string.format('%s%s', string.rep(' ', spaces), text)
end

local function multiinsert(dest, ...)
  local src = { ... }
  for _, el in ipairs(src) do
    table.insert(dest, el)
  end
end

local function extract_args(node)
  local query = vim.treesitter.query.parse(
    'lua',
    [[
        (
          (function_declaration
           parameters: (parameters) @args)
        )
        ]]
  )
  local args = nil
  for _, capt, _ in query:iter_captures(node, 0) do
    args = capt
    break
  end
  return args
end

local function extract_fnname(node)
  local query = vim.treesitter.query.parse(
    'lua',
    [[
        (
          (function_declaration
           name: (identifier) @fnname)
        )
        ]]
  )
  local rettype = nil
  for _, capt, _ in query:iter_captures(node, 0) do
    rettype = capt
    break
  end
  return rettype
end

return {
  function(node)
    local args = extract_args(node)
    local fnname = extract_fnname(node)

    local _, indent_start, _, _ = node:range()
    local docstring = {}

    for i = 0, args:named_child_count() - 1 do
      -- stylua: ignore
      local fmtd_arg = indent(
        string.format(
          '--- @param %s',
          helpers.node_text(args:named_child(i))
        ), indent_start)
      table.insert(docstring, fmtd_arg)
    end

    multiinsert(docstring, indent('--- @return ', indent_start), '')

    -- :NOTE: this is here to mock the target node.
    -- if i were to give a real target node, its range would be overridden
    local fake_node = {}
    fake_node.range = function()
      local start_row, start_col, _, _ = node:range()
      return start_row, 0, start_row, 0
    end

    return docstring, { target = fake_node }
  end,

  name = 'generate doc for method',
}
