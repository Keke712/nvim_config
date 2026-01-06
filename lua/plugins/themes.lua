return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 900,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha", -- latte, frappe, macchiato, mocha
      })
    end,
  },
  {
    "ellisonleao/gruvbox.nvim",
    priority = 900,
    config = function()
      require("gruvbox").setup({})
    end,
  },
  {
    "rebelot/kanagawa.nvim",
    priority = 900,
    config = function()
      require("kanagawa").setup({})
    end,
  },
}
