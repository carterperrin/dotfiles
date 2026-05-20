local parsers = {
  "typescript", "tsx", "javascript", "json", "jsonc",
  "html", "css", "scss", "hcl", "terraform",
  "yaml", "toml", "bash", "lua",
  "markdown", "markdown_inline", "graphql", "dockerfile",
  "gitcommit", "diff", "vim", "vimdoc",
}

return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSInstall " .. table.concat(parsers, " "),
  event = { "BufReadPre", "BufNewFile" },
  config = function() end,
}
