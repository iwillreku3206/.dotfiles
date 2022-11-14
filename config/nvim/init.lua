vim.g.CFG_FOLDER = vim.env["HOME"] .. "/.dotfiles/config/nvim"
CFG_FOLDER = vim.g.CFG_FOLDER


dofile(CFG_FOLDER .. "/scripts/options.lua")
dofile(CFG_FOLDER .. "/scripts/coc-extensions.lua")
dofile(CFG_FOLDER .. "/scripts/plugins.lua")

vim.cmd('source ~/.dotfiles/config/nvim/scripts/php.vim')

-- bindings are done in vimscript for now
vim.cmd([[
map <silent><C-o> :NvimTreeOpen<CR>
tmap <C-A-t> <C-\><C-n><C-A-t>
nmap <C-A-t> :ToggleTerm direction=horizontal<CR><Ins>
tmap <C-`> <C-\><C-n><C-`>
nmap <C-`> :ToggleTerm direction=horizontal<CR><Ins

inoremap <silent><expr> <C-space> coc#refresh()
inoremap <silent><expr> <C-S-space> coc#refresh()
nmap <silent> <S-F12> <Plug>(coc-definition)
nnoremap <silent> <C-g> :LazyGit<CR>
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
]])

-- CS presave hook (credit to doopNudles on SOF)
vim.cmd([[
function! s:CBCodeFormat() abort
  noautocmd write
  set nomodified
endfunction
autocmd BufWritePre *.cs call OmniSharp#actions#format#Format(function('s:CBCodeFormat'))

]])
