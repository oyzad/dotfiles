---@diagnostic disable: undefined-global
local ls = require("luasnip")
local s = ls.snippet
local f = ls.function_node
local i = ls.insert_node
local t = ls.text_node
local fmta = require("luasnip.extras.fmt").fmta
local fmt = require("luasnip.extras.fmt").fmt

local MATH_NODES = {
	formula = true,
	math = true,
  equation = true,      -- Added
  math_equation = true, -- Added
}

local NON_MATH_NODES = {
	code = true,
	text = true,
	raw_blck = true,
	source_file = true,
}

local function is_math_mode()
	local node = vim.treesitter.get_node({ ignore_injections = false })
	while node do
		if NON_MATH_NODES[node:type()] then
			return false
		elseif MATH_NODES[node:type()] then
			return true
		end
		node = node:parent()
	end
	return false -- Changed to false by default for safety
end

return {
	-- math modes
	s({ trig = "mt", snippetType = "autosnippet" },
		fmta("$<>$ ", { i(1) })
	),
	s({ trig = "mmt", snippetType = "autosnippet" },
		fmta("$ <> $ ", { i(1) })
	),
	s({ trig = "i" },
		fmt("==>", {})
	),
	s({ trig = ";;", snippetType = "autosnippet" }, { t(";") }),
	s({ trig = "(%S+);", regTrig = true, snippetType = "autosnippet" },
		fmta([[$<>$ <>]], {
			f(function(_, snip) return snip.captures[1] end),
			i(0)
		}),
		{ condition = function() return not is_math_mode() end }
	),
	-- Fixed the ** snippet below (removed extra parens)
	s({
		trig = "**",
		name = "superscript",
		wordTrig = false,
		snippetType = "autosnippet",
		condition = is_math_mode
	}, fmt("^({})", { i(1) })),

	s({
		trig = "uq",
		name = "square exponent",
		wordTrig = false,
		snippetType = "autosnippet",
		condition = is_math_mode
	}, t("^2")),

	s({
		trig = "*2",
		name = "square exponent",
		wordTrig = false,
		snippetType = "autosnippet",
		condition = is_math_mode
	}, t("^2")),

	s({
		trig = "*3",
		name = "cubed exponent",
		wordTrig = false,
		snippetType = "autosnippet",
		condition = is_math_mode
	}, t("^3")),

	s({
		trig = "*4",
		name = "quartic exponent",
		wordTrig = false,
		snippetType = "autosnippet",
		condition = is_math_mode
	}, t("^4")),

	s({
		trig = "*5",
		name = "quintic exponent",
		wordTrig = false,
		snippetType = "autosnippet",
		condition = is_math_mode
	}, t("^5")),

	s({
		trig = "#",
		name = "code (inline math)",
		desc = "Tells tree-sitter that we are in a code block",
		wordTrig = false,
		condition = is_math_mode
	}, fmt("#({})", { i(1) })),

	-- limits and operators
	s({ trig = "plus", name = "plus exponent", wordTrig = false }, t("^+")),
	s({ trig = "min", name = "minus exponent", wordTrig = false }, t("^-")),
	s({ trig = "lim", name = "limit", wordTrig = true }, fmt("lim_({}) ", { i(1) })),
	s({ trig = "integral", name = "integral (definite)", wordTrig = true }, fmt("integral_({})^({}) ", { i(1), i(2) })),
	s({ trig = "sum", name = "summation", wordTrig = true }, fmt("sum_({})^({}) ", { i(1), i(2) })),
	s({ trig = "inf", name = "infinity", wordTrig = true }, t("infinity")),
	s({ trig = "abs", name = "absolute value", wordTrig = true }, fmt("abs({})", { i(1) })),
	s({ trig = "cent" },
		fmta("#align(center)[<>]", { i(1) })
	),
	s({ trig = "v" },
		fmta("#let <> = <>", { i(1), i(2) })
	),
	s({ trig = "f" },
		fmta([[
#let <> = (<>) = {
	<>
}]], { i(1), i(2), i(3) })
	),
}
