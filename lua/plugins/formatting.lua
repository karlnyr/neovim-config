return {
  "stevearc/conform.nvim",
  opts = function(_, opts)
    -- Example: Add or override formatters per filetype
    opts.formatters_by_ft = {
      python = { "ruff_format", "ruff_fix", "ruff_organize_imports" },
      lua = { "stylua" },
      json = { "prettierd", "prettier", stop_after_first = true },
      jsonc = { "prettierd", "prettier", stop_after_first = true },
      markdown = { "prettierd", "prettier", stop_after_first = true },
    }
    opts.formatters.ruff_format = {
      append_args = { "--line-length", "100" },
    }
  end,
}
