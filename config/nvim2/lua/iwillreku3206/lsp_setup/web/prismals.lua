local function setup(lsp, capabilities, on_attach)
  lsp.prismals.setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

return setup
