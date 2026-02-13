return {
	-- Linting avec nvim-lint
	{
		"mfussenegger/nvim-lint",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local lint = require("lint")

			-- Configurer les linters par filetype
			lint.linters_by_ft = {
				python = { "flake8", "mypy" },
			}

			-- Configuration personnalisée de mypy
			lint.linters.mypy = require("lint").linters.mypy
			lint.linters.mypy.args = {
				"--show-column-numbers",
				"--show-error-end",
				"--hide-error-codes",
				"--hide-error-context",
				"--no-color-output",
				"--no-error-summary",
				"--no-pretty",
				"--warn-return-any",
				"--warn-unused-ignores",
				"--ignore-missing-imports",
				"--disallow-untyped-defs",
				"--check-untyped-defs",
			}

			-- Lancer le linting automatiquement
			local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

			vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave", "TextChanged" }, {
				group = lint_augroup,
				callback = function()
					-- Ne linter que si le buffer est modifiable et a un nom
					if vim.bo.modifiable and vim.fn.expand("%") ~= "" then
						lint.try_lint()
					end
				end,
			})

			-- Linter aussi en temps réel pendant la frappe (avec debounce)
			vim.api.nvim_create_autocmd({ "TextChangedI" }, {
				group = lint_augroup,
				callback = function()
					if vim.bo.modifiable and vim.fn.expand("%") ~= "" then
						-- Debounce de 500ms
						vim.defer_fn(function()
							lint.try_lint()
						end, 500)
					end
				end,
			})

			-- Forcer le linting à l'ouverture d'un fichier Python
			vim.api.nvim_create_autocmd("FileType", {
				group = lint_augroup,
				pattern = "python",
				callback = function()
					vim.defer_fn(function()
						lint.try_lint()
						vim.notify("Linting Python activé (flake8 + mypy)", vim.log.levels.INFO)
					end, 100)
				end,
			})

			-- Keybinding pour lancer manuellement
			vim.keymap.set("n", "<leader>l", function()
				lint.try_lint()
				vim.notify("Linting en cours...", vim.log.levels.INFO)
			end, { desc = "Lancer le linting" })
		end,
	},

	-- Formatage avec conform.nvim
	{
		"stevearc/conform.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local conform = require("conform")

			conform.setup({
				formatters_by_ft = {
					python = { "black", "isort" },
					lua = { "stylua" },
					javascript = { "prettier" },
					typescript = { "prettier" },
					json = { "prettier" },
					yaml = { "prettier" },
					markdown = { "prettier" },
				},

				-- Format on save
				format_on_save = {
					timeout_ms = 500,
					lsp_fallback = true,
				},
			})

			-- Keybinding pour formater manuellement
			vim.keymap.set({ "n", "v" }, "<leader>f", function()
				conform.format({
					lsp_fallback = true,
					async = false,
					timeout_ms = 500,
				})
			end, { desc = "Formater le fichier ou la sélection" })
		end,
	},
}
