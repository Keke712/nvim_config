# Neovim Configuration

Configuration Neovim personnalisée avec support pour le développement 42.

## Fonctionnalités

### 1. Stdheader 42
En-tête automatique pour les fichiers de code selon le standard de l'école 42.

**Utilisation:**
- Appuyer sur `F1` pour insérer l'en-tête 42 dans le fichier actuel
- L'en-tête se met à jour automatiquement lors de la sauvegarde
- Commande: `:Stdheader`

**Configuration:**
Pour personnaliser l'utilisateur et l'email, définir les variables d'environnement:
```bash
export USER="votre_login"
export MAIL="votre_login@student.42.fr"
```

### 2. Onglets/Buffers
Navigation entre les fichiers ouverts avec une barre d'onglets visuelle (bufferline).

**Raccourcis:**
- `Tab` - Onglet suivant
- `Shift+Tab` - Onglet précédent
- `<leader>x` - Fermer l'onglet actuel (leader = espace)
- `<leader>bp` - Choisir un onglet à fermer

### 3. Changement de thème rapide
Basculer rapidement entre différents thèmes colorés.

**Thèmes disponibles:**
- Tokyo Night (par défaut)
- Catppuccin
- Gruvbox
- Kanagawa

**Raccourcis:**
- `<leader>th` - Changer de thème (leader = espace)
- `:ThemeCycle` - Commande pour changer de thème
- `:ThemeSet <nom>` - Définir un thème spécifique

### Autres raccourcis utiles

- `<leader>e` - Ouvrir/fermer l'explorateur de fichiers
- `<leader>nh` - Effacer le surlignage de la recherche
- `;;` - Sortir du mode insertion
- `Shift+I` / `Shift+K` - Déplacer du texte sélectionné en mode visuel

## Installation

1. Cloner ce dépôt dans `~/.config/nvim`
2. Ouvrir Neovim - les plugins seront installés automatiquement
3. Configurer les variables d'environnement pour stdheader (optionnel)

## Structure

```
.
├── init.lua                 # Point d'entrée principal
├── lua/
│   ├── core/
│   │   ├── init.lua         # Initialisation du core
│   │   ├── options.lua      # Options Neovim
│   │   ├── keymaps.lua      # Raccourcis clavier
│   │   └── theme-switcher.lua # Changeur de thème
│   ├── config/
│   │   └── lazy.lua         # Configuration du gestionnaire de plugins
│   └── plugins/
│       ├── init.lua         # Plugins de base
│       ├── stdheader.vim    # En-tête 42
│       ├── bufferline.lua   # Barre d'onglets
│       ├── themes.lua       # Thèmes additionnels
│       ├── tokyonight.lua   # Thème Tokyo Night
│       └── nvim-tree.lua    # Explorateur de fichiers
```
