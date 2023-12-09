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
  -- testing
  {
    dir = "/home/rek/Coding/nvim/markdown-preview-server.nvim",
    config = function()
      require("markdown-preview").setup { start_server = true, css = "/home/rek/.dotfiles/markdown/usercss.css", config =
      "/home/rek/.dotfiles/config/markdown-preview-server/config.toml" }
    end,
  },
  {
    dir = "/home/rek/Coding/nvim/nvim-emailclient",
    dev = true
  },

  -- dependencies
  'nvim-lua/plenary.nvim',
  { 'm00qek/baleia.nvim',                 tag = 'v1.3.0' },
  'nvim-tree/nvim-web-devicons',
  'rcarriga/nvim-notify',
  'lewis6991/gitsigns.nvim',

  -- color schemes
  {
    'dracula/vim',
    name = 'dracula',
    config = require('iwillreku3206.plugins.dracula').config,
    priority = 99
  },
  {
    'folke/tokyonight.nvim',
    --    config = require('iwillreku3206.plugins.tokyonight').config,
    priority = 99
  },
  'tomasiser/vim-code-dark',

  -- files
  {
    'nvim-tree/nvim-tree.lua',
    config = require('iwillreku3206.plugins.nvim_tree').config,
    dependencies = { "nvim-web-devicons" }
  },
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.4',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },

  -- ui
  {
    'nvim-lualine/lualine.nvim',
    config = require('iwillreku3206.plugins.lualine').config,
  },
  {
    "startup-nvim/startup.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    config = require('iwillreku3206.plugins.startup').config,
  },
  {
    'edluffy/hologram.nvim',
    config = require('iwillreku3206.plugins.hologram').config,
  },
  {
    'https://github.com/adelarsq/image_preview.nvim',
    config = function()
      require("image_preview").setup()
    end
  },
  { "lukas-reineke/indent-blankline.nvim" },
  'francoiscabrol/ranger.vim',
  {
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim',     -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    init = function() vim.g.barbar_auto_setup = false end,
    opts = {
      -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
      -- animation = true,
      -- insert_at_start = true,
      -- …etc.
    },
  },

  -- integration
  {
    'glacambre/firenvim',

    -- Lazy load firenvim
    -- Explanation: https://github.com/folke/lazy.nvim/discussions/463#discussioncomment-4819297
    cond = not not vim.g.started_by_firenvim,
    build = function()
      require("lazy").load({ plugins = "firenvim", wait = true })
      vim.fn["firenvim#install"](0)
    end
  },
  -- treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    config = require('iwillreku3206.plugins.treesitter').config,
    build = require('iwillreku3206.plugins.treesitter').build,
  },


  -- lsp

  'neovim/nvim-lspconfig',
  'p00f/clangd_extensions.nvim',
  'williamboman/nvim-lsp-installer',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'hrsh7th/nvim-cmp',
  {
    'L3MON4D3/LuaSnip',
    -- follow latest release.
    version = "1.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = "make install_jsregexp"
  },
  'saadparwaiz1/cmp_luasnip',
  {
    "kdheepak/cmp-latex-symbols",
    ft = { 'markdown' },
    lazy = true
  },
  "hrsh7th/cmp-emoji",
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-calc',
  'chrisgrieser/cmp-nerdfont',

  --"evesdropper/luasnip-latex-snippets.nvim",
  --{
  --  "iurimateus/luasnip-latex-snippets.nvim",
  -- replace "lervag/vimtex" with "nvim-treesitter/nvim-treesitter" if you're
  -- using treesitter.
  --  dependencies = { "L3MON4D3/LuaSnip", "lervag/vimtex" },
  -- treesitter is required for markdown
  --  ft = { "tex", "markdown" },
  --},

  -- language specific
  "lervag/vimtex",
  {
    'fatih/vim-go',
    build = require('iwillreku3206.plugins.vim-go').build,
    lazy = true,
    ft = "go"
  },
  {
    'neoclide/jsonc.vim',
    lazy = true,
    ft = { 'jsonc', "json" }
  },
  {
    'google/vim-jsonnet',
    lazy = true,
    ft = "jsonnet"
  },
  {
    'habamax/vim-godot',
    lazy = true,
    ft = "gdscript"
  },
  {
    'princejoogie/tailwind-highlight.nvim',
    dependencies = { "neovim/nvim-lspconfig", "nvim-lsp-installer" },
  },
  {
    'captbaritone/better-indent-support-for-php-with-html',
    lazy = true,
    ft = "php"
  },
  {
    'OmniSharp/omnisharp-vim',
    lazy = true,
    ft = { "cs", "cshtml" }
  },
  {
    'mfussenegger/nvim-jdtls',
    lazy = true,
    ft = 'java'
  },
  {
    'vim-pandoc/vim-pandoc',
    lazy = true,
    ft = { "pandoc", "markdown", "md" }
  },
  {
    'vim-pandoc/vim-pandoc-syntax',
    lazy = true,
    ft = { "pandoc", "markdown", "md" }
  },
  'MunifTanjim/prettier.nvim',
  {
    'MunifTanjim/eslint.nvim',
    dependencies = { 'jose-elias-alvarez/null-ls.nvim', 'MunifTanjim/eslint.nvim' },
    config = require('iwillreku3206.plugins.eslint').config,
  },
  'gpanders/editorconfig.nvim',
  {
    'wuelnerdotexe/vim-astro',
    ft = "astro",
    lazy = true
  },
  {
    "folke/neodev.nvim",
    lazy = true,
    ft = "lua",
    config = require('iwillreku3206.plugins.neodev').config,
  },

  -- games

  {
    'alec-gibson/nvim-tetris',
    cmd = "Tetris",
    lazy = true
  },
  {
    'seandewar/nvimesweeper',
    cmd = "Nvimesweeper",
    lazy = true
  },
  {
    'jim-fx/sudoku.nvim',
    config = require('iwillreku3206.plugins.sudoku').config,
    cmd = "Sudoku",
    lazy = true
  },

  -- tools
  {
    'kdheepak/lazygit.nvim',
    cmd = { "LazyGit", "LazyGitConfig", "LazyGitFilter", "LazyGitCurrentFile", "LazyGitFilterCurrentFile" },
    lazy = true
  },
  {
    "ziontee113/color-picker.nvim",
    config = require('iwillreku3206.plugins.color-picker').config,
    lazy = false
  },
  {
    "folke/trouble.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = require('iwillreku3206.plugins.trouble').config,
  },
  'stevearc/profile.nvim',
  'puremourning/vimspector',
  'wakatime/vim-wakatime',

  -- utils
  {
    "windwp/nvim-autopairs",
    config = require('iwillreku3206.plugins.nvim-autopairs').config,
  },
  {
    "kylechui/nvim-surround",
    config = require('iwillreku3206.plugins.nvim-surround').config,
  },
  {
    'norcalli/nvim-colorizer.lua',
    config = require('iwillreku3206.plugins.nvim-colorizer').config,
  },
  {
    'jose-elias-alvarez/null-ls.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = require('iwillreku3206.plugins.null-ls').config,
  },
  {
    'zbirenbaum/copilot.lua',
    lazy = true,
    event = "InsertEnter",
    cmd = "Copilot",
    config = function()
      require("copilot").setup {
        suggestion = { enabled = true, auto_trigger = true }
      }
    end
  },
  {
    "zbirenbaum/copilot-cmp",
    config = function()
      require("copilot_cmp").setup()
    end
  },
  {
    'andweeb/presence.nvim',
    priority = 25,
  },
  {
    'dstein64/vim-startuptime',
    lazy = true,
    cmd = "StartupTime",
  }
}
)
