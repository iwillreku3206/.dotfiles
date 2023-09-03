
local function setup(lsp, capabilities, on_attach)
  -- Setup the LSP here. The file name of the script should be the same name as the lSP.
lsp.sqlls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = lsp.util.root_pattern('.git', vim.fn.getcwd()),
})
end

return setup
