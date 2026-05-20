local map = vim.keymap.set

-- Clear search highlight
map("n", "<leader>nh", "<cmd>nohls<CR>", { desc = "Clear search highlight" })

-- Better window navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- Resize windows
map("n", "<C-Up>", "<cmd>resize +2<CR>")
map("n", "<C-Down>", "<cmd>resize -2<CR>")
map("n", "<C-Left>", "<cmd>vertical resize -2<CR>")
map("n", "<C-Right>", "<cmd>vertical resize +2<CR>")

-- Move lines up/down in visual mode
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- Keep cursor centered when scrolling
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- Keep cursor centered when searching
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Yank to end of line (consistent with D and C)
map("n", "Y", "y$")

-- Visual j/k move by display lines
map("n", "j", "gj", { silent = true })
map("n", "k", "gk", { silent = true })

-- Paste over selection without losing clipboard
map("x", "p", [["_dP]])

-- Quick save
map("n", "<leader>w", "<cmd>w<CR>", { desc = "Save file" })

-- Buffer navigation
map("n", "<leader>bd", "<cmd>bd<CR>", { desc = "Close buffer" })
map("n", "[b", "<cmd>bprev<CR>", { desc = "Previous buffer" })
map("n", "]b", "<cmd>bnext<CR>", { desc = "Next buffer" })

-- Write as sudo (replacement for SudoW)
map("c", "W", "w")
