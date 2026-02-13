# Guide d'installation rapide - Configuration Python

## 🚀 Démarrage rapide

### 1. Ouvrir Neovim
```bash
nvim
```

Les plugins seront installés automatiquement par Lazy.nvim au premier démarrage.

### 2. Installer Pyright (serveur LSP)

**Option 1 - Via npm (recommandé)**
```bash
npm install -g pyright
```

**Option 2 - Via pip**
```bash
pip install pyright
```

**Option 3 - Via Mason (dans Neovim)**
```vim
:MasonInstall pyright
```

### 3. Vérifier l'installation

Dans Neovim :
```vim
:checkhealth nvim-treesitter
:checkhealth lsp
:TSInstall python
```

### 4. Tester la configuration

Créez un fichier Python de test :
```bash
nvim test.py
```

Copiez ce code :
```python
from typing import List

def hello(name: str) -> str:
    """Dit bonjour."""
    return f"Hello, {name}!"

class Person:
    def __init__(self, name: str):
        self.name = name

# Variables
message = hello("World")
person = Person("Alice")
numbers: List[int] = [1, 2, 3]
```

Vous devriez voir :
- ✅ Coloration syntaxique colorée
- ✅ Autocomplétion en tapant `Ctrl+Space`
- ✅ Documentation en survolant avec `K`
- ✅ Erreurs soulignées en temps réel

## 📦 Ce qui a été installé

### Plugins
- **nvim-treesitter** - Parser Python et coloration syntaxique
- **nvim-lspconfig** - Configuration LSP
- **nvim-cmp** - Autocomplétion
- **LuaSnip** - Snippets
- Dépendances automatiques

### Parsers Treesitter
- Python (automatique)
- Lua, C, C++, Bash, JSON, YAML, Markdown

### Fichiers de configuration
- `lua/plugins/treesitter.lua` - Configuration Treesitter + highlights Python
- `lua/plugins/lsp.lua` - Configuration LSP Pyright
- `lua/plugins/nvim-cmp.lua` - Configuration autocomplétion

## 🎨 Palette de couleurs

| Élément | Couleur | Style |
|---------|---------|-------|
| Variables | 🟡 Jaune doré | Normal |
| Fonctions | 🔵 Bleu clair | **Bold** |
| Appels fonction | 💎 Cyan | Normal |
| Builtin fonctions | 💜 Violet | *Italic* |
| Classes | 🔴 Rouge/rose | **Bold** |
| Constructeurs | 🟠 Orange | **Bold** |
| Paramètres | 🟢 Vert clair | *Italic* |
| Strings | 🟢 Vert | Normal |
| Keywords | 💜 Violet | **Bold** |
| Constantes | 🟠 Orange | **Bold** |
| Types builtin | 💎 Cyan | *Italic* |

## ⌨️ Raccourcis utiles

### Navigation LSP
- `gd` - Aller à la définition
- `gD` - Aller à la déclaration
- `K` - Afficher la documentation
- `gr` - Trouver les références
- `<leader>rn` - Renommer (espace + rn)
- `<leader>ca` - Actions de code (espace + ca)

### Autocomplétion
- `Ctrl+Space` - Ouvrir la complétion
- `Ctrl+j` / `Ctrl+k` - Naviguer dans les suggestions
- `Enter` - Confirmer la sélection
- `Ctrl+e` - Fermer la complétion

### Treesitter
- `af` - Sélectionner une fonction (visual mode)
- `if` - Sélectionner l'intérieur d'une fonction
- `ac` - Sélectionner une classe
- `ic` - Sélectionner l'intérieur d'une classe

## 🔧 Dépannage

### "Pyright not found"
```bash
# Vérifier l'installation
which pyright

# Installer via npm
npm install -g pyright

# Ou dans Neovim
:LspInstall pyright
```

### Pas de coloration
```vim
:TSUpdate python
:TSModuleInfo
:Inspect  " Placez le curseur sur un mot
```

### LSP ne démarre pas
```vim
:LspInfo
:LspLog
:LspRestart
```

### Autocomplétion inactive
```vim
:CmpStatus
:LspInfo
" Redémarrer Neovim
```

## 📚 Commandes utiles

```vim
:TSInstall python          " Installer/réinstaller le parser Python
:TSUpdate                  " Mettre à jour tous les parsers
:TSModuleInfo             " Info sur les modules Treesitter
:LspInfo                  " Info sur les serveurs LSP actifs
:LspRestart               " Redémarrer le serveur LSP
:CmpStatus                " Statut de l'autocomplétion
:Inspect                  " Inspecter le highlight sous le curseur
:checkhealth              " Vérifier la santé de Neovim
```

## 🆘 Besoin d'aide ?

1. Consultez [PYTHON_CONFIG.md](PYTHON_CONFIG.md) pour la documentation complète
2. Vérifiez les logs : `:LspLog` ou `:messages`
3. Consultez la documentation officielle :
   - [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
   - [LSPconfig](https://github.com/neovim/nvim-lspconfig)
   - [Pyright](https://github.com/microsoft/pyright)
