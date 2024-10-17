-- some global settings
require("globals")

-- all the user-defined mappings
require("mappings")

--- local config_dir = vim.fn.stdpath("config")
---@cast config_dir string

require("config.lazy")
require("custom-autocmd")

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

vim.cmd("colorscheme rose-pine")
