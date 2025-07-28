-- Mise en place et installation de lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Configuration de lazy.nvim et importation du répertoire `plugins`
require("lazy").setup({ { import = "plugins" } }, {
  -- désactive la pénible notification au démarrage
  change_detection = {
    notify = false,
  },
})

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    require("nvim-tree.api").tree.open()
    vim.cmd("wincmd p")  -- Revenir à la fenêtre précédente (ton fichier)
  end
})

vim.opt.expandtab = false      -- Utilise des tabs, pas des espaces
vim.opt.tabstop = 4           -- Largeur d’un tab affiché : 4 espaces
vim.opt.shiftwidth = 4        -- Indentation automatique : 4 espaces
