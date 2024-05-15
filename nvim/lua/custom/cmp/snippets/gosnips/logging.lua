local u = require 'custom.cmp.snippets.utils'
return {
  u.s(
    'Println',
    u.fmt('fmt.Println({})', {
      u.i(1, 'arg'),
    })
  ),
  u.s(
    'Printf',
    u.fmt('fmt.Printf("{}\\n", {})', {
      u.i(1, 'content'),
      u.i(2, 'vars'),
    })
  ),
}
