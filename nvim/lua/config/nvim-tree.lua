local keymap = vim.keymap
local nvim_tree = require("nvim-tree")
local api = require("nvim-tree.api")

-- open as vsplit on current node
local function vsplit_preview()
  local node = api.tree.get_node_under_cursor()

  if node.nodes ~= nil then
    -- expand or collapse folder
    api.node.open.edit()
  else
    -- open file as vsplit
    api.node.open.vertical()
  end

  -- Finally refocus on tree if it was lost
  api.tree.focus()
end

local function my_on_attach(bufnr)
  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  keymap.set('n', '<C-t>', api.tree.change_root_to_parent,        opts('Up'))
  keymap.set('n', '?',     api.tree.toggle_help,                  opts('Help'))
  keymap.set('n', '<C-v>', api.node.open.vertical,                opts('Open: Vertical Split'))
  keymap.set('n', '<C-x>', api.node.open.horizontal,              opts('Open: Horizontal Split'))
end

nvim_tree.setup {
  auto_reload_on_write = true,
  hijack_cursor = false,
  open_on_tab = false,
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
  on_attach = my_on_attach
}

keymap.set("n", "<space>s", require("nvim-tree.api").tree.toggle, {
  silent = true,
  desc = "toggle nvim-tree",
})
