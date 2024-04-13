local function setup(lsp, capabilities, on_attach)
  -- Setup the LSP here. The file name of the script should be the same name as the lSP.
  lsp.emmet_ls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    ft = { 'astro',
      'css',
      'eruby',
      'html',
      'htmldjango',
      'javascriptreact',
      'less',
      'pug',
      'sass',
      'scss',
      'svelte',
      'templ',
      'typescriptreact',
      'vue' }
  })
end

return setup
