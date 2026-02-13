return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("tokyonight").setup({
			style = "night",
			transparent = false,
			terminal_colors = true,
		})

		-- Charger le thème
		vim.cmd([[colorscheme tokyonight]])

		-- Appliquer la palette personnalisée
		require("core.highlights").apply()
	end,
}
