vim.g.CFG_FOLDER = vim.env["HOME"] .. "/.dotfiles/config/nvim"
CFG_FOLDER = vim.g.CFG_FOLDER

vim.cmd('source ' .. CFG_FOLDER .. '/scripts/electron.vim')
-- dofile(CFG_FOLDER .. "/scripts/electron.lua")
dofile(CFG_FOLDER .. "/scripts/options.lua")
dofile(CFG_FOLDER .. "/scripts/plugins.lua")
dofile(CFG_FOLDER .. "/scripts/filetypes.lua")
vim.cmd('source ' .. CFG_FOLDER .. '/scripts/filetypes.vim')
dofile(CFG_FOLDER .. "/scripts/lsp.lua")
dofile(CFG_FOLDER .. "/scripts/keymaps.lua")
dofile(CFG_FOLDER .. "/scripts/profiler.lua")
