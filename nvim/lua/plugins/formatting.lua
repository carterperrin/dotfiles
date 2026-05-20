return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      "<leader>cf",
      function()
        require("conform").format({ async = true, lsp_fallback = true })
      end,
      desc = "Format buffer",
    },
  },
  opts = {
    formatters_by_ft = {
      javascript = { "prettier" },
      javascriptreact = { "prettier" },
      typescript = { "prettier" },
      typescriptreact = { "prettier" },
      json = { "prettier" },
      jsonc = { "prettier" },
      html = { "prettier" },
      css = { "prettier" },
      scss = { "prettier" },
      yaml = { "prettier" },
      markdown = { "prettier" },
      graphql = { "prettier" },
      terraform = { "terraform_fmt" },
      tf = { "terraform_fmt" },
      hcl = { "terraform_fmt" },
      sh = { "shfmt" },
      bash = { "shfmt" },
      lua = { "stylua" },
    },
    format_on_save = {
      timeout_ms = 3000,
      lsp_fallback = true,
    },
  },
}
