local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PackerBootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
  vim.cmd [[packadd packer.nvim]]
end

require('packer').startup(function(use)
  -- dependencies
  use 'nvim-lua/plenary.nvim'
  use { 'm00qek/baleia.nvim', tag = 'v1.2.0' }

  use { 'dracula/vim',
    as = 'dracula',
    config = function() vim.cmd('colorscheme dracula') end
  }
  use 'kyazdani42/nvim-web-devicons'
  use { 'kyazdani42/nvim-tree.lua',
    config = function()
      require('nvim-tree').setup {
        git = { ignore = false },
        remove_keymaps = { "f" }
      }
    end,
    requires = "nvim-web-devicons"
  }

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }
  use { 'akinsho/toggleterm.nvim',
    tag = 'v2.*',
    config = function() require('toggleterm').setup() end
  }
  use { 'nvim-lualine/lualine.nvim',
    config = function()
      require('lualine').setup {
        options = {
          theme = 'powerline_dark'
        }
      }
    end
  }
  use 'gpanders/editorconfig.nvim'
  use { 'nvim-treesitter/nvim-treesitter',
    config = function()
      require 'nvim-treesitter.configs'.setup {
        ensure_installed = {
          "astro",
          "bash",
          "c",
          "c_sharp",
          "cmake",
          "cpp",
          "css",
          "dart",
          "diff",
          "dockerfile",
          "fish",
          "gdscript",
          "git_rebase",
          "gitattributes",
          "gitignore",
          "go",
          "godot_resource",
          "graphql",
          "help",
          "html",
          "http",
          "http",
          "javascript",
          "jsdoc",
          "json",
          "json5",
          "jsonc",
          "jsonnet",
          "kotlin",
          "latex",
          "llvm",
          "lua",
          "make",
          "markdown",
          "markdown_inline",
          "php",
          "python",
          "regex",
          "rust",
          "scss",
          "sql",
          "svelte",
          "tsx",
          "typescript",
          "vim",
          "vue",
          "yaml"
        },
        auto_install = true,
        highlight = {
          enable = true,
          -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
          -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
          -- Using this option may slow down your editor, and you may see some duplicate highlights.
          -- Instead of true it can also be a list of languages
          additional_vim_regex_highlighting = false,
        },
      }
    end,
    run = function() vim.cmd(':TSUpdate') end
  }
  use { 'edluffy/hologram.nvim',
    config = function()
      require('hologram').setup { auto_display = true }
    end
  }
  use {
    'samodostal/image.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'm00qek/baleia.nvim'
    },
    config = function()
      require('image').setup {
        render = {
          min_padding = 5,
          show_label = true,
          use_dither = false,
          foreground_color = true,
          background_color = true
        },
        events = {
          update_on_nvim_resize = true,
        },
      }
    end
  }


  use 'alec-gibson/nvim-tetris'
  use 'seandewar/nvimesweeper'


  use 'neovim/nvim-lspconfig'
  use 'p00f/clangd_extensions.nvim'
  use 'williamboman/nvim-lsp-installer'
  use {
    'hrsh7th/nvim-cmp',
    config = function()
      require 'cmp'.setup {
        sources = {
          { name = 'nvim_lsp_signature_help' }
        }
      }
    end
  }
  use 'hrsh7th/cmp-nvim-lsp'
  use 'saadparwaiz1/cmp_luasnip'
  use 'L3MON4D3/LuaSnip'

  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }

  use {
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  }

  use 'vim-pandoc/vim-pandoc'
  use 'vim-pandoc/vim-pandoc-syntax'

  use 'instant-markdown/vim-instant-markdown'

  use({
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
    ft = { "markdown" },
  })

  use 'neoclide/jsonc.vim'
  use 'google/vim-jsonnet'
  use 'kdheepak/lazygit.nvim'
  use 'habamax/vim-godot'
  use { 'princejoogie/tailwind-highlight.nvim',
    requires = { "neovim/nvim-lspconfig", "nvim-lsp-installer" },
    config = function()
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
  use { 'norcalli/nvim-colorizer.lua',
    config = function() require 'colorizer'.setup() end
  }
  use 'captbaritone/better-indent-support-for-php-with-html'
  use 'OmniSharp/omnisharp-vim'
  use 'mfussenegger/nvim-jdtls'
  use { 'jose-elias-alvarez/null-ls.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require 'null-ls'.setup({
        on_attach = function(client, bufnr)
          if client.server_capabilities.documentFormattingProvider then
            -- format on save
            vim.cmd("autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()")
          end
        end,
      })
    end
  }
  use 'MunifTanjim/prettier.nvim'
  use { 'MunifTanjim/eslint.nvim',
    requires = { 'jose-elias-alvarez/null-ls.nvim', 'MunifTanjim/eslint.nvim' },
    config = function()
      require('eslint').setup({
        bin = 'eslint', -- or `eslint_d`
        code_actions = {
          enable = true,
          apply_on_save = {
            enable = true,
            types = { "directive", "problem", "suggestion", "layout" },
          },
          disable_rule_comment = {
            enable = true,
            location = "separate_line", -- or `same_line`
          },
        },
        diagnostics = {
          enable = true,
          report_unused_disable_directives = false,
          run_on = "type", -- or `save`
        },
      })
    end
  }

  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }

  use "github/copilot.vim"
  use 'andweeb/presence.nvim'
  use 'wuelnerdotexe/vim-astro'
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PackerBootstrap then
    require('packer').sync()
  end
end)
