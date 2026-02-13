return {
	"nvim-treesitter/nvim-treesitter",
	config = function()
		-- Palette de couleurs harmonieuse pour Python
		-- Inspirée des thèmes modernes avec support italic et bold
		local colors = {
			-- Couleurs principales
			variable = "#E0AF68", -- Jaune doré pour les variables
			function_name = "#7AA2F7", -- Bleu clair pour les fonctions
			function_call = "#89DDFF", -- Cyan clair pour les appels de fonction
			function_builtin = "#BB9AF7", -- Violet pour les fonctions builtin
			class_name = "#F7768E", -- Rouge/rose pour les classes
			constructor = "#FF9E64", -- Orange pour les constructeurs
			parameter = "#9ECE6A", -- Vert clair pour les paramètres
			string = "#9ECE6A", -- Vert pour les strings
			keyword = "#BB9AF7", -- Violet pour les keywords
			constant = "#FF9E64", -- Orange pour les constantes
			type_builtin = "#2AC3DE", -- Cyan pour les types builtin
			comment = "#565F89", -- Gris pour les commentaires
			operator = "#89DDFF", -- Cyan pour les opérateurs
			number = "#FF9E64", -- Orange pour les nombres
		}

		-- Configuration des highlights pour Treesitter
		local highlights = {
			-- Variables
			["@variable"] = { fg = colors.variable },
			["@variable.builtin"] = { fg = colors.function_builtin, italic = true },
			["@variable.parameter"] = { fg = colors.parameter, italic = true },
			["@variable.member"] = { fg = colors.variable },

			-- Fonctions
			["@function"] = { fg = colors.function_name, bold = true },
			["@function.call"] = { fg = colors.function_call },
			["@function.builtin"] = { fg = colors.function_builtin, italic = true },
			["@function.method"] = { fg = colors.function_name, bold = true },
			["@function.method.call"] = { fg = colors.function_call },

			-- Classes et types
			["@type"] = { fg = colors.class_name, bold = true },
			["@type.builtin"] = { fg = colors.type_builtin, italic = true },
			["@type.definition"] = { fg = colors.class_name, bold = true },
			["@constructor"] = { fg = colors.constructor, bold = true },

			-- Paramètres
			["@parameter"] = { fg = colors.parameter, italic = true },

			-- Strings
			["@string"] = { fg = colors.string },
			["@string.documentation"] = { fg = colors.string, italic = true },
			["@string.escape"] = { fg = colors.operator },
			["@string.special"] = { fg = colors.constant },

			-- Keywords
			["@keyword"] = { fg = colors.keyword, bold = true },
			["@keyword.function"] = { fg = colors.keyword, bold = true },
			["@keyword.operator"] = { fg = colors.keyword, bold = true },
			["@keyword.return"] = { fg = colors.keyword, bold = true },
			["@keyword.import"] = { fg = colors.keyword, italic = true },

			-- Constantes
			["@constant"] = { fg = colors.constant, bold = true },
			["@constant.builtin"] = { fg = colors.constant, bold = true, italic = true },
			["@constant.macro"] = { fg = colors.constant, bold = true },

			-- Autres éléments Python spécifiques
			["@operator"] = { fg = colors.operator },
			["@number"] = { fg = colors.number },
			["@boolean"] = { fg = colors.constant, bold = true },
			["@comment"] = { fg = colors.comment, italic = true },

			-- Décorateurs Python
			["@attribute"] = { fg = colors.constructor, italic = true },

			-- Propriétés et champs
			["@property"] = { fg = colors.variable },
			["@field"] = { fg = colors.variable },
		}

		-- Configuration des highlights pour les semantic tokens LSP
		local lsp_semantic_highlights = {
			-- Semantic tokens pour Python (pyright)
			["@lsp.type.class.python"] = { link = "@type" },
			["@lsp.type.decorator.python"] = { link = "@attribute" },
			["@lsp.type.function.python"] = { link = "@function" },
			["@lsp.type.method.python"] = { link = "@function.method" },
			["@lsp.type.parameter.python"] = { link = "@parameter" },
			["@lsp.type.variable.python"] = { link = "@variable" },
			["@lsp.type.property.python"] = { link = "@property" },
			["@lsp.type.namespace.python"] = { fg = colors.class_name },
			["@lsp.mod.readonly.python"] = { link = "@constant" },
			["@lsp.typemod.variable.readonly.python"] = { link = "@constant" },
		}

		-- Appliquer les highlights
		for group, settings in pairs(highlights) do
			vim.api.nvim_set_hl(0, group, settings)
		end

		for group, settings in pairs(lsp_semantic_highlights) do
			vim.api.nvim_set_hl(0, group, settings)
		end

		-- Auto-commande pour réappliquer les highlights après changement de colorscheme
		vim.api.nvim_create_autocmd("ColorScheme", {
			pattern = "*",
			callback = function()
				for group, settings in pairs(highlights) do
					vim.api.nvim_set_hl(0, group, settings)
				end
				for group, settings in pairs(lsp_semantic_highlights) do
					vim.api.nvim_set_hl(0, group, settings)
				end
			end,
		})
	end,
}
