local function setup(lsp, capabilities, on_attach)
  lsp.asm_lsp.setup {
    capabilities = capabilities,
    on_attach = on_attach,
  }
end

return setup
