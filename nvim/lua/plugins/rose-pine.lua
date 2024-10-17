return {
  "rose-pine/neovim",
  version = "*",
  config = function()
    require("rose-pine").setup({
      variant = "moon", -- auto, main, moon, or dawn
      dark_variant = "auto", -- auto, main, moon, or dawn

      enable = {
        terminal = true,
        migrations = true, -- Handle deprecated options automatically
      },

    })
  end,
}
