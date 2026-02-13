-- ═══════════════════════════════════════════════════════════════════════════
-- Palettes de highlights personnalisées pour chaque thème
-- Chaque palette est conçue pour s'harmoniser avec son colorscheme
-- ═══════════════════════════════════════════════════════════════════════════

local M = {}

-- ─────────────────────────────────────────────────────────────────────────
-- TOKYO NIGHT — Cool, moderne, inspiré VS Code Dark+
-- ─────────────────────────────────────────────────────────────────────────
M.tokyonight = function()
	local set = vim.api.nvim_set_hl

	-- Variables
	set(0, "@variable",                    { fg = "#C0CAF5" })              -- Gris bleuté
	set(0, "@variable.builtin",            { fg = "#F7768E", italic = true }) -- self/cls: rose
	set(0, "@variable.parameter",          { fg = "#E0AF68", italic = true }) -- Params: jaune doré
	set(0, "@variable.parameter.builtin",  { fg = "#E0AF68", italic = true, bold = true })
	set(0, "@variable.member",             { fg = "#73DACA" })              -- obj.member: vert menthe

	-- Fonctions
	set(0, "@function",                    { fg = "#7AA2F7", bold = true }) -- Def: bleu vif
	set(0, "@function.call",               { fg = "#7DCFFF" })              -- Appel: bleu ciel (pas jaune pisse!)
	set(0, "@function.builtin",            { fg = "#0DB9D7", italic = true }) -- print(): turquoise
	set(0, "@function.macro",              { fg = "#FF9E64", bold = true }) -- Macro: orange
	set(0, "@function.method",             { fg = "#7AA2F7", bold = true }) -- Method def: bleu
	set(0, "@function.method.call",        { fg = "#7DCFFF" })              -- Method appel: bleu ciel

	-- Classes et types
	set(0, "@type",                        { fg = "#2AC3DE", bold = true }) -- Type: cyan
	set(0, "@type.builtin",                { fg = "#2AC3DE", italic = true }) -- int/str: cyan italic
	set(0, "@type.definition",             { fg = "#2AC3DE", bold = true, underline = true })
	set(0, "@type.qualifier",              { fg = "#BB9AF7", italic = true })
	set(0, "@constructor",                 { fg = "#2AC3DE", bold = true })

	-- Strings
	set(0, "@string",                      { fg = "#9ECE6A" })              -- Vert clair
	set(0, "@string.documentation",        { fg = "#6A8759", italic = true }) -- Docstring: vert olive
	set(0, "@string.escape",               { fg = "#FF9E64", bold = true }) -- \n: orange gras
	set(0, "@string.regex",                { fg = "#B4F9F8" })              -- Regex: cyan pâle
	set(0, "@string.special",              { fg = "#73DACA" })              -- f-string: menthe

	-- Nombres
	set(0, "@number",                      { fg = "#FF9E64" })              -- Orange
	set(0, "@number.float",                { fg = "#FF9E64" })
	set(0, "@boolean",                     { fg = "#FF9E64", bold = true })

	-- Keywords
	set(0, "@keyword",                     { fg = "#BB9AF7", bold = true }) -- Violet
	set(0, "@keyword.coroutine",           { fg = "#9D7CD8", bold = true, italic = true })
	set(0, "@keyword.function",            { fg = "#9D7CD8", bold = true }) -- def/lambda: violet foncé
	set(0, "@keyword.operator",            { fg = "#89DDFF" })              -- and/or: cyan
	set(0, "@keyword.return",              { fg = "#F7768E", bold = true }) -- return: rose vif
	set(0, "@keyword.import",              { fg = "#7DCFFF", italic = true }) -- import: bleu ciel
	set(0, "@keyword.conditional",         { fg = "#BB9AF7", bold = true })
	set(0, "@keyword.conditional.ternary", { fg = "#BB9AF7" })
	set(0, "@keyword.repeat",              { fg = "#BB9AF7", bold = true })
	set(0, "@keyword.exception",           { fg = "#DB4B4B", bold = true }) -- try/except: rouge
	set(0, "@keyword.modifier",            { fg = "#BB9AF7", italic = true })
	set(0, "@keyword.type",                { fg = "#9D7CD8", bold = true })
	set(0, "@keyword.directive",           { fg = "#7DCFFF", bold = true })
	set(0, "@keyword.storage",             { fg = "#BB9AF7", italic = true })

	-- Constantes
	set(0, "@constant",                    { fg = "#FF9E64", bold = true })
	set(0, "@constant.builtin",            { fg = "#F7768E", bold = true, italic = true }) -- None
	set(0, "@constant.macro",              { fg = "#FF9E64", bold = true })

	-- Opérateurs et ponctuation
	set(0, "@operator",                    { fg = "#89DDFF" })              -- Cyan
	set(0, "@punctuation.bracket",         { fg = "#A9B1D6" })              -- Brackets: gris
	set(0, "@punctuation.delimiter",       { fg = "#89DDFF" })
	set(0, "@punctuation.special",         { fg = "#BB9AF7" })

	-- Commentaires
	set(0, "@comment",                     { fg = "#565F89", italic = true })
	set(0, "@comment.documentation",       { fg = "#636DA6", italic = true })
	set(0, "@comment.error",               { fg = "#DB4B4B", bg = "#2D202A", bold = true })
	set(0, "@comment.warning",             { fg = "#E0AF68", bg = "#2D2920", bold = true })
	set(0, "@comment.todo",                { fg = "#1ABC9C", bg = "#1A2B32", bold = true })
	set(0, "@comment.note",                { fg = "#7AA2F7", bg = "#1E2030", bold = true })

	-- Décorateurs, propriétés, modules
	set(0, "@attribute",                   { fg = "#E0AF68", italic = true })
	set(0, "@attribute.builtin",           { fg = "#E0AF68", italic = true, bold = true })
	set(0, "@property",                    { fg = "#73DACA" })
	set(0, "@field",                       { fg = "#73DACA" })
	set(0, "@label",                       { fg = "#E0AF68", bold = true })
	set(0, "@module",                      { fg = "#F7768E" })              -- Module: rose
	set(0, "@module.builtin",              { fg = "#F7768E", italic = true })

	-- Markup
	set(0, "@markup.heading",     { fg = "#7AA2F7", bold = true })
	set(0, "@markup.heading.1",   { fg = "#7AA2F7", bold = true, underline = true })
	set(0, "@markup.heading.2",   { fg = "#2AC3DE", bold = true })
	set(0, "@markup.heading.3",   { fg = "#9ECE6A", bold = true })
	set(0, "@markup.strong",      { fg = "#FF9E64", bold = true })
	set(0, "@markup.italic",      { fg = "#BB9AF7", italic = true })
	set(0, "@markup.link",        { fg = "#7DCFFF", underline = true })
	set(0, "@markup.raw",         { fg = "#9ECE6A" })
	set(0, "@markup.list",        { fg = "#F7768E", bold = true })
	set(0, "@markup.quote",       { fg = "#6A8759", italic = true })

	-- Tags
	set(0, "@tag",                { fg = "#F7768E", bold = true })
	set(0, "@tag.attribute",      { fg = "#E0AF68", italic = true })
	set(0, "@tag.delimiter",      { fg = "#565F89" })

	-- Diff
	set(0, "@diff.plus",          { fg = "#9ECE6A" })
	set(0, "@diff.minus",         { fg = "#DB4B4B" })
	set(0, "@diff.delta",         { fg = "#7AA2F7" })

	-- LSP Semantic Tokens
	set(0, "@lsp.type.class.python",                       { fg = "#2AC3DE", bold = true })
	set(0, "@lsp.type.decorator.python",                   { fg = "#E0AF68", italic = true })
	set(0, "@lsp.type.function.python",                    { fg = "#7AA2F7", bold = true })
	set(0, "@lsp.type.method.python",                      { fg = "#7AA2F7", bold = true })
	set(0, "@lsp.type.parameter.python",                   { fg = "#E0AF68", italic = true })
	set(0, "@lsp.type.variable.python",                    { fg = "#C0CAF5" })
	set(0, "@lsp.type.property.python",                    { fg = "#73DACA" })
	set(0, "@lsp.type.namespace.python",                   { fg = "#F7768E" })
	set(0, "@lsp.typemod.function.builtin.python",         { fg = "#0DB9D7", italic = true })
	set(0, "@lsp.typemod.function.defaultLibrary.python",  { fg = "#0DB9D7", italic = true })
	set(0, "@lsp.typemod.class.declaration.python",        { fg = "#2AC3DE", bold = true, underline = true })
	set(0, "@lsp.typemod.variable.readonly.python",        { fg = "#FF9E64", bold = true })

	-- Général LSP
	set(0, "@lsp.type.class",       { fg = "#2AC3DE", bold = true })
	set(0, "@lsp.type.function",    { fg = "#7AA2F7", bold = true })
	set(0, "@lsp.type.method",      { fg = "#7AA2F7", bold = true })
	set(0, "@lsp.type.parameter",   { fg = "#E0AF68", italic = true })
	set(0, "@lsp.type.variable",    { fg = "#C0CAF5" })
	set(0, "@lsp.type.property",    { fg = "#73DACA" })
	set(0, "@lsp.type.namespace",   { fg = "#F7768E" })
	set(0, "@lsp.type.type",        { fg = "#2AC3DE" })
	set(0, "@lsp.type.macro",       { fg = "#FF9E64", bold = true })
	set(0, "@lsp.mod.deprecated",   { strikethrough = true })
end

-- ─────────────────────────────────────────────────────────────────────────
-- CATPPUCCIN MOCHA — Doux, pastel, chaleureux
-- ─────────────────────────────────────────────────────────────────────────
M.catppuccin = function()
	local set = vim.api.nvim_set_hl

	-- Variables
	set(0, "@variable",                    { fg = "#CDD6F4" })              -- Text
	set(0, "@variable.builtin",            { fg = "#F38BA8", italic = true }) -- Red
	set(0, "@variable.parameter",          { fg = "#EBA0AC", italic = true }) -- Maroon
	set(0, "@variable.parameter.builtin",  { fg = "#EBA0AC", italic = true, bold = true })
	set(0, "@variable.member",             { fg = "#94E2D5" })              -- Teal

	-- Fonctions
	set(0, "@function",                    { fg = "#89B4FA", bold = true }) -- Blue
	set(0, "@function.call",               { fg = "#FAB387" })              -- Peach ← distinct!
	set(0, "@function.builtin",            { fg = "#94E2D5", italic = true }) -- Teal
	set(0, "@function.macro",              { fg = "#F9E2AF", bold = true }) -- Yellow
	set(0, "@function.method",             { fg = "#89B4FA", bold = true })
	set(0, "@function.method.call",        { fg = "#FAB387" })              -- Peach

	-- Classes et types
	set(0, "@type",                        { fg = "#F9E2AF", bold = true }) -- Yellow
	set(0, "@type.builtin",                { fg = "#F9E2AF", italic = true })
	set(0, "@type.definition",             { fg = "#F9E2AF", bold = true, underline = true })
	set(0, "@type.qualifier",              { fg = "#CBA6F7", italic = true })
	set(0, "@constructor",                 { fg = "#F9E2AF", bold = true })

	-- Strings
	set(0, "@string",                      { fg = "#A6E3A1" })              -- Green
	set(0, "@string.documentation",        { fg = "#80B89A", italic = true })
	set(0, "@string.escape",               { fg = "#F5C2E7", bold = true }) -- Pink
	set(0, "@string.regex",                { fg = "#FAB387" })              -- Peach
	set(0, "@string.special",              { fg = "#94E2D5" })              -- Teal

	-- Nombres
	set(0, "@number",                      { fg = "#FAB387" })              -- Peach
	set(0, "@number.float",                { fg = "#FAB387" })
	set(0, "@boolean",                     { fg = "#FAB387", bold = true })

	-- Keywords
	set(0, "@keyword",                     { fg = "#CBA6F7", bold = true }) -- Mauve
	set(0, "@keyword.coroutine",           { fg = "#CBA6F7", bold = true, italic = true })
	set(0, "@keyword.function",            { fg = "#F38BA8", bold = true }) -- Red
	set(0, "@keyword.operator",            { fg = "#89DCEB" })              -- Sky
	set(0, "@keyword.return",              { fg = "#F38BA8", bold = true }) -- Red
	set(0, "@keyword.import",              { fg = "#89DCEB", italic = true }) -- Sky
	set(0, "@keyword.conditional",         { fg = "#CBA6F7", bold = true })
	set(0, "@keyword.conditional.ternary", { fg = "#CBA6F7" })
	set(0, "@keyword.repeat",              { fg = "#CBA6F7", bold = true })
	set(0, "@keyword.exception",           { fg = "#F38BA8", bold = true }) -- Red
	set(0, "@keyword.modifier",            { fg = "#CBA6F7", italic = true })
	set(0, "@keyword.type",                { fg = "#F38BA8", bold = true })
	set(0, "@keyword.directive",           { fg = "#89DCEB", bold = true })
	set(0, "@keyword.storage",             { fg = "#CBA6F7", italic = true })

	-- Constantes
	set(0, "@constant",                    { fg = "#FAB387", bold = true }) -- Peach
	set(0, "@constant.builtin",            { fg = "#F38BA8", bold = true, italic = true })
	set(0, "@constant.macro",              { fg = "#F9E2AF", bold = true })

	-- Opérateurs
	set(0, "@operator",                    { fg = "#89DCEB" })              -- Sky
	set(0, "@punctuation.bracket",         { fg = "#BAC2DE" })              -- Subtext
	set(0, "@punctuation.delimiter",       { fg = "#89DCEB" })
	set(0, "@punctuation.special",         { fg = "#CBA6F7" })

	-- Commentaires
	set(0, "@comment",                     { fg = "#6C7086", italic = true }) -- Overlay0
	set(0, "@comment.documentation",       { fg = "#7F849C", italic = true })
	set(0, "@comment.error",               { fg = "#F38BA8", bg = "#302030", bold = true })
	set(0, "@comment.warning",             { fg = "#F9E2AF", bg = "#302820", bold = true })
	set(0, "@comment.todo",               { fg = "#94E2D5", bg = "#1A2B32", bold = true })
	set(0, "@comment.note",                { fg = "#89B4FA", bg = "#1E2030", bold = true })

	-- Décorateurs, propriétés, modules
	set(0, "@attribute",                   { fg = "#F9E2AF", italic = true })
	set(0, "@attribute.builtin",           { fg = "#F9E2AF", italic = true, bold = true })
	set(0, "@property",                    { fg = "#94E2D5" })
	set(0, "@field",                       { fg = "#94E2D5" })
	set(0, "@label",                       { fg = "#FAB387", bold = true })
	set(0, "@module",                      { fg = "#F5C2E7" })              -- Pink
	set(0, "@module.builtin",              { fg = "#F5C2E7", italic = true })

	-- Markup
	set(0, "@markup.heading",     { fg = "#89B4FA", bold = true })
	set(0, "@markup.heading.1",   { fg = "#89B4FA", bold = true, underline = true })
	set(0, "@markup.heading.2",   { fg = "#CBA6F7", bold = true })
	set(0, "@markup.heading.3",   { fg = "#A6E3A1", bold = true })
	set(0, "@markup.strong",      { fg = "#FAB387", bold = true })
	set(0, "@markup.italic",      { fg = "#CBA6F7", italic = true })
	set(0, "@markup.link",        { fg = "#89B4FA", underline = true })
	set(0, "@markup.raw",         { fg = "#A6E3A1" })
	set(0, "@markup.list",        { fg = "#F38BA8", bold = true })
	set(0, "@markup.quote",       { fg = "#80B89A", italic = true })

	-- Tags
	set(0, "@tag",                { fg = "#F38BA8", bold = true })
	set(0, "@tag.attribute",      { fg = "#F9E2AF", italic = true })
	set(0, "@tag.delimiter",      { fg = "#6C7086" })

	-- Diff
	set(0, "@diff.plus",          { fg = "#A6E3A1" })
	set(0, "@diff.minus",         { fg = "#F38BA8" })
	set(0, "@diff.delta",         { fg = "#89B4FA" })

	-- LSP
	set(0, "@lsp.type.class",       { fg = "#F9E2AF", bold = true })
	set(0, "@lsp.type.function",    { fg = "#89B4FA", bold = true })
	set(0, "@lsp.type.method",      { fg = "#89B4FA", bold = true })
	set(0, "@lsp.type.parameter",   { fg = "#EBA0AC", italic = true })
	set(0, "@lsp.type.variable",    { fg = "#CDD6F4" })
	set(0, "@lsp.type.property",    { fg = "#94E2D5" })
	set(0, "@lsp.type.namespace",   { fg = "#F5C2E7" })
	set(0, "@lsp.type.type",        { fg = "#F9E2AF" })
	set(0, "@lsp.type.macro",       { fg = "#F9E2AF", bold = true })
	set(0, "@lsp.mod.deprecated",   { strikethrough = true })
end

-- ─────────────────────────────────────────────────────────────────────────
-- GRUVBOX — Rétro, terreux, chaleureux
-- ─────────────────────────────────────────────────────────────────────────
M.gruvbox = function()
	local set = vim.api.nvim_set_hl

	-- Variables
	set(0, "@variable",                    { fg = "#EBDBB2" })              -- FG clair
	set(0, "@variable.builtin",            { fg = "#FE8019", italic = true }) -- Orange
	set(0, "@variable.parameter",          { fg = "#83A598", italic = true }) -- Aqua
	set(0, "@variable.parameter.builtin",  { fg = "#83A598", italic = true, bold = true })
	set(0, "@variable.member",             { fg = "#8EC07C" })              -- Bright aqua

	-- Fonctions
	set(0, "@function",                    { fg = "#FABD2F", bold = true }) -- Yellow
	set(0, "@function.call",               { fg = "#83A598" })              -- Aqua ← distinct des strings!
	set(0, "@function.builtin",            { fg = "#8EC07C", italic = true }) -- Bright aqua
	set(0, "@function.macro",              { fg = "#FE8019", bold = true }) -- Orange
	set(0, "@function.method",             { fg = "#FABD2F", bold = true })
	set(0, "@function.method.call",        { fg = "#83A598" })              -- Aqua

	-- Classes et types
	set(0, "@type",                        { fg = "#FE8019", bold = true }) -- Orange
	set(0, "@type.builtin",                { fg = "#FE8019", italic = true })
	set(0, "@type.definition",             { fg = "#FE8019", bold = true, underline = true })
	set(0, "@type.qualifier",              { fg = "#FB4934", italic = true })
	set(0, "@constructor",                 { fg = "#FE8019", bold = true })

	-- Strings
	set(0, "@string",                      { fg = "#B8BB26" })              -- Green
	set(0, "@string.documentation",        { fg = "#8A8725", italic = true })
	set(0, "@string.escape",               { fg = "#FE8019", bold = true })
	set(0, "@string.regex",                { fg = "#83A598" })
	set(0, "@string.special",              { fg = "#8EC07C" })

	-- Nombres
	set(0, "@number",                      { fg = "#D3869B" })              -- Purple
	set(0, "@number.float",                { fg = "#D3869B" })
	set(0, "@boolean",                     { fg = "#D3869B", bold = true })

	-- Keywords
	set(0, "@keyword",                     { fg = "#FB4934", bold = true }) -- Red
	set(0, "@keyword.coroutine",           { fg = "#FB4934", bold = true, italic = true })
	set(0, "@keyword.function",            { fg = "#FB4934", bold = true }) -- Red
	set(0, "@keyword.operator",            { fg = "#FABD2F" })              -- Yellow
	set(0, "@keyword.return",              { fg = "#FB4934", bold = true })
	set(0, "@keyword.import",              { fg = "#83A598", italic = true }) -- Aqua
	set(0, "@keyword.conditional",         { fg = "#FB4934", bold = true })
	set(0, "@keyword.conditional.ternary", { fg = "#FB4934" })
	set(0, "@keyword.repeat",              { fg = "#FB4934", bold = true })
	set(0, "@keyword.exception",           { fg = "#CC241D", bold = true }) -- Dark red
	set(0, "@keyword.modifier",            { fg = "#FB4934", italic = true })
	set(0, "@keyword.type",                { fg = "#FB4934", bold = true })
	set(0, "@keyword.directive",           { fg = "#83A598", bold = true })
	set(0, "@keyword.storage",             { fg = "#FB4934", italic = true })

	-- Constantes
	set(0, "@constant",                    { fg = "#D3869B", bold = true })
	set(0, "@constant.builtin",            { fg = "#D3869B", bold = true, italic = true })
	set(0, "@constant.macro",              { fg = "#FE8019", bold = true })

	-- Opérateurs
	set(0, "@operator",                    { fg = "#EBDBB2" })
	set(0, "@punctuation.bracket",         { fg = "#A89984" })              -- Gray
	set(0, "@punctuation.delimiter",       { fg = "#EBDBB2" })
	set(0, "@punctuation.special",         { fg = "#FB4934" })

	-- Commentaires
	set(0, "@comment",                     { fg = "#928374", italic = true }) -- Gray
	set(0, "@comment.documentation",       { fg = "#A89984", italic = true })
	set(0, "@comment.error",               { fg = "#CC241D", bg = "#3C1E1E", bold = true })
	set(0, "@comment.warning",             { fg = "#FABD2F", bg = "#3C3520", bold = true })
	set(0, "@comment.todo",               { fg = "#8EC07C", bg = "#2A3520", bold = true })
	set(0, "@comment.note",                { fg = "#83A598", bg = "#1E2C30", bold = true })

	-- Décorateurs, propriétés, modules
	set(0, "@attribute",                   { fg = "#8EC07C", italic = true })
	set(0, "@attribute.builtin",           { fg = "#8EC07C", italic = true, bold = true })
	set(0, "@property",                    { fg = "#83A598" })
	set(0, "@field",                       { fg = "#83A598" })
	set(0, "@label",                       { fg = "#FABD2F", bold = true })
	set(0, "@module",                      { fg = "#D3869B" })              -- Purple
	set(0, "@module.builtin",              { fg = "#D3869B", italic = true })

	-- Markup
	set(0, "@markup.heading",     { fg = "#FABD2F", bold = true })
	set(0, "@markup.heading.1",   { fg = "#FABD2F", bold = true, underline = true })
	set(0, "@markup.heading.2",   { fg = "#FE8019", bold = true })
	set(0, "@markup.heading.3",   { fg = "#B8BB26", bold = true })
	set(0, "@markup.strong",      { fg = "#FE8019", bold = true })
	set(0, "@markup.italic",      { fg = "#D3869B", italic = true })
	set(0, "@markup.link",        { fg = "#83A598", underline = true })
	set(0, "@markup.raw",         { fg = "#B8BB26" })
	set(0, "@markup.list",        { fg = "#FB4934", bold = true })
	set(0, "@markup.quote",       { fg = "#8A8725", italic = true })

	-- Tags
	set(0, "@tag",                { fg = "#FB4934", bold = true })
	set(0, "@tag.attribute",      { fg = "#FABD2F", italic = true })
	set(0, "@tag.delimiter",      { fg = "#928374" })

	-- Diff
	set(0, "@diff.plus",          { fg = "#B8BB26" })
	set(0, "@diff.minus",         { fg = "#FB4934" })
	set(0, "@diff.delta",         { fg = "#83A598" })

	-- LSP
	set(0, "@lsp.type.class",       { fg = "#FE8019", bold = true })
	set(0, "@lsp.type.function",    { fg = "#FABD2F", bold = true })
	set(0, "@lsp.type.method",      { fg = "#FABD2F", bold = true })
	set(0, "@lsp.type.parameter",   { fg = "#83A598", italic = true })
	set(0, "@lsp.type.variable",    { fg = "#EBDBB2" })
	set(0, "@lsp.type.property",    { fg = "#83A598" })
	set(0, "@lsp.type.namespace",   { fg = "#D3869B" })
	set(0, "@lsp.type.type",        { fg = "#FE8019" })
	set(0, "@lsp.type.macro",       { fg = "#FE8019", bold = true })
	set(0, "@lsp.mod.deprecated",   { strikethrough = true })
end

-- ─────────────────────────────────────────────────────────────────────────
-- KANAGAWA — Encre japonaise, couleurs riches et subtiles
-- ─────────────────────────────────────────────────────────────────────────
M.kanagawa = function()
	local set = vim.api.nvim_set_hl

	-- Variables
	set(0, "@variable",                    { fg = "#DCD7BA" })              -- FG chaud
	set(0, "@variable.builtin",            { fg = "#E46876", italic = true }) -- Wave red
	set(0, "@variable.parameter",          { fg = "#E6C384", italic = true }) -- Carp yellow
	set(0, "@variable.parameter.builtin",  { fg = "#E6C384", italic = true, bold = true })
	set(0, "@variable.member",             { fg = "#7AA89F" })              -- Spring green

	-- Fonctions
	set(0, "@function",                    { fg = "#7E9CD8", bold = true }) -- Crystal blue
	set(0, "@function.call",               { fg = "#D27E99" })              -- Sakura pink ← distinct!
	set(0, "@function.builtin",            { fg = "#7FB4CA", italic = true }) -- Spring blue
	set(0, "@function.macro",              { fg = "#FFA066", bold = true }) -- Surimi orange
	set(0, "@function.method",             { fg = "#7E9CD8", bold = true })
	set(0, "@function.method.call",        { fg = "#D27E99" })

	-- Classes et types
	set(0, "@type",                        { fg = "#7AA89F", bold = true }) -- Wave aqua
	set(0, "@type.builtin",                { fg = "#7AA89F", italic = true })
	set(0, "@type.definition",             { fg = "#7AA89F", bold = true, underline = true })
	set(0, "@type.qualifier",              { fg = "#957FB8", italic = true })
	set(0, "@constructor",                 { fg = "#7AA89F", bold = true })

	-- Strings
	set(0, "@string",                      { fg = "#98BB6C" })              -- Spring green
	set(0, "@string.documentation",        { fg = "#7A9F54", italic = true })
	set(0, "@string.escape",               { fg = "#FFA066", bold = true }) -- Orange
	set(0, "@string.regex",                { fg = "#E6C384" })              -- Yellow
	set(0, "@string.special",              { fg = "#7FB4CA" })              -- Spring blue

	-- Nombres
	set(0, "@number",                      { fg = "#D27E99" })              -- Sakura pink
	set(0, "@number.float",                { fg = "#D27E99" })
	set(0, "@boolean",                     { fg = "#FFA066", bold = true }) -- Orange

	-- Keywords
	set(0, "@keyword",                     { fg = "#957FB8", bold = true }) -- Oni violet
	set(0, "@keyword.coroutine",           { fg = "#957FB8", bold = true, italic = true })
	set(0, "@keyword.function",            { fg = "#957FB8", bold = true })
	set(0, "@keyword.operator",            { fg = "#C0A36E" })              -- Boat yellow
	set(0, "@keyword.return",              { fg = "#E46876", bold = true }) -- Wave red
	set(0, "@keyword.import",              { fg = "#7FB4CA", italic = true }) -- Spring blue
	set(0, "@keyword.conditional",         { fg = "#957FB8", bold = true })
	set(0, "@keyword.conditional.ternary", { fg = "#957FB8" })
	set(0, "@keyword.repeat",              { fg = "#957FB8", bold = true })
	set(0, "@keyword.exception",           { fg = "#FF5D62", bold = true }) -- Peach red
	set(0, "@keyword.modifier",            { fg = "#957FB8", italic = true })
	set(0, "@keyword.type",                { fg = "#957FB8", bold = true })
	set(0, "@keyword.directive",           { fg = "#7FB4CA", bold = true })
	set(0, "@keyword.storage",             { fg = "#957FB8", italic = true })

	-- Constantes
	set(0, "@constant",                    { fg = "#FFA066", bold = true })
	set(0, "@constant.builtin",            { fg = "#E46876", bold = true, italic = true })
	set(0, "@constant.macro",              { fg = "#FFA066", bold = true })

	-- Opérateurs
	set(0, "@operator",                    { fg = "#C0A36E" })              -- Boat yellow
	set(0, "@punctuation.bracket",         { fg = "#9A8A6A" })              -- Muted
	set(0, "@punctuation.delimiter",       { fg = "#C0A36E" })
	set(0, "@punctuation.special",         { fg = "#957FB8" })

	-- Commentaires
	set(0, "@comment",                     { fg = "#727169", italic = true }) -- Fuji gray
	set(0, "@comment.documentation",       { fg = "#8A8980", italic = true })
	set(0, "@comment.error",               { fg = "#FF5D62", bg = "#2D1F20", bold = true })
	set(0, "@comment.warning",             { fg = "#E6C384", bg = "#2D2820", bold = true })
	set(0, "@comment.todo",               { fg = "#7AA89F", bg = "#1A2B28", bold = true })
	set(0, "@comment.note",                { fg = "#7E9CD8", bg = "#1E2030", bold = true })

	-- Décorateurs, propriétés, modules
	set(0, "@attribute",                   { fg = "#E6C384", italic = true })
	set(0, "@attribute.builtin",           { fg = "#E6C384", italic = true, bold = true })
	set(0, "@property",                    { fg = "#7AA89F" })
	set(0, "@field",                       { fg = "#7AA89F" })
	set(0, "@label",                       { fg = "#E6C384", bold = true })
	set(0, "@module",                      { fg = "#E46876" })              -- Wave red
	set(0, "@module.builtin",              { fg = "#E46876", italic = true })

	-- Markup
	set(0, "@markup.heading",     { fg = "#7E9CD8", bold = true })
	set(0, "@markup.heading.1",   { fg = "#7E9CD8", bold = true, underline = true })
	set(0, "@markup.heading.2",   { fg = "#957FB8", bold = true })
	set(0, "@markup.heading.3",   { fg = "#98BB6C", bold = true })
	set(0, "@markup.strong",      { fg = "#FFA066", bold = true })
	set(0, "@markup.italic",      { fg = "#957FB8", italic = true })
	set(0, "@markup.link",        { fg = "#7FB4CA", underline = true })
	set(0, "@markup.raw",         { fg = "#98BB6C" })
	set(0, "@markup.list",        { fg = "#E46876", bold = true })
	set(0, "@markup.quote",       { fg = "#7A9F54", italic = true })

	-- Tags
	set(0, "@tag",                { fg = "#E46876", bold = true })
	set(0, "@tag.attribute",      { fg = "#E6C384", italic = true })
	set(0, "@tag.delimiter",      { fg = "#727169" })

	-- Diff
	set(0, "@diff.plus",          { fg = "#98BB6C" })
	set(0, "@diff.minus",         { fg = "#E46876" })
	set(0, "@diff.delta",         { fg = "#7E9CD8" })

	-- LSP
	set(0, "@lsp.type.class",       { fg = "#7AA89F", bold = true })
	set(0, "@lsp.type.function",    { fg = "#7E9CD8", bold = true })
	set(0, "@lsp.type.method",      { fg = "#7E9CD8", bold = true })
	set(0, "@lsp.type.parameter",   { fg = "#E6C384", italic = true })
	set(0, "@lsp.type.variable",    { fg = "#DCD7BA" })
	set(0, "@lsp.type.property",    { fg = "#7AA89F" })
	set(0, "@lsp.type.namespace",   { fg = "#E46876" })
	set(0, "@lsp.type.type",        { fg = "#7AA89F" })
	set(0, "@lsp.type.macro",       { fg = "#FFA066", bold = true })
	set(0, "@lsp.mod.deprecated",   { strikethrough = true })
end

-- ─────────────────────────────────────────────────────────────────────────
-- NIGHTFOX — Forêt nocturne, bleus profonds
-- ─────────────────────────────────────────────────────────────────────────
M.nightfox = function()
	local set = vim.api.nvim_set_hl
	set(0, "@variable",                    { fg = "#CDCECF" })
	set(0, "@variable.builtin",            { fg = "#C94F6D", italic = true })
	set(0, "@variable.parameter",          { fg = "#F4A261", italic = true })
	set(0, "@variable.member",             { fg = "#63CDCF" })
	set(0, "@function",                    { fg = "#719CD6", bold = true })
	set(0, "@function.call",               { fg = "#81B29A" })
	set(0, "@function.builtin",            { fg = "#63CDCF", italic = true })
	set(0, "@function.method.call",        { fg = "#81B29A" })
	set(0, "@type",                        { fg = "#DFDFE0", bold = true })
	set(0, "@string",                      { fg = "#81B29A" })
	set(0, "@number",                      { fg = "#F4A261" })
	set(0, "@keyword",                     { fg = "#9D79D6", bold = true })
	set(0, "@keyword.return",              { fg = "#C94F6D", bold = true })
	set(0, "@comment",                     { fg = "#738091", italic = true })
	set(0, "@property",                    { fg = "#63CDCF" })
	set(0, "@module",                      { fg = "#C94F6D" })
	set(0, "@lsp.type.function",           { fg = "#719CD6", bold = true })
end

-- ─────────────────────────────────────────────────────────────────────────
-- BAMBOO — Nature chaleureuse, verts et jaunes
-- ─────────────────────────────────────────────────────────────────────────
M.bamboo = function()
	local set = vim.api.nvim_set_hl
	set(0, "@variable",                    { fg = "#DDD8BE" })
	set(0, "@variable.builtin",            { fg = "#E86868", italic = true })
	set(0, "@variable.parameter",          { fg = "#E0AF68", italic = true })
	set(0, "@variable.member",             { fg = "#7FB4CA" })
	set(0, "@function",                    { fg = "#8FB573", bold = true })
	set(0, "@function.call",               { fg = "#E0AF68" })
	set(0, "@function.builtin",            { fg = "#7FB4CA", italic = true })
	set(0, "@function.method.call",        { fg = "#E0AF68" })
	set(0, "@type",                        { fg = "#E78A4E", bold = true })
	set(0, "@string",                      { fg = "#8FB573" })
	set(0, "@number",                      { fg = "#E78A4E" })
	set(0, "@keyword",                     { fg = "#D27E99", bold = true })
	set(0, "@keyword.return",              { fg = "#E86868", bold = true })
	set(0, "@comment",                     { fg = "#6F7C6A", italic = true })
	set(0, "@property",                    { fg = "#7FB4CA" })
	set(0, "@module",                      { fg = "#E86868" })
	set(0, "@lsp.type.function",           { fg = "#8FB573", bold = true })
end

-- ─────────────────────────────────────────────────────────────────────────
-- NORDIC — Froid nordique, bleus glacés
-- ─────────────────────────────────────────────────────────────────────────
M.nordic = function()
	local set = vim.api.nvim_set_hl
	set(0, "@variable",                    { fg = "#E5E9F0" })
	set(0, "@variable.builtin",            { fg = "#BF616A", italic = true })
	set(0, "@variable.parameter",          { fg = "#EBCB8B", italic = true })
	set(0, "@variable.member",             { fg = "#88C0D0" })
	set(0, "@function",                    { fg = "#81A1C1", bold = true })
	set(0, "@function.call",               { fg = "#A3BE8C" })
	set(0, "@function.builtin",            { fg = "#88C0D0", italic = true })
	set(0, "@function.method.call",        { fg = "#A3BE8C" })
	set(0, "@type",                        { fg = "#8FBCBB", bold = true })
	set(0, "@string",                      { fg = "#A3BE8C" })
	set(0, "@number",                      { fg = "#B48EAD" })
	set(0, "@keyword",                     { fg = "#81A1C1", bold = true })
	set(0, "@keyword.return",              { fg = "#BF616A", bold = true })
	set(0, "@comment",                     { fg = "#616E88", italic = true })
	set(0, "@property",                    { fg = "#88C0D0" })
	set(0, "@module",                      { fg = "#BF616A" })
	set(0, "@lsp.type.function",           { fg = "#81A1C1", bold = true })
end

-- ─────────────────────────────────────────────────────────────────────────
-- Détection automatique et application
-- ─────────────────────────────────────────────────────────────────────────
function M.apply()
	local colorscheme = vim.g.colors_name or ""

	if colorscheme:find("tokyonight") then
		M.tokyonight()
	elseif colorscheme:find("catppuccin") then
		M.catppuccin()
	elseif colorscheme:find("gruvbox") then
		M.gruvbox()
	elseif colorscheme:find("kanagawa") then
		M.kanagawa()
	elseif colorscheme:find("nightfox") or colorscheme:find("duskfox") or colorscheme:find("nordfox") then
		M.nightfox()
	elseif colorscheme:find("bamboo") then
		M.bamboo()
	elseif colorscheme:find("nordic") then
		M.nordic()
	end
end

-- Auto-appliquer à chaque changement de colorscheme
vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	callback = function()
		vim.defer_fn(function()
			M.apply()
		end, 10)
	end,
})

return M
