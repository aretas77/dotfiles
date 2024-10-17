local treesitter = require("nvim-treesitter.configs")

treesitter.setup {
  ensure_installed = { "python", "cpp", "lua", "vim", "json" },
  highlight = {
    enable = true,
    disable = { 'help' }, -- list of language that will be disabled
  },
}
