local u = require 'custom.cmp.snippets.utils'

return {
  u.s(
    'if',
    u.fmt(
      [[
      - name: DDD {}
      ansible.builtin.debug:
        var: {}
      }}
  ]],
      {
        u.i(1, ''),
        u.f(function(args, parent, user_args)
          return args[1][1]
        end, { 1 }),
      }
    )
  ),
}
