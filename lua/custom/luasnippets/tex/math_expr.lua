local h = require 'custom.helpers-luasnip'

return {
  h.s({
    trig = 'df',
    -- snippetType = 'autosnippet',
    condition = h.in_mathzone,
  }, {
    h.t '\\diff ',
  }),

  h.s(
    {
      trig = '([%a%)%]%}])(%d+) ',
      descr = 'undefined length numeral subscript',
      condition = h.in_mathzone,
      snippetType = 'autosnippet',
      regTrig = true,
      wordTrig = false,
    },
    h.fmta([[<>_{<>} ]], {
      h.f(function(_, snip)
        return snip.captures[1]
      end),
      h.f(function(_, snip)
        return snip.captures[2]
      end),
    })
  ),

  --[=[h.s(
    {
      trig = '([%a%)%]%}])(%a)',
      descr = 'single letter subscript',
      snippetType = 'autosnippet',
      condition = h.in_mathzone,
      regTrig = true,
      wordTrig = false,
    },
    h.fmta([[<>_{<>} ]], {
      h.f(function(_, snip)
        return snip.captures[1]
      end),
      h.f(function(_, snip)
        return snip.captures[2]
      end),
    })
  ),
  --]=]

  h.s({
    trig = '^',
    descr = 'enclose superscript',
    snippetType = 'autosnippet',
    condition = h.in_mathzone,
    wordTrig = false,
  }, h.fmta([[^{<>}]], h.d(1, h.get_visual))),

  h.s({
    trig = '_',
    descr = 'enclose subscript',
    snippetType = 'autosnippet',
    condition = h.in_mathzone,
    wordTrig = false,
  }, h.fmta([[_{<>}]], h.d(1, h.get_visual))),

  h.s(
    {
      trig = '(%w?)bar',
      descr = 'complement bar',
      snippetType = 'autosnippet',
      condition = h.in_mathzone,
      regTrig = true,
      wordTrig = false,
    },
    h.fmta([[\overline{<>}]], {
      h.f(function(_, snip)
        return snip.captures[1]
      end),
    })
  ),

  --[=[h.s(
        {
            trig = '(%a?)vec',
            descr = 'vector arrow',
            snippetType = 'autosnippet',
            condition = h.in_mathzone,
            regTrig = true,
            wordTrig = false
        },
            h.fmta(
            [[\vec{<>}]]
        )
    )
    --]=]

  --[=[ Try at transalting Gilles Castel's fraction regex. Won't work because of Lua pattern's simplifications compared to normal regex
  h.s(
    {
      trig = [[((%d*)(%\)?([A-Za-z]+)(%^%{%d+%})?(_%{%d+%})?)/]],
      descr = 'infernal fraction match, proud of it. See comments',
      snippetType = 'autosnippet',
      condition = h.in_mathzone,
      wordTrig = false,
      regTrig = true,
    },
    h.fmta([[\frac{<>}{<>}]], {
      h.f(function(_, snip)
        return snip.captures[1]
      end),
      h.i(0),
    })
  ),]=]

  h.s(
    {
      trig = [[(%d+)/]],
      descr = 'simple fraction starter',
      snippetType = 'autosnippet',
      condition = h.in_mathzone,
      wordTrig = false,
      regTrig = true,
    },
    h.fmta([[\frac{<>}{<>}]], {
      h.f(function(_, snip)
        return snip.captures[1]
      end),
      h.i(1),
    })
  ),

  h.s(
    {
      trig = 'ff',
      descr = 'fraction with nothing fraction',
      snippetType = 'autosnippet',
      condition = h.in_mathzone,
    },
    h.fmta([[\frac{<>}{<>}]], {
      h.d(1, h.get_visual),
      h.i(2),
    })
  ),

  h.s(
    {
      trig = 'sm',
      descr = 'summation',
      snippetType = 'autosnippet',
      condition = h.in_mathzone,
    },
    h.fmta([[\sum_{<>}^{<>}\left(<>\right)]], {
      h.i(1, 'n'),
      h.i(2, '\\infty'),
      h.d(3, h.get_visual),
    })
  ),
}
