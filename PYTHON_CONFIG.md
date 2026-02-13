# Configuration Python pour Neovim

Cette configuration ajoute un support complet pour le développement Python avec coloration syntaxique avancée, autocomplétion et analyse LSP.

## 📦 Plugins installés

### nvim-treesitter
Analyse syntaxique en temps réel pour Python avec highlighting précis.

**Fichier**: `lua/plugins/treesitter.lua`

**Fonctionnalités**:
- Installation automatique du parser Python
- Coloration syntaxique basée sur l'AST
- Indentation intelligente
- Text objects pour fonctions et classes

### nvim-lspconfig avec Pyright
Serveur de langage Python pour l'analyse statique et l'autocomplétion.

**Fichier**: `lua/plugins/lsp.lua`

**Fonctionnalités**:
- Analyse de type avec Pyright
- Semantic tokens pour une coloration encore plus précise
- Diagnostics en temps réel
- Support de l'autocomplétion

**Raccourcis LSP**:
- `gD` - Aller à la déclaration
- `gd` - Aller à la définition
- `K` - Afficher la documentation
- `gi` - Aller à l'implémentation
- `<leader>rn` - Renommer le symbole
- `<leader>ca` - Actions de code
- `gr` - Trouver les références

### nvim-cmp
Système d'autocomplétion moderne avec support des snippets.

**Fichier**: `lua/plugins/nvim-cmp.lua`

**Raccourcis**:
- `Ctrl+k` - Suggestion précédente
- `Ctrl+j` - Suggestion suivante
- `Ctrl+Space` - Ouvrir l'autocomplétion
- `Ctrl+e` - Fermer l'autocomplétion
- `Enter` - Confirmer la sélection

### Highlights Python personnalisés (intégrés dans treesitter.lua)
Palette de couleurs harmonieuse pour Python avec support italic et bold.

**Fonctionnalités**:
- 14 couleurs harmonieuses
- Support italic et bold
- Compatible tous thèmes
- Réapplication automatique
- Semantic tokens LSP

**Éléments colorés**:
- 🟡 **Variables** (`@variable`) - Jaune doré (#E0AF68)
- 🔵 **Fonctions** (`@function`) - Bleu clair (#7AA2F7) avec **bold**
- 💎 **Appels de fonction** (`@function.call`) - Cyan clair (#89DDFF)
- 💜 **Fonctions builtin** (`@function.builtin`) - Violet (#BB9AF7) avec *italic*
- 🔴 **Classes** (`@type`) - Rouge/rose (#F7768E) avec **bold**
- 🟠 **Constructeurs** (`@constructor`) - Orange (#FF9E64) avec **bold**
- 🟢 **Paramètres** (`@parameter`) - Vert clair (#9ECE6A) avec *italic*
- 🟢 **Strings** (`@string`) - Vert (#9ECE6A)
- 💜 **Keywords** (`@keyword`) - Violet (#BB9AF7) avec **bold**
- 🟠 **Constantes** (`@constant`) - Orange (#FF9E64) avec **bold**
- 💎 **Types builtin** (`@type.builtin`) - Cyan (#2AC3DE) avec *italic*

## 🚀 Installation

Les plugins seront installés automatiquement par Lazy.nvim au prochain démarrage de Neovim.

### Prérequis

Pour profiter pleinement de cette configuration, installez :

```bash
# Pyright (serveur LSP pour Python)
npm install -g pyright

# Ou via pip
pip install pyright
```

## 📝 Utilisation

### Premier lancement

1. Ouvrir Neovim
2. Les plugins seront installés automatiquement
3. Les parsers Treesitter seront téléchargés
4. Pyright se lancera automatiquement pour les fichiers Python

### Vérification

Pour vérifier que tout fonctionne :

```vim
:checkhealth nvim-treesitter
:checkhealth lsp
```

### Commandes utiles

```vim
:TSInstall python          " Installer le parser Python
:TSUpdate                  " Mettre à jour tous les parsers
:LspInfo                   " Informations sur les LSP actifs
:LspInstall pyright        " Installer pyright si nécessaire
```

## 🎨 Personnalisation

### Modifier les couleurs

Éditez `lua/plugins/treesitter.lua` et modifiez la table `colors` dans la section des highlights Python :

```lua
local colors = {
    variable = "#E0AF68",      -- Votre couleur pour les variables
    function_name = "#7AA2F7", -- Votre couleur pour les fonctions
    -- ...
}
```

### Désactiver italic/bold

Dans `treesitter.lua`, dans la section des highlights Python, retirez les attributs `italic` et `bold` :

```lua
["@function"] = { fg = colors.function_name }, -- Sans bold
["@parameter"] = { fg = colors.parameter },    -- Sans italic
```

### Ajouter d'autres parsers

Dans `treesitter.lua`, ajoutez des langages à la liste `ensure_installed` :

```lua
ensure_installed = {
    "python",
    "javascript",
    "typescript",
    -- ...
}
```

## 🔧 Dépannage

### Les couleurs ne s'appliquent pas

1. Vérifiez que Treesitter est bien chargé : `:TSModuleInfo`
2. Rechargez la configuration : `:source %`
3. Vérifiez les highlights : `:Inspect` (sur un élément)

### Pyright ne démarre pas

1. Vérifiez l'installation : `which pyright`
2. Consultez les logs : `:LspLog`
3. Redémarrez le serveur : `:LspRestart`

### Autocomplétion ne fonctionne pas

1. Vérifiez que LSP est attaché : `:LspInfo`
2. Vérifiez nvim-cmp : `:CmpStatus`
3. Redémarrez Neovim

## 📚 Documentation complète

- [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [LSPconfig](https://github.com/neovim/nvim-lspconfig)
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- [Pyright](https://github.com/microsoft/pyright)

## 🎯 Exemple

Un fichier de test Python est disponible dans `/tmp/test_python_syntax.py` pour voir toutes les couleurs en action.
