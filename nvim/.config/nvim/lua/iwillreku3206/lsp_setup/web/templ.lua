local function setup(lsp, capabilities, on_attach)
  lsp.templ.setup {
    capabilities = capabilities,
    on_attach = on_attach,
  }
end

return setup
