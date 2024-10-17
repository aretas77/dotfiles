return {
  "nvim-treesitter/nvim-treesitter",
  enabled = true,
  build = ":TSUpdate",
  config = function()
    require("config.treesitter")
  end,
}
