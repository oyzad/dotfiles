local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("typst", {
  -- Snippet for the energy equation you typed earlier
  s("energy", {
    t("$ M g h_("), i(1, "c w"), t(") = 1/2 m v^2 $")
  }),

  -- Snippet for your side-by-side figure
  s("fig2", {
    t({"#align(center + horizon)[", "  #figure(", "    gap: 1.25em,", '    image("media/'}), 
    i(1, ""), t('.png", width: 50%),'),
    t({"","    caption: ["}), 
    i(6, "caption"), t("],"),
    t({"", "  )", "]"})
  }),
})
