-- These are the default luasnip abbreviations. I explicitly
-- declare them just for the sake of complaining LSP.
local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

-- local in_mathzone = function()
--   -- The `in_mathzone` function requires the VimTeX plugin
--   return vim.fn["vimtex#syntax#in_mathzone"]() == 1
-- end
-- Then include `condition = in_mathzone` to any snippet you want to
-- expand only in math contexts.
--
-- local tsutils = require("tsutils")
-- local in_mathzone = tsutils.in_mathzone
local function in_mathzone()
  return vim.api.nvim_eval("vimtex#syntax#in_mathzone()") == 1
end

-- local mathzone = require("snippets/markdown/detect-mathzone")
-- local in_mathzone = mathzone.in_mathzone
local get_visual = function(args, parent)
  if #parent.snippet.env.SELECT_RAW > 0 then
    return sn(nil, i(1, parent.snippet.env.SELECT_RAW))
  else
    return sn(nil, i(1))
  end
end

return {
  s(
    { name = "Fraction", trig = "ff", snippetType = "autosnippet" },
    fmta("\\frac{<>}{<>}", {
      d(1, get_visual),
      i(2),
    }),
    { condition = in_mathzone }
  ),
}
