vim.pack.add({
  { src = "https://github.com/neovim/nvim-lspconfig", },
})

-- Disable pyright capabilities which are redundant with Ruff
vim.lsp.config['pyright'] = {
  settings = { -- Configuration options must be nested under 'settings'
    pyright = {
      disableOrganizeImports = true,
    },
    python = {
      analysis = {
        ignore = { '*' },
      },
    },
  }
}


vim.lsp.config['clangd'] = {
  cmd = {
    "clangd",  -- Uses the system clangd from /usr/local/clang+llvm/bin
    "--background-index",
    "--clang-tidy",
  },
  filetypes = { "c", "cpp", "objc", "objcpp" },
  root_markers = { "compile_commands.json", "compile_flags.txt", ".git" },
}

vim.lsp.config['tinymist'] = {
  settings = {
    typstExtraArgs = { "main.typ" },
    exportPdf = {"onSave"},  
    previewer = {"sioyek"}
  }
}

vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = "Go to Definition" })
vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = "Hover Info" })

vim.lsp.enable({
  "pyright",
  "ruff",
  "tinymist",
  "astro",
  "html",
  "css",
  "clangd"
})

vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
  callback = function(args)
    vim.lsp.buf.format()
  end,
})
