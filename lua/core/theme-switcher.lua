-- Liste des thèmes disponibles
local themes = {
  "tokyonight",
  "catppuccin",
  "gruvbox",
  "kanagawa",
}

-- Index du thème actuel
local current_theme_index = 1

-- Fonction pour changer de thème
local function cycle_theme()
  current_theme_index = current_theme_index + 1
  if current_theme_index > #themes then
    current_theme_index = 1
  end
  
  local theme = themes[current_theme_index]
  vim.cmd("colorscheme " .. theme)
  vim.notify("Thème changé: " .. theme, vim.log.levels.INFO)
end

-- Fonction pour définir un thème spécifique
local function set_theme(theme_name)
  for i, theme in ipairs(themes) do
    if theme == theme_name then
      current_theme_index = i
      vim.cmd("colorscheme " .. theme)
      vim.notify("Thème changé: " .. theme, vim.log.levels.INFO)
      return
    end
  end
  vim.notify("Thème non trouvé: " .. theme_name, vim.log.levels.WARN)
end

-- Créer une commande pour changer de thème
vim.api.nvim_create_user_command("ThemeCycle", cycle_theme, {})
vim.api.nvim_create_user_command("ThemeSet", function(opts)
  set_theme(opts.args)
end, { nargs = 1 })

-- Keybinding pour changer rapidement de thème
vim.keymap.set("n", "<leader>th", cycle_theme, { desc = "Changer de thème" })

return {
  cycle_theme = cycle_theme,
  set_theme = set_theme,
}
