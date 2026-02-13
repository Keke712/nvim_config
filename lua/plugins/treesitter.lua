return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "BufReadPost", "BufNewFile" },
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
	config = function()
		local treesitter = require("nvim-treesitter.configs")

		treesitter.setup({
			-- Liste des parsers à installer automatiquement
			ensure_installed = {
				"python",
				"lua",
				"vim",
				"vimdoc",
				"c",
				"cpp",
				"bash",
				"json",
				"yaml",
				"markdown",
				"markdown_inline",
			},

			-- Installation automatique des parsers manquants
			auto_install = true,

			-- Activer la coloration syntaxique
			highlight = {
				enable = true,
				-- Désactiver vim syntax pour éviter les conflits
				additional_vim_regex_highlighting = false,
			},

			-- Indentation basée sur treesitter
			indent = {
				enable = true,
			},

			-- Configuration pour les text objects
			textobjects = {
				select = {
					enable = true,
					lookahead = true,
					keymaps = {
						["af"] = "@function.outer",
						["if"] = "@function.inner",
						["ac"] = "@class.outer",
						["ic"] = "@class.inner",
					},
				},
			},
		})
	end,
}
