return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "ruff",
        "markdownlint-cli2",
        "luacheck",
      })
    end,
  },
  {
    "mfussenegger/nvim-lint",
    opts = function(_, opts)
      opts.linters_by_ft = {
        python = { "ruff" },
        markdown = { "markdownlint-cli2" },
        lua = { "luacheck" },
      }
    end,
  },
}
