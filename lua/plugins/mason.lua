return {
	-- Mason : gestionnaire de paquets pour LSP, linters, formatters
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})
		end,
	},

	-- Mason-lspconfig : pont entre Mason et nvim-lspconfig
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			require("mason-lspconfig").setup({
				-- LSP servers à installer automatiquement
				ensure_installed = {
					"pyright", -- Python LSP
					"lua_ls",  -- Lua LSP
				},
				automatic_installation = true,
			})
		end,
	},

	-- Mason-tool-installer : installe automatiquement linters et formatters
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			require("mason-tool-installer").setup({
				-- Outils à installer automatiquement
				ensure_installed = {
					-- Python
					"pyright",  -- LSP
					"flake8",   -- Linter
					"mypy",     -- Type checker
					"black",    -- Formatter
					"isort",    -- Import sorter

					-- Lua
					"stylua",   -- Formatter

					-- Web
					"prettier", -- Formatter JS/TS/JSON/YAML/MD
				},

				-- Auto-update
				auto_update = false,

				-- Installer automatiquement au démarrage
				run_on_start = true,
			})
		end,
	},
}
