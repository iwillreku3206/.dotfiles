local lsp = require 'lspconfig'
local coq = require 'coq'

local capabilities = vim.lsp.protocol.make_client_capabilities()
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
lsp.jsonls.setup(coq.lsp_ensure_capabilities {
  capabilities = capabilities,
  on_attach = on_attach
})

lsp.dockerls.setup(coq.lsp_ensure_capabilities {
  capabilities = capabilities,
  on_attach = on_attach
})


-- web
lsp.tsserver.setup(coq.lsp_ensure_capabilities {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact", "typescript.tsx" }
})
lsp.html.setup(coq.lsp_ensure_capabilities {
  on_attach = on_attach,
  capabilities = capabilities,
})
lsp.cssls.setup(coq.lsp_ensure_capabilities {
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
lsp.cssmodules_ls.setup(coq.lsp_ensure_capabilities {
  on_attach = on_attach,
  capabilities = capabilities,
})

lsp.eslint.setup(coq.lsp_ensure_capabilities {
  on_attach = on_attach,
  capabilities = capabilities,
})
lsp.svelte.setup(coq.lsp_ensure_capabilities {
  on_attach = on_attach,
  capabilities = capabilities,
})
lsp.vuels.setup(coq.lsp_ensure_capabilities {
  on_attach = on_attach,
  capabilities = capabilities,
})
lsp.emmet_ls.setup(coq.lsp_ensure_capabilities {
  on_attach = on_attach,
  capabilities = capabilities,
})
lsp.phan.setup(coq.lsp_ensure_capabilities {
  on_attach = on_attach,
  capabilities = capabilities,
})
lsp.tailwindcss.setup(coq.lsp_ensure_capabilities {
  on_attach = on_attach,
  capabilities = capabilities,
})

require 'prettier'.setup(coq.lsp_ensure_capabilities {
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

lsp.astro.setup(coq.lsp_ensure_capabilities {
  on_attach = on_attach,
  capabilities = capabilities,
  init_options = {
    typescript = {
      serverPath = h:read() .. '/typescript/lib/tsserverlibrary.js'
    }
  }
})

h = nil

lsp.graphql.setup(coq.lsp_ensure_capabilities {
  on_attach = on_attach,
  capabilities = capabilities,
})

lsp.sqlls.setup(coq.lsp_ensure_capabilities {
  on_attach = on_attach,
  capabilities = capabilities,
})


-- mobile
lsp.dartls.setup(coq.lsp_ensure_capabilities {
  on_attach = on_attach,
  capabilities = capabilities,
})


-- game dev
lsp.gdscript.setup(coq.lsp_ensure_capabilities {
  on_attach = on_attach,
  capabilities = capabilities,
})


-- c/cpp/rust
require("clangd_extensions").setup(coq.lsp_ensure_capabilities())
lsp.cmake.setup(coq.lsp_ensure_capabilities {
  on_attach = on_attach,
  capabilities = capabilities,
})

lsp.rust_analyzer.setup(coq.lsp_ensure_capabilities({
  capabilities = capabilities,
  on_attach = on_attach
}))

local h = io.popen('/bin/bash -c "which clangd"', "r")

lsp.arduino_language_server.setup(coq.lsp_ensure_capabilities {
  capabilities = capabilities,
  on_attach = on_attach,
  cmd = { 'arduino-language-server', '-cli', '/usr/local/bin/arduino-cli', '--cli-config',
    '/Users/rek/Library/Arduino15/arduino-cli.yaml', '-clangd', h:read() }
}
)

h = nil

-- java/cs/go
lsp.jdtls.setup(coq.lsp_ensure_capabilities {
  on_attach = on_attach,
  capabilities = capabilities,
})
lsp.omnisharp.setup(coq.lsp_ensure_capabilities {
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

require 'lspconfig'.gopls.setup(coq.lsp_ensure_capabilities {
  capabilities = capabilities,
  on_attach = on_attach
})


-- scripting
lsp.vimls.setup(coq.lsp_ensure_capabilities {
  on_attach = on_attach,
})
lsp.pyright.setup(coq.lsp_ensure_capabilities {
  on_attach = on_attach,
})
lsp.bashls.setup(coq.lsp_ensure_capabilities {
  on_attach = on_attach,
})
lsp.lua_ls.setup(coq.lsp_ensure_capabilities {
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


-- completion
require("coq_3p") {
  { src = "nvimlua", short_name = "nLUA", conf_only = true },
  { src = "bc",      short_name = "MATH", precision = 6 },
}

vim.cmd("COQnow -s")
