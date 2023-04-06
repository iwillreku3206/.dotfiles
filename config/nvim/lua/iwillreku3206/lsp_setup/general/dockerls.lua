local function setup(lsp, capabilities, on_attach)
  lsp.dockerls.setup({
  capabilities = capabilities,
  on_attach = on_attach
})
end

return setup
