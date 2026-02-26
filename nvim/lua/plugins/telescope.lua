return {
	'nvim-telescope/telescope.nvim', version = '*',
	dependencies = {
		'nvim-lua/plenary.nvim',
		{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
	},

	config = function()
		require("telescope").setup{
			defaults = {
				mappings = {
					i = {
						["<C-u>"] = false
					},
				},
			}
		}
		local builtin = require('telescope.builtin')
		vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
		vim.keymap.set('n', '<leader>lg', builtin.live_grep, { desc = 'Telescope live grep' })
	end
}
