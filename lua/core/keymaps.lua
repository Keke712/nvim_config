-- On définit notre touche leader sur espace
vim.g.mapleader = " "

-- Raccourci pour la fonction set
local keymap = vim.keymap.set

-- on utilise ;; pour sortir du monde insertion
keymap("i", ";;", "<ESC>", { desc = "Sortir du mode insertion avec ;;" })

-- on efface le surlignage de la recherche
keymap("n", "<leader>nh", ":nohl<CR>", { desc = "Effacer le surlignage de la recherche" })

-- Sauvegarde avec CTRL+S en mode normal
keymap("n", "<C-s>", ":w<CR>", { desc = "Sauvegarder le fichier" })

-- I déplace le texte sélectionné vers le haut en mode visuel (activé avec v)
keymap("v", "<S-i>", ":m .-2<CR>==", { desc = "Déplace le texte sélectionné vers le haut en mode visuel" })
-- K déplace le texte sélectionné vers le bas en mode visuel (activé avec v)
keymap("v", "<S-k>", ":m .+1<CR>==", { desc = "Déplace le texte sélectionné vers le bas en mode visuel" })

-- I déplace le texte sélectionné vers le haut en mode visuel bloc (activé avec V)
keymap("x", "<S-i>", ":move '<-2<CR>gv-gv", { desc = "Déplace le texte sélectionné vers le haut en mode visuel bloc" })
-- K déplace le texte sélectionné vers le bas en mode visuel (activé avec V)
keymap("x", "<S-k>", ":move '>+1<CR>gv-gv", { desc = "Déplace le texte sélectionné vers le bas en mode visuel bloc" })

-- Stdheader 42
-- F1 est déjà mappé dans stdheader.vim pour insérer l'en-tête

-- Navigation des onglets/buffers
-- Tab et Shift+Tab sont configurés dans bufferline.lua pour changer de buffer (mode normal uniquement)
-- <leader>bn et <leader>bb sont des alternatives avec la touche leader
-- <leader>x ferme l'onglet actuel
-- <leader>bp choisir un onglet à fermer

-- Changement de thème rapide
-- <leader>th est configuré dans core/theme-switcher.lua pour changer de thème


