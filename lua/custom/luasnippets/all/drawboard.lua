local h = require 'custom.helpers-luasnip'

return {
  --[=[h.s(
    { trig = 'Header ', snippetType = 'autosnippet' },
    h.fmta(
      [[
        \header {
           % Els camps següents estan centrats
         dedication = <>
         title = <>
         subtitle = <>
         subsubtitle = <>
           % Els camps següents es distribueixen regularment sobre una línia.
           % El camp "instrument" també apareix a les pàgines següents
         instrument = <>
         poet = <>
         composer = <>
           % Els camps següents se situen als extrems oposats de la mateixa línia
         meter = <>
         arranger = <>
           % Els camps següents estan centrats a la part inferior
         tagline = <>
         copyright = <>
        }
        ]],
      {
        h.i(1, 'Dedicatòria'),
        h.i(2, 'Títol'),
        h.i(3, 'Subtítol'),
        h.i(4, 'Subsubtítol'),
        h.i(5, 'Instrument'),
        h.i(6, 'Poeta'),
        h.i(7, 'Compositor'),
        h.i(8, 'Mètrica'),
        h.i(9, 'Arranjador'),
        h.i(10, '???'),
        h.i(11, 'Copyright'),
      }
    )
  ),
    --]=]
}
