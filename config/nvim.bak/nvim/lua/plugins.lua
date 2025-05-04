-- Install plugins
return require('lazy').setup({
    'neovim/nvim-lspconfig',          -- LSP configurations
    'hrsh7th/nvim-cmp',               -- Autocompletion plugin
    'hrsh7th/cmp-nvim-lsp',           -- LSP source for nvim-cmp
    'williamboman/mason.nvim',        -- Manage external tools (e.g. linters)
    'williamboman/mason-lspconfig.nvim', -- Mason LSP config
    'jose-elias-alvarez/null-ls.nvim',  -- Format, lint, etc.
    'nvim-telescope/telescope.nvim',  -- Fuzzy finder
    'mfussenegger/nvim-dap',          -- Debugging support
})

