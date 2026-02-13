-- ═══════════════════════════════════════════════════════════════════════════
-- Theme Switcher avec UI visuelle
-- ═══════════════════════════════════════════════════════════════════════════

-- Liste des thèmes disponibles avec descriptions
local themes = {
	{ name = "tokyonight", desc = "🌃 Tokyo Night - Cool moderne" },
	{ name = "catppuccin", desc = "🐱 Catppuccin - Pastel doux" },
	{ name = "gruvbox", desc = "🟤 Gruvbox - Rétro chaleureux" },
	{ name = "kanagawa", desc = "🏔  Kanagawa - Encre japonaise" },
	{ name = "nightfox", desc = "🦊 Nightfox - Forêt nocturne" },
	{ name = "bamboo", desc = "🎋 Bamboo - Nature verte" },
	{ name = "nordic", desc = "❄️  Nordic - Froid nordique" },
}

-- Index du thème actuel
local current_theme_index = 1

-- Fonction pour appliquer un thème
local function apply_theme(theme_name)
	vim.cmd("colorscheme " .. theme_name)

	-- Réappliquer les highlights personnalisés
	vim.defer_fn(function()
		require("core.highlights").apply()
	end, 50)
end

-- Fonction pour changer de thème (cycle)
local function cycle_theme()
	current_theme_index = current_theme_index + 1
	if current_theme_index > #themes then
		current_theme_index = 1
	end

	local theme = themes[current_theme_index].name
	apply_theme(theme)
	vim.notify("Thème: " .. themes[current_theme_index].desc, vim.log.levels.INFO)
end

-- Fonction pour définir un thème spécifique
local function set_theme(theme_name)
	for i, theme in ipairs(themes) do
		if theme.name == theme_name then
			current_theme_index = i
			apply_theme(theme_name)
			vim.notify("Thème: " .. theme.desc, vim.log.levels.INFO)
			return
		end
	end
	vim.notify("Thème non trouvé: " .. theme_name, vim.log.levels.WARN)
end

-- ═══════════════════════════════════════════════════════════════════════════
-- UI Visuelle pour sélectionner un thème
-- ═══════════════════════════════════════════════════════════════════════════
local function show_theme_picker()
	-- Créer un buffer temporaire
	local buf = vim.api.nvim_create_buf(false, true)
	vim.api.nvim_buf_set_option(buf, "bufhidden", "wipe")
	vim.api.nvim_buf_set_option(buf, "filetype", "themepicker")

	-- Préparer les lignes à afficher
	local lines = {
		"╔═══════════════════════════════════════════════════════╗",
		"║          🎨 SÉLECTEUR DE THÈMES                      ║",
		"╠═══════════════════════════════════════════════════════╣",
	}

	for i, theme in ipairs(themes) do
		local prefix = (i == current_theme_index) and "  ▶ " or "    "
		table.insert(lines, string.format("║%s%-2d. %-45s║", prefix, i, theme.desc))
	end

	table.insert(lines, "╠═══════════════════════════════════════════════════════╣")
	table.insert(lines, "║  Appuyez sur 1-7 pour choisir | q pour quitter      ║")
	table.insert(lines, "╚═══════════════════════════════════════════════════════╝")

	vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
	vim.api.nvim_buf_set_option(buf, "modifiable", false)

	-- Calculer les dimensions de la fenêtre
	local width = 59
	local height = #lines
	local row = math.floor((vim.o.lines - height) / 2)
	local col = math.floor((vim.o.columns - width) / 2)

	-- Options de la fenêtre flottante
	local opts = {
		relative = "editor",
		width = width,
		height = height,
		row = row,
		col = col,
		style = "minimal",
		border = "none",
	}

	-- Créer la fenêtre flottante
	local win = vim.api.nvim_open_win(buf, true, opts)

	-- Appliquer les couleurs
	vim.api.nvim_win_set_option(win, "winhl", "Normal:Normal,FloatBorder:FloatBorder")

	-- Keymaps pour la sélection
	local function close_picker()
		if vim.api.nvim_win_is_valid(win) then
			vim.api.nvim_win_close(win, true)
		end
	end

	local function select_theme(index)
		if index >= 1 and index <= #themes then
			current_theme_index = index
			apply_theme(themes[index].name)
			vim.notify("Thème: " .. themes[index].desc, vim.log.levels.INFO)
		end
		close_picker()
	end

	-- Mapper les touches 1-7
	for i = 1, #themes do
		vim.keymap.set("n", tostring(i), function()
			select_theme(i)
		end, { buffer = buf, nowait = true })
	end

	-- Mapper q et Escape pour fermer
	vim.keymap.set("n", "q", close_picker, { buffer = buf, nowait = true })
	vim.keymap.set("n", "<Esc>", close_picker, { buffer = buf, nowait = true })

	-- Mapper les flèches pour naviguer
	vim.keymap.set("n", "j", function()
		current_theme_index = current_theme_index + 1
		if current_theme_index > #themes then
			current_theme_index = 1
		end
		close_picker()
		show_theme_picker()
	end, { buffer = buf, nowait = true })

	vim.keymap.set("n", "k", function()
		current_theme_index = current_theme_index - 1
		if current_theme_index < 1 then
			current_theme_index = #themes
		end
		close_picker()
		show_theme_picker()
	end, { buffer = buf, nowait = true })

	-- Mapper Enter pour appliquer le thème sélectionné
	vim.keymap.set("n", "<CR>", function()
		select_theme(current_theme_index)
	end, { buffer = buf, nowait = true })
end

-- Créer les commandes
vim.api.nvim_create_user_command("ThemeCycle", cycle_theme, {})
vim.api.nvim_create_user_command("ThemeSet", function(opts)
	set_theme(opts.args)
end, { nargs = 1 })
vim.api.nvim_create_user_command("ThemePicker", show_theme_picker, {})

-- Keybinding pour ouvrir le picker visuel
vim.keymap.set("n", "<leader>th", show_theme_picker, { desc = "Sélecteur de thèmes" })

return {
	cycle_theme = cycle_theme,
	set_theme = set_theme,
	show_theme_picker = show_theme_picker,
}
