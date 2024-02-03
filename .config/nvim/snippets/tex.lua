local ls = require('luasnip')
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local fmta = require('luasnip.extras.fmt').fmta
local rep = require('luasnip.extras').rep

return {
    s(
        { trig = 'en' },
        fmta(
            [[
      \begin{<>}
          <>
      \end{<>}
      ]],
            {
                i(1),
                i(2),
                rep(1),
            }
        )
    ),
    s(
        { trig = 'th' },
        fmta(
            [[
      \begin{thm}
          <>
      \end{thm}
      ]],
            {
                i(1),
            }
        )
    ),
    s(
        { trig = 'pf' },
        fmta(
            [[
      \begin{proof}
          <>
      \end{proof}
      ]],
            {
                i(1),
            }
        )
    ),
    s(
        { trig = 'e' },
        fmta(
            [[
      \[
          <>
      \]
      ]],
            {
                i(1),
            }
        )
    ),
    s({ trig = '->', snippetType = 'autosnippet' }, t('\\to')),
    s({ trig = '=>', snippetType = 'autosnippet' }, t('\\implies')),
    s({ trig = '|>', snippetType = 'autosnippet' }, t('\\mapsto')),
    s({ trig = '<-', snippetType = 'autosnippet' }, t('\\gets')),
    s({ trig = '<=>', snippetType = 'autosnippet' }, t('\\iff')),
    s({ trig = '>=', snippetType = 'autosnippet' }, t('\\geq')),
    s({ trig = '<=', snippetType = 'autosnippet' }, t('\\leq')),
    s(
        { trig = 'ff' },
        fmta('\\frac{<>}{<>}', {
            i(1),
            i(2),
        })
    ),
    s(
        { trig = 'eq' },
        fmta(
            [[
      \begin{equation*}
          <>
      \end{equation*}
      ]],
            { i(1) }
        )
    ),
}
