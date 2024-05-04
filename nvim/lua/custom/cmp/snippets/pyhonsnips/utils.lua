local u = require 'custom.cmp.snippets.utils'

return {
  u.s('pprint', {
    u.t "__import__('pprint').pprint(",
    u.i(1, 'expression'),
    u.t ')',
  }),
}
