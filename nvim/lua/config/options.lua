vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

vim.o.number = true
vim.o.relativenumber = true

vim.o.showmode = false

vim.schedule(function() vim.o.clipboard = 'unnamedplus' end)

vim.o.breakindent = true

vim.o.undofile = true

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.splitright = true
vim.o.splitbelow = true

vim.o.cursorline = true

vim.o.scrolloff = 10

vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

vim.o.expandtab = false
vim.o.tabstop = 4
vim.o.shiftwidth = 4

vim.o.colorcolumn = '80'

vim.diagnostic.config({ virtual_text = true })
