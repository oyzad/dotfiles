-- ~/.config/nvim/lua/plugins/lsp.lua
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        rust_analyzer = {
          settings = {
            ["rust-analyzer"] = {
              cargo = { allFeatures = true },
              checkOnSave = { command = "clippy" },
            },
          },
        },
        pyright = {
          settings = {
            python = {
              analysis = {
                typeCheckingMode = "basic",
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
              },
            },
          },
        },
      },
    },
    config = function(_, opts)
      -- Setup servers without calling LazyVim's deprecated logic
      local lspconfig = require("lspconfig")

      for server, server_opts in pairs(opts.servers) do
        lspconfig[server].setup(server_opts)
      end
    end,
  },
}
