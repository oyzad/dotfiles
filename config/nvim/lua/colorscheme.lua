vim.pack.add({
  "https://github.com/sainnhe/everforest" })
vim.g.everforest_background = 'hard'

vim.pack.add({
  "https://github.com/folke/tokyonight.nvim"
})
vim.pack.add({
  "https://github.com/oskarnurm/koda.nvim",
})
require("koda").setup({ transparent = true })

require('tokyonight').setup({
  options = {
    dim_inactive = true,
  }
})

local dark = 'koda-dark'
local light = 'koda-moss'

-- Set default value to dark
vim.cmd("colorscheme " .. dark)

-- Keep track of current light/dark selection
local curselection = true

local toggletheme = function(s, l, d)
  local t
  if s then
    t = l
  else
    t = d
  end

  vim.cmd("colorscheme " .. t)
  return not s
end

vim.keymap.set('n', '<leader>l', function() curselection = toggletheme(curselection, light, dark) end,
  { silent = true, desc = 'Toggle light/dark theme' })
