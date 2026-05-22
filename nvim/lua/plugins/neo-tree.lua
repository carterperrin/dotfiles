return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  keys = {
    { "<leader>e", "<cmd>Neotree toggle<CR>", desc = "Toggle file explorer" },
    { "<leader>nf", "<cmd>Neotree reveal<CR>", desc = "Reveal current file in explorer" },
    { "<leader>nt", "<cmd>Neotree toggle<CR>", desc = "Toggle file explorer" },
  },
  opts = {
    close_if_last_window = true,
    filesystem = {
      follow_current_file = { enabled = true },
      use_libuv_file_watcher = true,
      filtered_items = {
        visible = false,
        hide_dotfiles = false,
        hide_gitignored = true,
        hide_by_name = { "node_modules", ".git", ".terraform" },
      },
    },
    window = {
      width = 35,
      mappings = {
        ["<space>"] = "none",
      },
    },
  },
}
