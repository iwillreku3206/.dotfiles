set number
set tabstop=2
set shiftwidth=2
set expandtab

source ~/.dotfiles/config/nvim/plug.vim
call plug#begin()
Plug 'dracula/vim',{'name':'dracula'}
Plug 'kyazdani42/nvim-web-devicons' " optional, for file icons
Plug 'kyazdani42/nvim-tree.lua'
Plug 'akinsho/toggleterm.nvim', {'tag' : 'v2.*'}

Plug 'alec-gibson/nvim-tetris'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/jsonc.vim'
Plug 'google/vim-jsonnet'

call plug#end()

colorscheme dracula
lua require("nvim-tree").setup()
lua require("toggleterm").setup()
let g:coc_global_extensions = [
      \'coc-tsserver',
      \'coc-html',
      \'coc-css',
      \'coc-tailwindcss',
      \'coc-cmake',
      \'coc-docker',
      \'coc-eslint',
      \'coc-json',
      \'coc-java',
      \'coc-svelte',
      \'coc-vimlsp',
      \'coc-vetur',
      \'coc-pyright',
      \'coc-sh',
      \'coc-clangd',
      \'coc-phpls',
      \'@yaegassy/coc-tailwindcss3',
      \'coc-prettier']


map <silent><C-o> :NvimTreeOpen<CR>
map <C-i> <Nop>
tmap <C-`> <C-\><C-n><C-`>
nmap <C-`> :ToggleTerm direction=horizontal<CR>
inoremap <silent><expr> <C-space> coc#refresh()
nmap <silent> <S-F12> <Plug>(coc-definition)
