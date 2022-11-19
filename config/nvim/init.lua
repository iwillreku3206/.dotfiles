vim.g.CFG_FOLDER = vim.env["HOME"] .. "/.dotfiles/config/nvim"
CFG_FOLDER = vim.g.CFG_FOLDER


dofile(CFG_FOLDER .. "/scripts/options.lua")
dofile(CFG_FOLDER .. "/scripts/plugins.lua")
dofile(CFG_FOLDER .. "/scripts/filetypes.lua")
dofile(CFG_FOLDER .. "/scripts/lsp.lua")

-- bindings are done in vimscript for now
vim.cmd([[
map <silent><C-o> :NvimTreeOpen<CR>
tmap <C-A-t> <C-\><C-n><C-A-t>
nmap <C-A-t> :ToggleTerm direction=horizontal<CR><Ins>
tmap <C-`> <C-\><C-n><C-`>
nmap <C-`> :ToggleTerm direction=horizontal<CR><Ins

nnoremap <silent> <C-g> :LazyGit<CR>
]])

-- CS presave hook (credit to doopNudles on SOF)
vim.cmd([[
function! s:CBCodeFormat() abort
  noautocmd write
  set nomodified
endfunction
autocmd BufWritePre *.cs call OmniSharp#actions#format#Format(function('s:CBCodeFormat'))

]])
