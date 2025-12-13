-- Set <space> as the leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- [[ Setting options ]]

-- Make line numbers default
vim.o.number = true

-- Enable mouse mode, can be useful for resizing splits for example!
-- vim.o.mouse = 'a'

-- Don't show the mode, since it will be in the status line
-- vim.o.showmode = true

-- Sync clipboard between OS and Neovim
vim.schedule(function()
	vim.o.clipboard = 'unnamedplus'
end)

-- Tab stuff
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insentive searching UNLESS \C or one more capital letters in search term
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.o.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250

-- Decrease mapped sequence wait time
vim.o.timeoutlen = 300

-- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.o.inccommand = 'split'
