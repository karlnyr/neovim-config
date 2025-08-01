return {
  "stevearc/conform.nvim",
  opts = function(_, opts)
    -- Example: Add or override formatters per filetype
    opts.formatters_by_ft = {
      python = { "ruff_format", "ruff_fix", "ruff_organize_imports" },
      lua = { "stylua" },
    }
    opts.formatters.ruff_format = {
      append_args = { "--line-length", "100" },
    }
  end,
}
