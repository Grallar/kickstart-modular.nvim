local M = {}

-- Be sure to explicitly define these LuaSnip node abbreviations!
local ls = require 'luasnip'
M.s = ls.snippet
M.sn = ls.snippet_node
M.t = ls.text_node
M.i = ls.insert_node
M.f = ls.function_node
M.d = ls.dynamic_node
M.c = ls.choice_node
M.r = ls.restore_node
M.fmt = require('luasnip.extras.fmt').fmt
M.fmta = require('luasnip.extras.fmt').fmta
M.rep = require('luasnip.extras').rep

function M.get_visual(args, parent)
  if #parent.snippet.env.LS_SELECT_RAW > 0 then
    return M.sn(nil, M.i(1, parent.snippet.env.LS_SELECT_RAW))
  else
    return M.sn(nil, M.i(1, ''))
  end
end

M.line_begin = function()
  return require('luasnip.extras.expand_conditions').line_begin() == 1
end
M.in_mathzone = function() -- math context detection
  return vim.fn['vimtex#syntax#in_mathzone']() == 1
end
M.in_text = function()
  return not M.in_mathzone()
end
M.in_comment = function() -- comment detection
  return vim.fn['vimtex#syntax#in_comment']() == 1
end
M.in_env = function(name) -- generic environment detection
  local is_inside = vim.fn['vimtex#env#is_inside'](name)
  return (is_inside[1] > 0 and is_inside[2] > 0)
end
-- A few concrete environments---adapt as needed
M.in_equation = function() -- equation environment detection
  return M.in_env 'equation'
end
M.in_itemize = function() -- itemize environment detection
  return M.in_env 'itemize'
end
M.in_tikz = function() -- TikZ picture environment detection
  return M.in_env 'tikzpicture'
end

return M
