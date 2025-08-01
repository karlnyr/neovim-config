return {
  -- add symbols-outline
  {
    "zbirenbaum/copilot.lua",
    opts = function(_, opts)
      opts.suggestion = {
        enable = false,
      }
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        copilot = {
          capabilities = vim.tbl_extend("force", vim.lsp.protocol.make_client_capabilities(), {
            offsetEncoding = { "utf-8" },
          }),
        },
      },
    },
  },
  { import = "plugins.lang" },
}
