vim.g.CFG_FOLDER = vim.env["HOME"] .. "/.dotfiles/config/nvim"
CFG_FOLDER = vim.g.CFG_FOLDER


dofile(CFG_FOLDER .. "/scripts/options.lua")
dofile(CFG_FOLDER .. "/scripts/plugins.lua")
dofile(CFG_FOLDER .. "/scripts/filetypes.lua")
dofile(CFG_FOLDER .. "/scripts/lsp.lua")
dofile(CFG_FOLDER .. "/scripts/keymaps.lua")


-- CS presave hook (credit to doopNudles on SOF)
vim.cmd([[
function! s:CBCodeFormat() abort
  noautocmd write
  set nomodified
endfunction
autocmd BufWritePre *.cs call OmniSharp#actions#format#Format(function('s:CBCodeFormat'))

]])
