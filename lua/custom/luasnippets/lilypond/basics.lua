local h = require 'custom.helpers-luasnip'

local optional_node = function(pos, textbegin, textend)
  textbegin = textbegin or ''
  textend = textend or { '', '' }
  return h.c(pos, { h.sn(nil, { h.t(textbegin), h.i(1), h.t(textend) }), h.t '' })
end

return {
  --[=[ h.s({
    trig = 'cis',
    snippetType = 'autosnippet',
    show_condition = function()
      return false
    end,
  }, h.t 'trans'),
    --]=]
  h.s(
    { trig = 'Header ', descr = 'Basic header choice tree', snippetType = 'autosnippet' },
    h.fmta(
      [[
        \header {
        <title><composer><arranger><others>
        }
        ]],
      {
        title = optional_node(1, ' title = '),
        composer = optional_node(2, ' composer = '),
        arranger = optional_node(3, ' arranger = '),
        others = h.c(4, {
          h.sn(
            nil,
            h.fmta('<><poet><subtitle><subsubtitle><instrument><meter><tagline><copyright><dedication>', {
              h.i(1),
              poet = optional_node(2, ' poet = '),
              subtitle = optional_node(3, ' subtitle = '),
              subsubtitle = optional_node(4, ' subsubtitle = '),
              instrument = optional_node(5, ' instrument = '),
              meter = optional_node(6, ' meter = '),
              tagline = optional_node(7, ' tagline = '),
              copyright = optional_node(8, ' copyright = '),
              dedication = optional_node(9, ' dedication = '),
            })
          ),
          h.t '',
        }),
      }
    )
  ),
}
