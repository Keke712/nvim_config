return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-buffer", -- source pour les suggestions depuis le buffer
		"hrsh7th/cmp-path", -- source pour les chemins de fichiers
		"L3MON4D3/LuaSnip", -- moteur de snippets
		"saadparwaiz1/cmp_luasnip", -- autocomplétion pour luasnip
		"rafamadriz/friendly-snippets", -- snippets utiles
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")

		-- Charger les snippets friendly-snippets
		require("luasnip.loaders.from_vscode").lazy_load()

		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-k>"] = cmp.mapping.select_prev_item(), -- suggestion précédente
				["<C-j>"] = cmp.mapping.select_next_item(), -- suggestion suivante
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(), -- afficher la complétion
				["<C-e>"] = cmp.mapping.abort(), -- fermer la fenêtre de complétion
				["<CR>"] = cmp.mapping.confirm({ select = false }), -- confirmer la sélection
			}),
			-- Sources pour l'autocomplétion
			sources = cmp.config.sources({
				{ name = "nvim_lsp" }, -- LSP
				{ name = "luasnip" }, -- snippets
				{ name = "buffer" }, -- texte du buffer
				{ name = "path" }, -- chemins de fichiers
			}),
		})
	end,
}
