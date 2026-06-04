vim.pack.add({
  { src = "https://github.com/neovim/nvim-lspconfig", },
})

vim.lsp.enable({
  "pyright",
  "ruff",
  "tinymist",
  "astro",
  "html",
  "css",
  "clangd"
})

-- Disable pyright capabilities which are redundant with Ruff
vim.lsp.config['pyright'] = {
  pyright = {
    disableOrganizeImports = true,
  },
  python = {
    analysis = {
      ignore = { '*' },
    },
  },
}
vim.lsp.config['clangd'] = {
  cmd = { "clangd", "--background-index", "--clang-tidy" },
  root_dir = function(filename)
    return vim.fs.root(filename, { "compile_commands.json", "compile_flags.txt", ".git" })
  end,
}
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = "Go to Definition" })
vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = "Hover Info" })

vim.lsp.config['tinymist'] = {
  settings = {
    typstExtraArgs = { "main.typ" },
    exportPdf = {"onSave"},  
    previewer = {"sioyek"}
  }
}
vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
  callback = function(args)
    vim.lsp.buf.format()
  end,
})
