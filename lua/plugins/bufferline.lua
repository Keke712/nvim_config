return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    require("bufferline").setup({
      options = {
        mode = "buffers",
        separator_style = "slant",
        always_show_bufferline = true,
        show_buffer_close_icons = true,
        show_close_icon = true,
        color_icons = true,
        right_mouse_command = nil,  -- Désactive le clic droit pour éviter fermeture accidentelle
        middle_mouse_command = nil, -- Désactive le clic milieu aussi
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Directory",
            text_align = "left",
            separator = true
          }
        },
      },
    })

    -- Keymaps pour naviguer entre les tabs
    local keymap = vim.keymap.set
    -- Navigation avec Tab (mode normal seulement, n'affecte pas l'indentation en insertion)
    keymap("n", "<Tab>", ":BufferLineCycleNext<CR>", { desc = "Onglet suivant" })
    keymap("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { desc = "Onglet précédent" })
    -- Alternatives avec leader pour ceux qui préfèrent garder Tab standard
    keymap("n", "<leader>bn", ":BufferLineCycleNext<CR>", { desc = "Onglet suivant (alt)" })
    keymap("n", "<leader>bb", ":BufferLineCyclePrev<CR>", { desc = "Onglet précédent (alt)" })
    -- Gestion des buffers
    keymap("n", "<leader>x", ":bdelete<CR>", { desc = "Fermer l'onglet actuel" })
    keymap("n", "<leader>bp", ":BufferLinePickClose<CR>", { desc = "Choisir un onglet à fermer" })
  end,
}
