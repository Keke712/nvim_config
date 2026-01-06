# Example Output

This file shows examples of what each feature produces.

## 1. Stdheader 42 Example

When you press F1 on a C file, the stdheader will insert:

```c
/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   example.c                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: user <user@student.42.fr>                  +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2026/01/06 13:47:00 by user              #+#    #+#             */
/*   Updated: 2026/01/06 13:47:00 by user             ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */
```

## 2. Bufferline/Tabs

A visual tab bar will appear at the top of nvim showing all open buffers with:
- File icons
- File names
- Close buttons
- Slant separators between tabs

Navigate with:
- `Tab` - next buffer
- `Shift+Tab` - previous buffer
- `<leader>x` - close current buffer

## 3. Theme Switcher

Press `<leader>th` (Space + th) to cycle through themes:
1. Tokyo Night (default, dark modern theme)
2. Catppuccin (pastel colors, mocha variant)
3. Gruvbox (retro colors)
4. Kanagawa (inspired by Japanese paintings)

Or use `:ThemeSet gruvbox` to switch to a specific theme.

## Key Bindings Summary

| Key | Action |
|-----|--------|
| `F1` | Insert/update 42 header |
| `Tab` | Next buffer/tab |
| `Shift+Tab` | Previous buffer/tab |
| `<leader>th` | Cycle theme (Space + th) |
| `<leader>x` | Close current buffer (Space + x) |
| `<leader>e` | Toggle file explorer (Space + e) |
| `<leader>nh` | Clear search highlight (Space + nh) |
| `;;` | Exit insert mode |
