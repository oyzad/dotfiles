local install = function(plugin)
  vim.pack.add({ 'https://github.com/' .. plugin })
end

--install('sphamba/smear-cursor.nvim')
--require('smear_cursor').setup({
--  stiffness = 0.5,
--  trailing_stiffness = 0.49,
--  never_draw_over_target = false
--  
--})


install('nvim-lua/plenary.nvim')
install('epwalsh/obsidian.nvim')
require("obsidian").setup({
    workspaces = {
    {
      name = "Obsidian",
      path = "~/Documents/HOMEWORK/home/Obsidian",
    },
  },

    daily_notes = {
    folder = "Notes/1 Raw Notes/113 Daily",
  },
  disable_frontmatter = true

})

install('nvim-tree/nvim-web-devicons')
install('akinsho/bufferline.nvim')
require("bufferline").setup()

install('Saghen/blink.lib')
install('Saghen/blink.cmp')

require('blink.cmp').setup({
  appearance = { check_install_status = false },  
  keymap = {
      -- Setting to 'none' first clears any conflicting defaults
      preset = 'none',

      ['<Tab>'] = { 'select_and_accept', 'fallback' },
      ['<S-Tab>'] = { 'select_prev', 'fallback' },
      ['<CR>'] = { 'accept', 'fallback' },

      ['<C-n>'] = { 'select_next', 'fallback' },
      ['<C-p>'] = { 'select_prev', 'fallback' },
      ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
      ['<C-e>'] = { 'hide' },
   },
  appearance = {
    use_nvim_cmp_as_default = true,
    nerd_font_variant = 'mono'
  },

  sources = {
    default = { 'lsp', 'path', 'snippets', 'buffer' },
  },

  signature = { enabled = true }
})
-- File/help/anything picker
install('nvim-mini/mini.pick')
require("mini.pick").setup()

install('nvim-mini/mini.operators')
require("mini.operators").setup()

install('L3MON4D3/LuaSnip')
install('rafamadriz/friendly-snippets') -- Optional: provides thousands of defaults
require("luasnip.loaders.from_lua").lazy_load({paths = "~/.config/nvim/snippets/"})
local ls = require("luasnip")
local ls = require("luasnip")

require("luasnip.loaders.from_lua").lazy_load({
    paths = { vim.fn.stdpath("config") .. "/snippets" }
})

ls.config.set_config({
    enable_autosnippets = true,
})
vim.keymap.set({"i", "s"}, "<Tab>", function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  else
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", false)
  end
end, {silent = true})

vim.keymap.set({"i", "s"}, "<S-Tab>", function() ls.jump(-1) end, {silent = true})
-- File explorer
install('stevearc/oil.nvim')
require("oil").setup({
  keymaps = {
    ["g?"] = { "actions.show_help", mode = "n" },
    ["<CR>"] = "actions.select",
    ["<C-s>"] = { "actions.select", opts = { vertical = true } },
    ["<C-a>"] = { "actions.select", opts = { horizontal = true } },
    ["<C-t>"] = { "actions.select", opts = { tab = true } },
    ["<C-p>"] = "actions.preview",
    ["<C-c>"] = { "actions.close", mode = "n" },
    ["<C-r>"] = "actions.refresh",
    ["-"] = { "actions.parent", mode = "n" },
    ["_"] = { "actions.open_cwd", mode = "n" },
    ["`"] = { "actions.cd", mode = "n" },
    ["~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
    ["gs"] = { "actions.change_sort", mode = "n" },
    ["gx"] = "actions.open_external",
    ["g."] = { "actions.toggle_hidden", mode = "n" },
    ["g\\"] = { "actions.toggle_trash", mode = "n" },
  },
  use_default_keymaps = false,
  delete_to_trash = true,
})

-- Extend <C-a>/<C-x> to booleans and other things
install('nat-418/boole.nvim')
require("boole").setup({
  mappings = {
    increment = '<C-a>',
    decrement = '<C-x>',
  }
})

-- Display hints for keymaps
install('folke/which-key.nvim')

-- Automatically pair brackets, quotes, etc.
install('windwp/nvim-autopairs')
local autopairs = require('nvim-autopairs')
local Rule = require('nvim-autopairs.rule')

autopairs.setup({
    check_ts = true,
})

autopairs.add_rules({
  Rule("$", "$", "typst")
    :with_move(function(opts)
      return opts.prev_char:match(".%$") ~= nil
    end),
})
-- -- Highlight all occurrences of the symbol under the cursor
-- install('RRethy/vim-illuminate')
-- require('illuminate').configure({
--   providers = {
--     'lsp',
--     'treesitter',
--     'regex'
--   }
-- })

-- Show vertical lines as guides for indentation
install('lukas-reineke/indent-blankline.nvim')
require('ibl').setup({
  indent = {
    char = "▏",
  },
  scope = {
    enabled = true,
    show_start = false,
    show_end = false,
    -- highlight = { "IndentBlanklineContextChar" }
  },
  exclude = {
    filetypes = { "help", "terminal", "dashboard", "lspinfo" },
    buftypes = { "terminal", "nofile" },
  },
})

-- Icons used by oil.nvim
install('nvim-mini/mini.icons')
require('mini.icons').setup()

-- Edit surrounding brackets
install('kylechui/nvim-surround')
require('nvim-surround').setup()

-- LaTeX stuff
install('lervag/vimtex')
vim.g.vimtex_view_method = 'zathura'
vim.g.vimtex_compiler_latexmk_engines = {
  _ = "-lualatex"
}

-- typst
install('chomosuke/typst-preview.nvim')
install('christoomey/vim-tmux-navigator')
install('iamcco/markdown-preview.nvim')
install('chomosuke/typst-preview.nvim')


-- ale 
install('dense-analysis/ale')
