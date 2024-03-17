vim.g.CFG_FOLDER = vim.env["HOME"] .. "/.dotfiles/config/nvim"
CFG_FOLDER = vim.g.CFG_FOLDER

vim.cmd('source ' .. CFG_FOLDER .. '/lua/iwillreku3206/electron.vim')

require("iwillreku3206.options")
require("iwillreku3206.plugins")
require("iwillreku3206.filetypes")
require("iwillreku3206.lsp")
require("iwillreku3206.keymaps")
require("iwillreku3206.profiler")
