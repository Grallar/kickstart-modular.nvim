local h = require 'custom.helpers-luasnip'
local ls = require 'luasnip'

return {
  h.s({
    trig = 'lll',
    snippetType = 'autosnippet',
    wordTrig = false,
    condition = function()
      return h.in_mathzone() == false
    end,
  }, h.t '\\lgem '),
}
