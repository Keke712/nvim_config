require("core")
require("config.lazy")

-- Source le script stdheader.vim pour l'en-tête 42
vim.cmd("source " .. vim.fn.stdpath("config") .. "/lua/plugins/stdheader.vim")

-- Charger le theme switcher
require("core.theme-switcher")
