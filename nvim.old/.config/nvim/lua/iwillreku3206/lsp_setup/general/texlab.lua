local function setup(lsp, capabilities, on_attach)
  lsp.texlab.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    filetypes = { "tex", "bib", "markdown" },
  })
end

return setup
