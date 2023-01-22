local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

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
require 'lspconfig'.jsonls.setup {
  capabilities = capabilities,
  on_attach = on_attach
}
require 'lspconfig'.dockerls.setup {
}


-- web
require 'lspconfig'.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact", "typescript.tsx" }
}
require 'lspconfig'.html.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}
require 'lspconfig'.cssls.setup {
  settings = {
    css = {
      lint = {
        unknownAtRules = 'ignore',
      },
    },
  },
  on_attach = on_attach,
  capabilities = capabilities,
}
require 'lspconfig'.cssmodules_ls.setup {
  on_attach = on_attach,
}

require 'lspconfig'.eslint.setup {
  on_attach = on_attach,
}
vim.cmd("autocmd BufWritePre *.tsx,*.ts,*.jsx,*.js EslintFixAll")
require 'lspconfig'.svelte.setup {
  on_attach = on_attach,
}
require 'lspconfig'.vuels.setup {
  on_attach = on_attach,
}
require 'lspconfig'.emmet_ls.setup {
  on_attach = on_attach,
}
require 'lspconfig'.phan.setup {
  on_attach = on_attach,
}
require 'lspconfig'.tailwindcss.setup {
  on_attach = on_attach,
}

require 'prettier'.setup({
  bin = 'prettier', -- or `'prettierd'` (v0.22+)
  on_attach = on_attach,
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

require 'lspconfig'.astro.setup {
  on_attach = on_attach,
  init_options = {
    typescript = {
      serverPath = h:read() .. '/typescript/lib/tsserverlibrary.js'
    }
  }
}

h = nil

require 'lspconfig'.graphql.setup {
  on_attach = on_attach,
}

require 'lspconfig'.sqlls.setup {
  on_attach = on_attach,
}


-- mobile
require 'lspconfig'.dartls.setup {
  on_attach = on_attach,
}


-- game dev
require 'lspconfig'.gdscript.setup {
  on_attach = on_attach,
}


-- c/cpp/rust
require 'lspconfig'.clangd.setup {
  on_attach = on_attach,
  cmd = {
    "/usr/bin/clangd",
    '--query-driver=/usr/bin/clang++'
  }
}
require 'lspconfig'.cmake.setup {
  on_attach = on_attach,
}

require 'lspconfig'.rust_analyzer.setup {}


-- java/cs
require 'lspconfig'.jdtls.setup {
  on_attach = on_attach,
}
require 'lspconfig'.omnisharp.setup {
  on_attach = on_attach,
  cmd = { "omnisharp" },

  -- Enables support for reading code style, naming convention and analyzer
  -- settings from .editorconfig.
  enable_editorconfig_support = true,

  -- If true, MSBuild project system will only load projects for files that
  -- were opened in the editor. This setting is useful for big C# codebases
  -- and allows for faster initialization of code navigation features only
  -- for projects that are relevant to code that is being edited. With this
  -- setting enabled OmniSharp may load fewer projects and may thus display
  -- incomplete reference lists for symbols.
  enable_ms_build_load_projects_on_demand = false,

  -- Enables support for roslyn analyzers, code fixes and rulesets.
  enable_roslyn_analyzers = true,

  -- Specifies whether 'using' directives should be grouped and sorted during
  -- document formatting.
  organize_imports_on_format = true,

  -- Enables support for showing unimported types and unimported extension
  -- methods in completion lists. When committed, the appropriate using
  -- directive will be added at the top of the current file. This option can
  -- have a negative impact on initial completion responsiveness,
  -- particularly for the first few completion sessions after opening a
  -- solution.
  enable_import_completion = true,

  -- Specifies whether to include preview versions of the .NET SDK when
  -- determining which version to use for project loading.
  sdk_include_prereleases = true,

  -- Only run analyzers against open files when 'enableRoslynAnalyzers' is
  -- true
  analyze_open_documents_only = false,
}

-- scripting
require 'lspconfig'.vimls.setup {
  on_attach = on_attach,
}
require 'lspconfig'.pyright.setup {
  on_attach = on_attach,
}
require 'lspconfig'.bashls.setup {
  on_attach = on_attach,
}
require 'lspconfig'.sumneko_lua.setup {
  on_attach = on_attach,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}


-- completion
-- luasnip setup
local luasnip = require 'luasnip'

-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer' }
  },
}
