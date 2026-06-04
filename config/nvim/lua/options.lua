local options = {
	number = true,
	relativenumber = true,
	tabstop = 4,
	smartindent = true,
	autoindent = true,
	cindent = true,
	shiftwidth = 4,
	expandtab = true,
	undofile = true,
	termguicolors = true,
	mouse = "a",
	signcolumn = "yes",
	cursorline = true,
  ignorecase = true,
  smartcase = true,
}

for opt, val in pairs(options) do
	vim.opt[opt] = val
end


-- Markdown
vim.api.nvim_create_autocmd("Filetype", {
	desc = "Set up for writing in markdown files",
	pattern = { "markdown", "quarto", "mdx", "rmd" },
	callback = function(opts)
		-- vim.keymap.set("n", "j", "gj")
		-- vim.keymap.set("n", "k", "gk")
		vim.wo.linebreak = true
		vim.wo.wrap = true
	end
})

vim.g.mkdp_filetypes = { "markdown" }

vim.filetype.add({
	extension = {
		astro = "astro",
		mdx = "markdown",
		typ = "typst"
	},
})

-- Typst
vim.api.nvim_create_autocmd("Filetype", {
	pattern = { "typst" },
	callback = function(opts)
		-- vim.keymap.set("n", "j", "gj")
		-- vim.keymap.set("n", "k", "gk")
		vim.wo.linebreak = true
		vim.wo.wrap = true
	end
})


-- Lua
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "lua" },
	callback = function()
		vim.opt.tabstop = 2
		vim.opt.shiftwidth = 2
	end
})

-- Astro
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "astro" },
	callback = function()
		vim.opt.tabstop = 2
		vim.opt.shiftwidth = 2
	end
})
