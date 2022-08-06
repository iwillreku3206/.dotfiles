set number
set tabstop=2
set shiftwidth=2
set expandtab
set termguicolors

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
Plug 'kdheepak/lazygit.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'princejoogie/tailwind-highlight.nvim'
Plug 'norcalli/nvim-colorizer.lua'

call plug#end()

colorscheme dracula
lua require("nvim-tree").setup()
lua require("toggleterm").setup()
lua << END
require('lualine').setup({
  options = {
    theme = 'powerline_dark'
  }
})
END
let g:coc_global_extensions = [
      \'coc-tsserver',
      \'coc-html',
      \'coc-css',
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
      \'coc-emmet',
      \'coc-phpls',
      \'@yaegassy/coc-tailwindcss3',
      \'coc-prettier']

lua require'colorizer'.setup()

lua <<END
local tw_highlight = require('tailwind-highlight')  
require('lspconfig').tailwindcss.setup({
  on_attach = function(client, bufnr)
  -- rest of you config
    tw_highlight.setup(client, bufnr, {
      single_column = false,
      mode = 'background',
      debounce = 200,
    })
  end
})
END

map <silent><C-o> :NvimTreeOpen<CR>
map <C-i> <Nop>
tmap <C-A-t> <C-\><C-n><C-A-t>
nmap <C-A-t> :ToggleTerm direction=horizontal<CR>
tmap <C-`> <C-\><C-n><C-A-`>
nmap <C-`> :ToggleTerm direction=horizontal<CR>

inoremap <silent><expr> <C-space> coc#refresh()
nmap <silent> <S-F12> <Plug>(coc-definition)
nnoremap <silent> <C-g> :LazyGit<CR>
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
