vim.g.CFG_FOLDER = vim.env["HOME"] .. "/.dotfiles/config/nvim"
CFG_FOLDER = vim.g.CFG_FOLDER

vim.cmd('source ' .. CFG_FOLDER .. '/lua/iwillreku3206/electron.vim')

-- keys that i can use:
-- z, n, m, leader
-- gX fX, <leader>, ;X
--

-- plugins to add:
-- harpoon

-- remove: nvim-tree

require("iwillreku3206.keymap")
require("iwillreku3206.options")
require("iwillreku3206.plugins")
require("iwillreku3206.filetypes")
