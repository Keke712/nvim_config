# ═══════════════════════════════════════════════════════════════════════════

# Configuration Python pour Neovim

# ═══════════════════════════════════════════════════════════════════════════

## ✅ Installation AUTOMATIQUE avec Mason

**Vous n'avez RIEN à installer manuellement !**

Mason va automatiquement installer tous les outils au premier lancement de Neovim :

- ✓ pyright (LSP)
- ✓ flake8 (linter)
- ✓ mypy (type checker)
- ✓ black (formatter)
- ✓ isort (import sorter)

### Commandes Mason utiles

```vim
:Mason              " Ouvrir l'interface Mason
:MasonInstall mypy  " Installer un outil manuellement
:MasonUpdate        " Mettre à jour tous les outils
```

## Configuration mypy

Les flags suivants sont automatiquement appliqués dans Neovim :

- `--warn-return-any` : Avertir si une fonction retourne Any
- `--warn-unused-ignores` : Avertir des # type: ignore inutiles
- `--ignore-missing-imports` : Ignorer les imports manquants
- `--disallow-untyped-defs` : Interdire les fonctions sans types
- `--check-untyped-defs` : Vérifier le corps des fonctions non typées

## Keybindings dans Neovim

- `<leader>l` : Lancer le linting manuellement (flake8 + mypy)
- `<leader>f` : Formater le fichier (black + isort)
- Auto-save : Formatage automatique à la sauvegarde

## Fonctionnalités

✅ Linting en temps réel (flake8 + mypy)
✅ Formatage automatique à la sauvegarde (black + isort)
✅ Autocomplétion Python (pyright)
✅ Type hints et diagnostics
✅ Tous vos flags mypy strictes appliqués

---

**Note** : Si vous préférez installer manuellement avec pip :

```bash
pip install flake8 mypy black isort pyright
```
