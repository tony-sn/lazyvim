return {
  -- c-sharp support
  -- Treesitter for C# syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "c_sharp" })
    end,
  },

  -- Mason for package management
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        "csharp-language-server",
        "csharpier",
        "netcoredbg",
      })
    end,
  },

  -- LSP configuration
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "Decodetalkers/csharpls-extended-lsp.nvim",
    },
    opts = {
      servers = {
        csharp_ls = {},
      },
      setup = {
        csharp_ls = function(_, opts)
          require("lspconfig").csharp_ls.setup(vim.tbl_deep_extend("force", opts, {
            handlers = vim.fn.has("nvim-0.11") == 1 and {} or {
              ["textDocument/definition"] = function(...)
                require("csharpls_extended").handler(...)
              end,
              ["textDocument/typeDefinition"] = function(...)
                require("csharpls_extended").handler(...)
              end,
            },
          }))

          -- Only call this for nvim 0.11+
          if vim.fn.has("nvim-0.11") == 1 then
            -- Delay the call to ensure the plugin is loaded
            vim.schedule(function()
              local ok, csharpls_extended = pcall(require, "csharpls_extended")
              if ok and csharpls_extended.buf_read_cmd_bind then
                csharpls_extended.buf_read_cmd_bind()
              end
            end)
          end

          return true
        end,
      },
    },
  },

  -- DAP configuration
  {
    "mfussenegger/nvim-dap",
    optional = true,
    dependencies = {
      {
        "williamboman/mason.nvim",
        opts = function(_, opts)
          opts.ensure_installed = opts.ensure_installed or {}
          vim.list_extend(opts.ensure_installed, { "netcoredbg" })
        end,
      },
    },
  },

  -- Neotest for testing
  {
    "nvim-neotest/neotest",
    optional = true,
    dependencies = {
      "Issafalcon/neotest-dotnet",
    },
    opts = function(_, opts)
      opts.adapters = opts.adapters or {}
      table.insert(
        opts.adapters,
        require("neotest-dotnet")({
          -- Add any neotest-dotnet specific config here
        })
      )
    end,
  },

  -- Conform for formatting
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        cs = { "csharpier" },
      },
    },
  },
}
