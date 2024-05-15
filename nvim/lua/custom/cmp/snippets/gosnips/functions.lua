local u = require 'custom.cmp.snippets.utils'

return {
  u.s(
    'defer-func',
    u.fmt(
      [[
      defer func({}) {} {{
        {}
      }}({})
  ]],
      {
        u.i(1, 'Args'),
        u.i(2, 'Return'),
        u.i(3, 'Body'),
        u.i(4, 'Input'),
      }
    )
  ),
  u.s(
    'go-func',
    u.fmt(
      [[
      go func({}) {} {{
        {}
      }}({})
  ]],
      {
        u.i(1, 'Args'),
        u.i(2, 'Return'),
        u.i(3, 'Body'),
        u.i(4, 'Input'),
      }
    )
  ),
  u.s(
    'function',
    u.fmt(
      [[
      func {}({}) {} {{
        {}
      }}
  ]],
      {
        u.i(1, 'FuncName'),
        u.i(2, 'Args'),
        u.i(3, 'Return'),
        u.i(4, 'Body'),
      }
    )
  ),
  u.s(
    'anonimous-function',
    u.fmt(
      [[
      func({}) {} {{
        {}
      }}
  ]],
      {
        u.i(1, 'Args'),
        u.i(2, 'Return'),
        u.i(3, 'Body'),
      }
    )
  ),
  u.s(
    'method',
    u.fmt(
      [[
      func ({}) {}({}) {} {{
        {}
      }}
  ]],
      {
        u.i(1, 'Receiver'),
        u.i(2, 'FuncName'),
        u.i(3, 'Args'),
        u.i(4, 'Return'),
        u.i(5, 'Body'),
      }
    )
  ),
}
