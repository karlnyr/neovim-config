return {
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "markdownlint-cli2",
        "markdown-toc",
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    require("lspconfig").marksman.setup({
      settings = {
        marksman = {
          filetypes = { "markdown", "md" },
        },
      },
    }),
  },
}
