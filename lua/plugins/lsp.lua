return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		-- Configuration des diagnostics
		vim.diagnostic.config({
			virtual_text = true,
			signs = true,
			update_in_insert = false,
			underline = true,
			severity_sort = true,
		})

		-- Capacités LSP avec support des snippets
		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- Keymaps pour LSP (via LspAttach autocmd)
		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(args)
				local client = vim.lsp.get_client_by_id(args.data.client_id)
				local bufnr = args.buf
				local opts = { noremap = true, silent = true, buffer = bufnr }

				-- Raccourcis clavier pour LSP
				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
				vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
				vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
				vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)

				-- Support des semantic tokens
				if client and client.server_capabilities.semanticTokensProvider then
					vim.lsp.semantic_tokens.start(bufnr, client.id)
				end
			end,
		})

		-- Configuration de pyright avec la nouvelle API vim.lsp.config (Neovim 0.11+)
		vim.lsp.config("pyright", {
			capabilities = capabilities,
			settings = {
				python = {
					analysis = {
						typeCheckingMode = "basic",
						autoSearchPaths = true,
						useLibraryCodeForTypes = true,
						diagnosticMode = "workspace",
					},
				},
			},
		})

		-- Activer le serveur pyright
		vim.lsp.enable("pyright")
	end,
}
