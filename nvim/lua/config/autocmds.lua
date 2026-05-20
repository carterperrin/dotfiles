local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- Highlight on yank
autocmd("TextYankPost", {
  group = augroup("HighlightYank", {}),
  callback = function()
    vim.highlight.on_yank({ timeout = 200 })
  end,
})

-- Strip trailing whitespace on save
autocmd("BufWritePre", {
  group = augroup("StripWhitespace", {}),
  pattern = "*",
  callback = function()
    local save = vim.fn.winsaveview()
    vim.cmd([[%s/\s\+$//e]])
    vim.fn.winrestview(save)
  end,
})

-- Return to last edit position when opening files
autocmd("BufReadPost", {
  group = augroup("RestoreCursor", {}),
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- Language-specific indentation
autocmd("FileType", {
  group = augroup("FileTypeIndent", {}),
  pattern = { "python" },
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.softtabstop = 4
  end,
})

-- Spell check for text files and git commits
autocmd("FileType", {
  group = augroup("SpellCheck", {}),
  pattern = { "text", "markdown", "gitcommit" },
  callback = function()
    vim.opt_local.spell = true
    vim.opt_local.spelllang = "en_us"
  end,
})
