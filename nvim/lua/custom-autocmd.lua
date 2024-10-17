local fn = vim.fn
local api = vim.api

-- highlight yanked region, see `:h lua-highlight`
local yank_group = api.nvim_create_augroup("highlight_yank", { clear = true })
api.nvim_create_autocmd({ "TextYankPost" }, {
  pattern = "*",
  group = yank_group,
  callback = function()
    vim.highlight.on_yank { higroup = "YankColor", timeout = 300 }
  end,
})

-- Automatically reload the file if it is changed outside of Nvim, see https://unix.stackexchange.com/a/383044/221410.
-- It seems that `checktime` does not work in command line. We need to check if we are in command
-- line before executing this command, see also https://vi.stackexchange.com/a/20397/15292 .
api.nvim_create_augroup("auto_read", { clear = true })

api.nvim_create_autocmd({ "FileChangedShellPost" }, {
  pattern = "*",
  group = "auto_read",
  callback = function()
    vim.notify("File changed on disk. Buffer reloaded!", vim.log.levels.WARN, { title = "nvim-config" })
  end,
})
