:set tabstop=2
:set shiftwidth=2
:set expandtab

:set number
:syntax on

let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"
let g:material_theme_style = 'ocean'


" reset the cursor on start (for older versions of vim, usually not required)
augroup myCmds
au!
autocmd VimEnter * silent !echo -ne "\e[2 q"
augroup END

colorscheme material

" set the color of background (for transparent bg in terminal)
highlight Normal ctermbg=black

autocmd BufRead,BufNewFile *.libsonnet set filetype=jsonnet
