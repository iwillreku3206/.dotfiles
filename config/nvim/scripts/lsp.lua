local lsp = require 'lspconfig'
local capabilities = require('cmp_nvim_lsp').default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local on_attach = function(_, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'H', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
end

-- general
lsp.jsonls.setup({
  capabilities = capabilities,
  on_attach = on_attach
})

lsp.dockerls.setup({
  capabilities = capabilities,
  on_attach = on_attach
})


-- web
lsp.tsserver.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact", "typescript.tsx" }
})
lsp.html.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})
lsp.cssls.setup({
  settings = {
    css = {
      lint = {
        unknownAtRules = 'ignore',
      },
    },
  },
  on_attach = on_attach,
  capabilities = capabilities,
})
lsp.cssmodules_ls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

lsp.eslint.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})
lsp.svelte.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})
lsp.vuels.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})
lsp.emmet_ls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})
lsp.phan.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})
lsp.tailwindcss.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

require 'prettier'.setup({
  bin = 'prettier',
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {
    "css",
    "graphql",
    "html",
    "javascript",
    "javascriptreact",
    "json",
    "less",
    "markdown",
    "scss",
    "typescript",
    "typescriptreact",
    "yaml",
    "astro",
    "svelte"
  },
})

-- write a function to find the path of tsserver
local h = io.popen('/bin/bash -c "npm root -g"', "r")

lsp.astro.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  init_options = {
    typescript = {
      serverPath = h:read() .. '/typescript/lib/tsserverlibrary.js'
    }
  }
})

h = nil

lsp.graphql.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

lsp.sqlls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})


-- mobile
lsp.dartls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})


-- game dev
lsp.gdscript.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})


-- c/cpp/rust
require("clangd_extensions").setup()
lsp.cmake.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

lsp.rust_analyzer.setup(({
  capabilities = capabilities,
  on_attach = on_attach
}))

local h = io.popen('/bin/bash -c "which clangd"', "r")

lsp.arduino_language_server.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  cmd = { 'arduino-language-server', '-cli', '/usr/local/bin/arduino-cli', '--cli-config',
    '/Users/rek/Library/Arduino15/arduino-cli.yaml', '-clangd', h:read() }
}
)

h = nil

-- java/cs/go
lsp.jdtls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})
lsp.omnisharp.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "omnisharp" },
  enable_editorconfig_support = true,
  enable_ms_build_load_projects_on_demand = false,
  enable_roslyn_analyzers = true,
  organize_imports_on_format = true,
  enable_import_completion = true,
  sdk_include_prereleases = false,
  analyze_open_documents_only = false,
})
-- CS presave hook (credit to doopNudles on SOF)
vim.cmd([[
function! s:CBCodeFormat() abort
  noautocmd write
  set nomodified
endfunction
autocmd BufWritePre *.cs call OmniSharp#actions#format#Format(function('s:CBCodeFormat'))

]])

require 'lspconfig'.gopls.setup({
  capabilities = capabilities,
  on_attach = on_attach
})


-- scripting
lsp.vimls.setup({
  on_attach = on_attach,
})
lsp.pyright.setup({
  on_attach = on_attach,
})
lsp.bashls.setup({
  on_attach = on_attach,
})
lsp.lua_ls.setup({
  on_attach = on_attach,
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        library = { vim.api.nvim_get_runtime_file("", true), "/home/rek/CC-Tweaked-EmmyLua" },
      },
      telemetry = {
        enable = false,
      },
    },
  },
})


-- Set up nvim-cmp.
local cmp = require 'cmp'

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    -- { name = 'vsnip' }, -- For vsnip users.
    { name = 'luasnip' }, -- For luasnip users.
    -- { name = 'ultisnips' }, -- For ultisnips users.
    -- { name = 'snippy' }, -- For snippy users.
  }, {
    { name = 'buffer' },
  })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})
