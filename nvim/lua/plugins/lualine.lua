return {
	'nvim-lualine/lualine.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	opts = {
		options = {
			theme = 'palenight',
			component_separators = { left = '|', right = '|'},
			section_separators = '',
			disabled_filetypes = {
				statusline = {},
				winbar = {},
			}
		}
	}
}
