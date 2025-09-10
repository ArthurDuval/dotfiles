local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.showmode = false
vim.o.breakindent = true
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.signcolumn = 'yes'
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.o.inccommand = 'split'
vim.o.cursorline = true
vim.o.scrolloff = 10
vim.o.expandtab = false
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.colorcolumn = '80'

vim.schedule(function()
	vim.o.clipboard = 'unnamedplus'
end)

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

require("lazy").setup({
	spec = {
		{
			"folke/tokyonight.nvim",
			lazy = false,
			priority = 1000,
			opts = {},
		},

		{
			"nvim-treesitter/nvim-treesitter",
			branch = 'master',
			lazy = false,
			build = ":TSUpdate",
			config = function()
				require'nvim-treesitter.configs'.setup {
					highlight = {
						enable = true,
						additional_vim_regex_highlighting = false,
					},
				}
			end
		},

		{
			"mason-org/mason-lspconfig.nvim",
			opts = {},
			dependencies = {
				{ "mason-org/mason.nvim", opts = {} },
				"neovim/nvim-lspconfig",
			},
		},

		{
			'nvim-telescope/telescope.nvim', tag = '0.1.8',
			dependencies = { 'nvim-lua/plenary.nvim' }
		},

		{
			'lewis6991/gitsigns.nvim',
			opts = {
				signs = {
					add = { text = '+' },
					change = { text = '~' },
					delete = { text = '_' },
					topdelete = { text = '‾' },
					changedelete = { text = '~' },
				},
			},
		},

		{
			'nvim-lualine/lualine.nvim',
			dependencies = { 'nvim-tree/nvim-web-devicons' },
			config = function()
				require('lualine').setup {
					options = {
						icons_enabled = true,
						theme = 'auto',
						component_separators = { left = '', right = ''},
						section_separators = { left = '', right = ''},
						disabled_filetypes = {
							statusline = {},
							winbar = {},
						},
						ignore_focus = {},
						always_divide_middle = true,
						always_show_tabline = true,
						globalstatus = false,
						refresh = {
							statusline = 1000,
							tabline = 1000,
							winbar = 1000,
							refresh_time = 16, -- ~60fps
							events = {
								'WinEnter',
								'BufEnter',
								'BufWritePost',
								'SessionLoadPost',
								'FileChangedShellPost',
								'VimResized',
								'Filetype',
								'CursorMoved',
								'CursorMovedI',
								'ModeChanged',
							},
						}
					},
					sections = {
						lualine_a = {'mode'},
						lualine_b = {'branch', 'diff', 'diagnostics'},
						lualine_c = {'filename'},
						lualine_x = {'encoding', 'fileformat', 'filetype'},
						lualine_y = {'progress'},
						lualine_z = {'location'}
					},
					inactive_sections = {
						lualine_a = {},
						lualine_b = {},
						lualine_c = {'filename'},
						lualine_x = {'location'},
						lualine_y = {},
						lualine_z = {}
					},
					tabline = {},
					winbar = {},
					inactive_winbar = {},
					extensions = {}
				}
			end
		},

	},
	install = { colorscheme = { "habamax" } },
	checker = { enabled = true },
})

vim.cmd[[colorscheme tokyonight-night]]
vim.diagnostic.config({ virtual_text = true })

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files)
vim.keymap.set('n', '<leader>lg', builtin.live_grep)
