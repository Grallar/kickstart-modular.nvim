local h = require 'custom.helpers-luasnip'

local base_config = function(trigger)
  return { trig = '(%d*)' .. trigger, snippetType = 'autosnippet', condition = h.in_mathzone, wordTrig = false, regTrig = true }
end

return {
  h.s(base_config 'aa', {
    h.t '\\alpha',
  }),
  h.s(base_config 'bb', {
    h.t '\\beta',
  }),
  h.s(base_config 'gg', {
    h.t '\\gamma',
  }),
  h.s(base_config 'll', {
    h.t '\\lambda',
  }),
  h.s(base_config 'RR', {
    h.t '\\mathbb{R}',
  }),
  h.s(base_config 'ZZ', {
    h.t '\\mathbb{Z}',
  }),
  h.s(base_config 'NN', {
    h.t '\\mathbb{N}',
  }),
  h.s(base_config 'QQ', {
    h.t '\\mathbb{Q}',
  }),

  h.s(base_config 'tot', {
    h.t '\\forall',
  }),
  h.s(base_config 'ex', {
    h.t '\\exists',
  }),
}
