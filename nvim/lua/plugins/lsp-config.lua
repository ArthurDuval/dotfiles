return {
	"mason-org/mason-lspconfig.nvim",
	opts = {},
	dependencies = {
		{
			"mason-org/mason.nvim",
			opts = {
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			},
		},
		{
			"neovim/nvim-lspconfig",
			dependencies = {
				"saghen/blink.cmp",
				version = "1.*",
				opts = {}
			},
			opts = {
				servers = {
					lua_ls = {},
				},
			},

			config = function(_, opts)
				for server, cfg in pairs(opts.servers) do
					local base = vim.lsp.config[server]
					for k, v in pairs(cfg) do
						base[k] = v
					end
					base.capabilities = require("blink.cmp").get_lsp_capabilities(base.capabilities)
					vim.lsp.enable(base)
				end

				vim.lsp.config['ocamllsp'] = {
					cmd = { 'ocamllsp' },
					filetypes = {
						'ocaml',
						'ocaml.interface',
						'ocaml.menhir',
						'ocaml.ocamllex',
						'dune',
						'reason'
					},
					root_markers = {
						{ 'dune-project', 'dune-workspace' },
						{ "*.opam", "esy.json", "package.json" },
						'.git'
					},
					settings = {},
				}

				vim.lsp.enable 'ocamllsp'
			end,
		},
	},
}
