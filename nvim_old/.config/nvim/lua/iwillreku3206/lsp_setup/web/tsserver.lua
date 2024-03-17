local function setup(lsp, capabilities, on_attach)
  lsp.tsserver.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact", "typescript.tsx" }
  })
end

return setup
