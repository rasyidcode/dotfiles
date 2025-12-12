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

