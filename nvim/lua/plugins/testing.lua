return {
  {
    "benmills/vimux",
  },
  {
    "vim-test/vim-test",
    dependencies = { "benmills/vimux" },
    event = "VeryLazy",
    config = function()
      vim.g["test#strategy"] = "vimux"

      -- Strip ^ and $ anchors from jest -t patterns so nested describes work
      vim.cmd([[
        function! StripJestAnchors(cmd) abort
          let l:cmd = substitute(a:cmd, "-t '\\^", "-t '", "")
          return substitute(l:cmd, "\\$$'", "'", "")
        endfunction
        let g:test#custom_transformations = {'strip_anchors': function('StripJestAnchors')}
        let g:test#transformation = 'strip_anchors'
      ]])

      vim.keymap.set("n", "\\rf", "<cmd>wa<CR><cmd>TestNearest<CR>", { desc = "Run nearest test" })
      vim.keymap.set("n", "\\rt", "<cmd>wa<CR><cmd>TestFile<CR>", { desc = "Run test file" })
      vim.keymap.set("n", "\\rl", "<cmd>wa<CR><cmd>TestLast<CR>", { desc = "Run last test" })
      vim.keymap.set("n", "\\ra", "<cmd>wa<CR><cmd>TestSuite<CR>", { desc = "Run test suite" })
    end,
  },
}
