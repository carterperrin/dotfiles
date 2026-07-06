return {
  {
    "benmills/vimux",
  },
  {
    "tpope/vim-projectionist",
    lazy = false,
    config = function()
      -- Toggle between source and __test__ files
      vim.keymap.set("n", "<leader>ta", function()
        local path = vim.fn.expand("%:p")
        local alt
        if path:match("__test__/(.+)%.test%.ts") then
          alt = path:gsub("__test__/(.+)%.test%.ts", "%1.ts")
        elseif path:match("__test__/(.+)%.test%.tsx") then
          alt = path:gsub("__test__/(.+)%.test%.tsx", "%1.tsx")
        elseif path:match("%.tsx$") then
          local dir = vim.fn.expand("%:p:h")
          local name = vim.fn.expand("%:t:r")
          alt = dir .. "/__test__/" .. name .. ".test.tsx"
        elseif path:match("%.ts$") then
          local dir = vim.fn.expand("%:p:h")
          local name = vim.fn.expand("%:t:r")
          alt = dir .. "/__test__/" .. name .. ".test.ts"
        end
        if alt then
          vim.cmd("edit " .. alt)
        else
          vim.notify("No alternate file found", vim.log.levels.WARN)
        end
      end, { desc = "Toggle test/source file" })
    end,
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

      vim.keymap.set("n", "<leader>rf", "<cmd>wa<CR><cmd>TestNearest<CR>", { desc = "Run nearest test" })
      vim.keymap.set("n", "<leader>rt", "<cmd>wa<CR><cmd>TestFile<CR>", { desc = "Run test file" })
      vim.keymap.set("n", "<leader>rl", "<cmd>wa<CR><cmd>TestLast<CR>", { desc = "Run last test" })
      vim.keymap.set("n", "<leader>ra", "<cmd>wa<CR><cmd>TestSuite<CR>", { desc = "Run test suite" })
    end,
  },
}
