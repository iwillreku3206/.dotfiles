return {
  {
    'neovim/nvim-lspconfig',
    config = function()
      local lsp = require 'lspconfig'
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      capabilities.textDocument.completion.completionItem.snippetSupport = true
      capabilities.workspace = { didChangeWatchedFiles = { dynamicRegistration = true } }

      local on_attach = function(_, bufnr)
        -- Enable completion triggered by <c-x><c-o>
        vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

        -- Mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local bufopts = { noremap = true, silent = true, buffer = bufnr }
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
        vim.keymap.set('n', 'H', vim.lsp.buf.hover, bufopts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
        vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help, bufopts)
        vim.keymap.set('n', 'gD', vim.lsp.buf.type_definition, bufopts)
        vim.keymap.set('n', 'gR', vim.lsp.buf.rename, bufopts)
        vim.keymap.set('n', 'gC', vim.lsp.buf.code_action, bufopts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
      end
      -- general
      require('iwillreku3206.lsp_setup.general.dockerls')(lsp, capabilities, on_attach)
      require('iwillreku3206.lsp_setup.general.jsonls')(lsp, capabilities, on_attach)
      require('iwillreku3206.lsp_setup.general.ltex')(lsp, capabilities, on_attach)
      require('iwillreku3206.lsp_setup.general.texlab')(lsp, capabilities, on_attach)

      -- web
      require('iwillreku3206.lsp_setup.web.astro')(lsp, capabilities, on_attach)
      require('iwillreku3206.lsp_setup.web.cssls')(lsp, capabilities, on_attach)
      require('iwillreku3206.lsp_setup.web.cssmodules_ls')(lsp, capabilities, on_attach)
      require('iwillreku3206.lsp_setup.web.emmet_ls')(lsp, capabilities, on_attach)
      require('iwillreku3206.lsp_setup.web.eslint')(lsp, capabilities, on_attach)
      require('iwillreku3206.lsp_setup.web.graphql')(lsp, capabilities, on_attach)
      require('iwillreku3206.lsp_setup.web.html')(lsp, capabilities, on_attach)
      require('iwillreku3206.lsp_setup.web.phan')(lsp, capabilities, on_attach)
      require('iwillreku3206.lsp_setup.web.prettier')(lsp, capabilities, on_attach)
      require('iwillreku3206.lsp_setup.web.prismals')(lsp, capabilities, on_attach)
      require('iwillreku3206.lsp_setup.web.sqlls')(lsp, capabilities, on_attach)
      require('iwillreku3206.lsp_setup.web.svelte')(lsp, capabilities, on_attach)
      require('iwillreku3206.lsp_setup.web.tailwindcss')(lsp, capabilities, on_attach)
      require('iwillreku3206.lsp_setup.web.tsserver')(lsp, capabilities, on_attach)
      require('iwillreku3206.lsp_setup.web.vuels')(lsp, capabilities, on_attach)

      -- mobile
      require('iwillreku3206.lsp_setup.mobile.dartls')(lsp, capabilities, on_attach)

      -- game dev
      require('iwillreku3206.lsp_setup.game_dev.gdscript')(lsp, capabilities, on_attach)

      -- low level
      require('iwillreku3206.lsp_setup.low_level.arduino_language_server')(lsp, capabilities, on_attach)
      require('iwillreku3206.lsp_setup.low_level.clangd')(lsp, capabilities, on_attach)
      require('iwillreku3206.lsp_setup.low_level.cmake')(lsp, capabilities, on_attach)
      require('iwillreku3206.lsp_setup.low_level.gopls')(lsp, capabilities, on_attach)
      require('iwillreku3206.lsp_setup.low_level.asm-lsp')(lsp, capabilities, on_attach)

      -- runtimes
      require('iwillreku3206.lsp_setup.runtimes.jdtls')(lsp, capabilities, on_attach)
      require('iwillreku3206.lsp_setup.runtimes.omnisharp')(lsp, capabilities, on_attach)

      -- scripting
      require('iwillreku3206.lsp_setup.scripting.bashls')(lsp, capabilities, on_attach)
      require('iwillreku3206.lsp_setup.scripting.lua_ls')(lsp, capabilities, on_attach)
      require('iwillreku3206.lsp_setup.scripting.pyright')(lsp, capabilities, on_attach)
      require('iwillreku3206.lsp_setup.scripting.vimls')(lsp, capabilities, on_attach)
    end
  },
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'hrsh7th/nvim-cmp',
  {
    'L3MON4D3/LuaSnip',
    version = "2.*",
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
}
