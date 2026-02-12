return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup({
      actions = {
        open_file = {
          quit_on_open = false,
        },
      },
    })

    -- On utilise <leader>e pour basculer vers la fenêtre suivante
    vim.keymap.set(
      "n",
      "<leader>e",
      "<C-w>w",
      { desc = "Basculer vers la fenêtre suivante" }
    )
  end,
}

