vim.g.loaded_perl_provider = 0  -- Disable perl provider
vim.g.loaded_ruby_provider = 0  -- Disable ruby provider
vim.g.loaded_node_provider = 0  -- Disable node provider
vim.g.did_install_default_menus = 1  -- do not load menu

-- Custom mapping <leader> (see `:h mapleader` for more info)
vim.g.mapleader = ','

-- Use English as main language
vim.cmd [[language en_US.UTF-8]]

-- Do not load the tutor plugin
vim.g.loaded_tutor_mode_plugin = 1

-- Disable sql omni completion, it is broken.
vim.g.loaded_sql_completion = 1
