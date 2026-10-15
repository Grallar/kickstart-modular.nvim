local h = require 'custom.helpers-luasnip'
local ls = require 'luasnip'

return {
  h.s(
    { trig = 'beg', snippetType = 'autosnippet' },
    h.fmta(
      [[
            \begin{<>}
                <>
            \end{<>}
      ]],
      {
        h.i(1),
        h.i(0),
        h.rep(1),
      }
    )
  ),
  h.s(
    { trig = 'mm', snippetType = 'autosnippet' },
    h.fmta('$<>$<>', {
      h.i(1),
      h.i(0),
    })
  ),
  h.s(
    { trig = 'tt', snippetType = 'autosnippet', condition = h.in_mathzone },
    h.fmta('\\text{<>}', {
      h.i(1),
    })
  ),
}
