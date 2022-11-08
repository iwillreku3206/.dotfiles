local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PackerBootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
end

require('packer').startup(function(use)
  use {'dracula/vim',
    as = 'dracula',
    config = function () vim.cmd('colorscheme dracula') end
  }
  use 'kyazdani42/nvim-web-devicons'
  use {'kyazdani42/nvim-tree.lua',
    config = function () require('nvim-tree').setup{ git = { ignore = false } } end,
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
  use 'habamax/vim-godot'
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
  use 'captbaritone/better-indent-support-for-php-with-html'
  use 'gpanders/editorconfig.nvim'
  use 'OmniSharp/omnisharp-vim'
end)


