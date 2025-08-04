return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "ruff",
        "basedpyright",
        "jedi-language-server",
      })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ruff = {},
        basedpyright = {},
        jedi_language_server = {},
      },
      setup = {
        on_hover = function()
          require("lazyvim.util").lsp.on_attach(function(client, _)
            if client.name == "basedpyright" or "copilot" or "ruff" then
              client.server_capabilities.hoverProvider = false
            end
          end)
        end,
        require("lspconfig").ruff.setup({
          settings = {
            configuration = {
              lint = {
                unfixable = { "F401" },
                ["extend-select"] = { "TID251" },
                ["flake8-tidy-imports"] = {
                  ["banned-api"] = {
                    ["typing.TypedDict"] = {
                      msg = "Use `typing_extensions.TypedDict` instead",
                    },
                  },
                },
              },
              format = {
                ["quote-style"] = "single",
                ["line-length"] = 100,
                ["fixable"] = true,
              },
            },
          },
          offsetEncoding = { "utf-16" },
        }),
        require("lspconfig").basedpyright.setup({
          settings = {
            pyright = {
              disableOrganizeImports = True,
            },
            python = {
              analysis = {
                ignore = { "*" },
              },
            },
          },
        }),
      },
    },
    {
      "mfussenegger/nvim-dap",
      dependencies = {
        "mfussenegger/nvim-dap-python",
      },
      keys = {
        {
          "<leader>dPt",
          function()
            require("dap-python").test_method()
          end,
          desc = "Debug Method",
        },
        {
          "<leader>dPc",
          function()
            require("dap-python").test_class()
          end,
          desc = "Debug Class",
        },
      },
      config = function()
        local path = require("mason-registry").get_package("debugpy"):get_install_path()
        require("dap-python").setup(path .. "/venv/bin/python")
      end,
    },
    {
      "folke/which-key.nvim",
      optional = true,
      opts = {
        spec = {
          ["<leader>dP"] = { name = "+Python" },
        },
      },
    },
    {
      "nvim-neotest/neotest",
      dependencies = {
        "nvim-neotest/neotest-python",
        "nvim-neotest/nvim-nio",
      },
      opts = {
        adapters = { ["neotest-python"] = {
          runner = "pytest",
        } },
      },
    },
    {
      "linux-cultist/venv-selector.nvim",
      branch = "regexp",
      dependencies = {
        "mfussenegger/nvim-dap-python",
      },
      cmd = "VenvSelect",
      opts = {
        dap_enabled = true,
      },
      keys = { { "<leader>cv", "<cmd>:VenvSelect<cr>", desc = "Select VirtualEnv" } },
    },
  },
}
