local u = require 'custom.cmp.snippets.utils'

return {
  u.s(
    'if',
    u.fmt(
      [[
      if {} {{
        {}
      }}
  ]],
      {
        u.i(1, 'Condition'),
        u.i(2, 'Expression'),
      }
    )
  ),
  u.s(
    'if-else',
    u.fmt(
      [[
      if {} {{
        {}
      }} else {{
        {}
      }}
  ]],
      {
        u.i(1, 'Condition'),
        u.i(2, 'Expression'),
        u.i(3, 'Expression'),
      }
    )
  ),
  u.s(
    'if-elseif-else',
    u.fmt(
      [[
      if {} {{
        {}
      }} else if {} {{
        {}
      }} else {{
        {}
      }}
  ]],
      {
        u.i(1, 'Condition'),
        u.i(2, 'Expression'),
        u.i(3, 'Condition'),
        u.i(4, 'Expression'),
        u.i(5, 'Expression'),
      }
    )
  ),
  u.s(
    'elseif',
    u.fmt('else if {} {{\n  {}\n}}', {
      u.i(1, 'Condition'),
      u.i(2, 'Expression'),
    })
  ),
  u.s(
    'else',
    u.fmt('else {{\n  {}\n}}', {
      u.i(1, 'Expression'),
    })
  ),
  u.s(
    'switch',
    u.fmt(
      [[
      switch {} {{
        case {}:
          {}
        default:
          {}
      }}
  ]],
      {
        u.i(1, 'Var'),
        u.i(2, 'Case'),
        u.i(3, 'CaseBody'),
        u.i(4, 'DefaultBody'),
      }
    )
  ),
}