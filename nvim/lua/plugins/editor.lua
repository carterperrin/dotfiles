return {
  -- Surround (ys, ds, cs)
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    opts = {},
  },

  -- Comment toggling (gcc, gc in visual)
  {
    "numToStr/Comment.nvim",
    keys = {
      { "gcc", mode = "n", desc = "Toggle comment" },
      { "gc", mode = "v", desc = "Toggle comment" },
      { "\\cc", "gcc", remap = true, mode = "n", desc = "Toggle comment (backslash)" },
      { "\\cc", "gc", remap = true, mode = "v", desc = "Toggle comment (backslash)" },
    },
    opts = {},
  },

  -- Auto pairs
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {},
  },

  -- Auto close/rename HTML tags
  {
    "windwp/nvim-ts-autotag",
    event = { "BufReadPre", "BufNewFile" },
    opts = {},
  },

  -- Better text objects (targets.vim successor)
  {
    "echasnovski/mini.ai",
    event = "VeryLazy",
    opts = {},
  },

  -- Which-key to discover keymaps
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {},
  },
}
