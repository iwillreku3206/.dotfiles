local function setup(_lsp, capabilities, on_attach)
  vim.g.rustaceanvim = {
    -- LSP configuration
    server = {
      on_attach = on_attach,
      capabilities = capabilities,
    },
  }
end

return setup
