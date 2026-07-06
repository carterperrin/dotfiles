return {
  -- Mason: auto-install LSP servers
  {
    "mason-org/mason.nvim",
    opts = {},
  },
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = { "mason-org/mason.nvim" },
    opts = {
      ensure_installed = {
        "ts_ls",
        "eslint",
        "terraformls",
        "jsonls",
        "yamlls",
        "html",
        "cssls",
        "lua_ls",
        "bashls",
      },
    },
  },

  -- LSP keymaps via LspAttach autocmd
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "mason-org/mason.nvim",
      "mason-org/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Keymaps on LspAttach
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local bufnr = args.buf
          local map = function(keys, func, desc)
            vim.keymap.set("n", keys, func, { buffer = bufnr, desc = "LSP: " .. desc })
          end

          map("gd", vim.lsp.buf.definition, "Go to definition")
          map("gr", vim.lsp.buf.references, "References")
          map("gi", vim.lsp.buf.implementation, "Go to implementation")
          map("gt", vim.lsp.buf.type_definition, "Type definition")
          map("K", vim.lsp.buf.hover, "Hover documentation")
          map("<leader>rn", vim.lsp.buf.rename, "Rename")
          map("<leader>ca", vim.lsp.buf.code_action, "Code action")
          map("<leader>ds", vim.lsp.buf.document_symbol, "Document symbols")
          map("[d", vim.diagnostic.goto_prev, "Previous diagnostic")
          map("]d", vim.diagnostic.goto_next, "Next diagnostic")
          map("<leader>dl", vim.diagnostic.setloclist, "Diagnostics list")
          map("gl", vim.diagnostic.open_float, "Line diagnostics")
        end,
      })

      -- Server configs via vim.lsp.config (nvim 0.11+)
      vim.lsp.config("ts_ls", {
        capabilities = capabilities,
      })

      vim.lsp.config("eslint", {
        capabilities = capabilities,
        settings = {
          codeActionOnSave = {
            enable = true,
            mode = "all",
          },
        },
      })

      -- Auto-fix ESLint issues on save
      vim.api.nvim_create_autocmd("BufWritePre", {
        callback = function(args)
          local clients = vim.lsp.get_clients({ bufnr = args.buf, name = "eslint" })
          if #clients > 0 then
            vim.lsp.buf.code_action({
              context = { only = { "source.fixAll.eslint" }, diagnostics = {} },
              apply = true,
            })
          end
        end,
      })

      vim.lsp.config("terraformls", {
        capabilities = capabilities,
      })

      vim.lsp.config("jsonls", {
        capabilities = capabilities,
      })

      vim.lsp.config("yamlls", {
        capabilities = capabilities,
        settings = {
          yaml = {
            schemas = {
              ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
            },
          },
        },
      })

      vim.lsp.config("html", {
        capabilities = capabilities,
      })

      vim.lsp.config("cssls", {
        capabilities = capabilities,
      })

      vim.lsp.config("lua_ls", {
        capabilities = capabilities,
        settings = {
          Lua = {
            runtime = { version = "LuaJIT" },
            workspace = {
              checkThirdParty = false,
              library = { vim.env.VIMRUNTIME },
            },
          },
        },
      })

      vim.lsp.config("bashls", {
        capabilities = capabilities,
      })

      -- Enable all configured servers
      vim.lsp.enable({
        "ts_ls",
        "eslint",
        "terraformls",
        "jsonls",
        "yamlls",
        "html",
        "cssls",
        "lua_ls",
        "bashls",
      })

      -- Diagnostics UI
      vim.diagnostic.config({
        virtual_text = { spacing = 4, prefix = "●" },
        signs = true,
        underline = true,
        update_in_insert = false,
      })
    end,
  },
}
