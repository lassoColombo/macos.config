local u = require 'custom.cmp.snippets.utils'
return {
  u.s(
    'for-range-map',
    u.fmt(
      [[
      for {}, {} := range {} {{
        {}
      }}
  ]],
      {
        u.i(1, 'key'),
        u.i(2, 'value'),
        u.i(3, 'Map'),
        u.i(4, 'Body'),
      }
    )
  ),
  u.s(
    'for-range-slice',
    u.fmt(
      [[
      for i, {} := range {} {{
        {}
      }}
  ]],
      {
        u.i(1, 'Value'),
        u.i(2, 'Slice'),
        u.i(3, 'Body'),
      }
    )
  ),
  u.s(
    'whilei',
    u.fmt(
      [[
      i := 0
      for i < {} {{
        {}
      }}
  ]],
      {
        u.i(1, 'End'),
        u.i(2, 'Body'),
      }
    )
  ),
  u.s(
    'for',
    u.fmt(
      [[
     for {{
      {}
     }}
  ]],
      {
        u.i(1, 'Body'),
      }
    )
  ),
  -- -- :TODO: bring i++/i+= to be a choichenode
  u.s(
    'fori',
    u.fmt(
      [[
     for i := {}; i < {}; i+={} {{
      {}
     }}
  ]],
      {
        u.i(1, 'Start'),
        u.i(2, 'End'),
        u.i(3, 'Increment'),
        u.i(4, 'Body'),
      }
    )
  ),
  u.s(
    'forii',
    u.fmt(
      [[
     for i := 0; i < {} - 1; i++; {{
      {}
     }}
  ]],
      {
        u.i(1, 'Limit'),
        u.i(2, 'Body'),
      }
    )
  ),
}
