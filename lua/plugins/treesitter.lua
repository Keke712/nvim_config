return {
	{
		"nvim-treesitter/nvim-treesitter",
		-- nvim-treesitter does NOT support lazy-loading
		lazy = false,
		branch = "main",
		build = ":TSUpdate",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
		config = function()
			local highlight_filetypes = {
				"python",
				"lua",
				"vim",
				"c",
				"cpp",
				"bash", "sh",
				"json",
				"yaml",
				"markdown",
			}

			local indent_filetypes = {
				"python",
				"lua",
				"c",
				"cpp",
				"bash", "sh",
				"json",
				"yaml",
			}

			-- Helper: vérifier si un parser est disponible pour un langage
			local function has_parser(lang)
				local ok, _ = pcall(vim.treesitter.language.add, lang)
				return ok
			end

			-- Helper: démarrer treesitter highlighting en toute sécurité
			local function safe_ts_start(bufnr)
				local ft = vim.bo[bufnr or 0].filetype
				-- Mapper le filetype au nom du parser (sh -> bash)
				local lang = ft
				if ft == "sh" then lang = "bash" end
				if has_parser(lang) then
					pcall(vim.treesitter.start, bufnr or 0, lang)
				end
			end

			-- Détection de la version de nvim-treesitter (main vs master)
			local ts_ok, ts = pcall(require, "nvim-treesitter")
			local ts_configs_ok, ts_configs = pcall(require, "nvim-treesitter.configs")

			if ts_ok and ts.setup then
				-- Nouvelle API (branche main)
				ts.setup({
					install_dir = vim.fn.stdpath("data") .. "/site",
				})

				-- Installer les parsers de façon asynchrone
				local parsers = {
					"python", "lua", "vim", "vimdoc",
					"c", "cpp", "bash",
					"json", "yaml",
					"markdown", "markdown_inline",
				}
				pcall(function()
					ts.install(parsers)
				end)

			elseif ts_configs_ok then
				-- Ancienne API (branche master) — fallback
				ts_configs.setup({
					ensure_installed = {
						"python", "lua", "vim", "vimdoc",
						"c", "cpp", "bash",
						"json", "yaml",
						"markdown", "markdown_inline",
					},
					auto_install = true,
					highlight = { enable = true, additional_vim_regex_highlighting = false },
					indent = { enable = true },
				})
			end

			-- Activer la coloration syntaxique treesitter pour les filetypes souhaités
			vim.api.nvim_create_autocmd("FileType", {
				pattern = highlight_filetypes,
				callback = function(args)
					safe_ts_start(args.buf)
				end,
			})

			-- Indentation basée sur treesitter (nouvelle API uniquement)
			if ts_ok and ts.setup then
				vim.api.nvim_create_autocmd("FileType", {
					pattern = indent_filetypes,
					callback = function()
						vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
					end,
				})
			end

			-- Appliquer le highlighting aux buffers déjà ouverts
			vim.defer_fn(function()
				for _, buf in ipairs(vim.api.nvim_list_bufs()) do
					if vim.api.nvim_buf_is_loaded(buf) then
						local ft = vim.bo[buf].filetype
						for _, pattern in ipairs(highlight_filetypes) do
							if ft == pattern then
								safe_ts_start(buf)
								break
							end
						end
					end
				end
			end, 1000)

			-- Configuration des textobjects (nouvelle API)
			require("nvim-treesitter-textobjects").setup({
				select = {
					lookahead = true,
				},
			})

			-- Keymaps pour les textobjects
			vim.keymap.set({ "x", "o" }, "af", function()
				require("nvim-treesitter-textobjects.select").select_textobject("@function.outer", "textobjects")
			end)
			vim.keymap.set({ "x", "o" }, "if", function()
				require("nvim-treesitter-textobjects.select").select_textobject("@function.inner", "textobjects")
			end)
			vim.keymap.set({ "x", "o" }, "ac", function()
				require("nvim-treesitter-textobjects.select").select_textobject("@class.outer", "textobjects")
			end)
			vim.keymap.set({ "x", "o" }, "ic", function()
				require("nvim-treesitter-textobjects.select").select_textobject("@class.inner", "textobjects")
			end)
		end,
	},
}

