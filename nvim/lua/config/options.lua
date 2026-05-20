vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"

opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.smartindent = true

opt.wrap = true
opt.linebreak = true

opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

opt.splitright = true
opt.splitbelow = true

opt.scrolloff = 8
opt.sidescrolloff = 8

opt.termguicolors = true
opt.background = "dark"

opt.hidden = true
opt.mouse = ""
opt.backspace = "indent,eol,start"

opt.undofile = true
opt.undolevels = 1000
opt.undoreload = 10000
opt.swapfile = false

opt.updatetime = 200
opt.timeoutlen = 300

opt.laststatus = 3
opt.showmode = false

opt.clipboard = "unnamedplus"

opt.wildignore:append({ "*.pyc", "*.o", "node_modules/**", "*/build/*", ".git/**" })

opt.completeopt = "menu,menuone,noselect"
