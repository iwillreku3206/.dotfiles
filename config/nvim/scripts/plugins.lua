vim.g.CFG_FOLDER = vim.env["HOME"] .. "/.dotfiles/config/nvim"
CFG_FOLDER = vim.g.CFG_FOLDER

local fn = vim.fn

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- dependencies
  'nvim-lua/plenary.nvim',
  { 'm00qek/baleia.nvim', tag = 'v1.2.0' },
  'kyazdani42/nvim-web-devicons',

  -- color scheme
  {
    'dracula/vim',
    name = 'dracula',
    config = function() vim.cmd('colorscheme dracula') end
  },

  -- files
  {
    'kyazdani42/nvim-tree.lua',
    config = function()
      require('nvim-tree').setup {
        git = { ignore = false },
        remove_keymaps = { "f" }
      }
    end,
    requires = { "nvim-web-devicons" }
  },
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.0',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },

  -- ui
  {
    'nvim-lualine/lualine.nvim',
    config = function()
      require('lualine').setup {
        options = {
          theme = 'powerline_dark'
        }
      }
    end
  },
  {
    'edluffy/hologram.nvim',
    config = function()
      require('hologram').setup { auto_display = true }
    end
  },

  -- treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      dofile(CFG_FOLDER .. "/scripts/plugins/treesitter.lua")
    end,
    run = function() vim.cmd(':TSUpdate') end
  },


  -- lsp

  'neovim/nvim-lspconfig',
  'p00f/clangd_extensions.nvim',
  { 'fatih/vim-go',       run = ":GoInstallBinaries" },
  'williamboman/nvim-lsp-installer',
  { 'ms-jpq/coq_nvim',       branch = "coq" },

  { "ms-jpq/coq.artifacts",  branch = 'artifacts' },
  { "ms-jpq/coq.thirdparty", branch = '3p' },

  -- language specific
  'neoclide/jsonc.vim',
  'google/vim-jsonnet',
  'habamax/vim-godot',
  {
    'princejoogie/tailwind-highlight.nvim',
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
  },
  'captbaritone/better-indent-support-for-php-with-html',
  'OmniSharp/omnisharp-vim',
  'mfussenegger/nvim-jdtls',
  'vim-pandoc/vim-pandoc',
  'vim-pandoc/vim-pandoc-syntax',
  {
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
    ft = { "markdown" },
  },
  'MunifTanjim/prettier.nvim',
  {
    'MunifTanjim/eslint.nvim',
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
  },
  'gpanders/editorconfig.nvim',
  'wuelnerdotexe/vim-astro',

  -- tools/games


  'alec-gibson/nvim-tetris',
  'seandewar/nvimesweeper',
  'kdheepak/lazygit.nvim',
  {
    "ziontee113/color-picker.nvim",
    config = function()
      require("color-picker")
    end,
  },
  {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {}
    end
  },
  'stevearc/profile.nvim',

  -- utils
  {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  },
  {
    "kylechui/nvim-surround",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  },
  {
    'norcalli/nvim-colorizer.lua',
    config = function() require 'colorizer'.setup() end
  },
  {
    'jose-elias-alvarez/null-ls.nvim',
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
  },
  "github/copilot.vim",
  'andweeb/presence.nvim'
})
