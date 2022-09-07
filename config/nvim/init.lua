vim.wo.number = true
vim.api.nvim_set_option('tabstop', 2)
vim.api.nvim_set_option('shiftwidth', 2)
vim.api.nvim_set_option('expandtab', true)
vim.api.nvim_set_option('termguicolors', true)
vim.api.nvim_set_option('title', true)

function t(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PackerBootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
end

vim.g.coc_global_extensions = {
  'coc-tsserver',
  'coc-html',
  'coc-css',
  'coc-cmake',
  'coc-docker',
  'coc-eslint',
  'coc-json',
  'coc-java',
  'coc-svelte',
  'coc-vimlsp',
  'coc-vetur',
  'coc-pyright',
  'coc-sh',
  'coc-clangd',
  'coc-emmet',
  'coc-phpls',
  '@yaegassy/coc-tailwindcss3',
  'coc-prettier',
  'coc-phpls',
  'coc-lua'
}

require('packer').startup(function(use)
  use {'dracula/vim',
    as = 'dracula',
    config = function () vim.cmd('colorscheme dracula') end
  }
  use 'kyazdani42/nvim-web-devicons'
  use {'kyazdani42/nvim-tree.lua',
    config = function () require('nvim-tree').setup() end,
    requires = "nvim-web-devicons"
  }
  use {'akinsho/toggleterm.nvim',
    tag = 'v2.*',
    config = function () require('toggleterm').setup() end
  }

  use 'alec-gibson/nvim-tetris'

  use {'neoclide/coc.nvim', branch = 'release'}
  use 'neoclide/jsonc.vim'
  use 'google/vim-jsonnet'
  use 'kdheepak/lazygit.nvim'
  use {'nvim-lualine/lualine.nvim',
    config = function ()
      require('lualine').setup{
        options = {
          theme = 'powerline_dark'
        }
      }
    end
  }
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'
  use {'princejoogie/tailwind-highlight.nvim',
    requires = {"neovim/nvim-lspconfig", "nvim-lsp-installer"},
    config = function ()
      local tw_highlight = require('tailwind-highlight')
      require('lspconfig').tailwindcss.setup({
        on_attach = function(client, bufnr)
          tw_highlight.setup(client, bufnr, {
            single_column = false,
            mode = 'background',
            debounce = 200,
          })
        end
      })
    end
  }
  use {'norcalli/nvim-colorizer.lua',
    config = function () require'colorizer'.setup() end
  }
  use 'rafcamlet/coc-nvim-lua'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PackerBootstrap then
    require('packer').sync()
  end
end)


-- bindings are done in vimscript
vim.cmd([[
map <silent><C-o> :NvimTreeOpen<CR>
tmap <C-A-t> <C-\><C-n><C-A-t>
nmap <C-A-t> :ToggleTerm direction=horizontal<CR><Ins>
tmap <C-`> <C-\><C-n><C-`>
nmap <C-`> :ToggleTerm direction=horizontal<CR><Ins>

inoremap <silent><expr> <C-space> coc#refresh()
nmap <silent> <S-F12> <Plug>(coc-definition)
nnoremap <silent> <C-g> :LazyGit<CR>
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

]])
