local function setup(_, capabilities, on_attach)
  -- Setup the LSP here. The file name of the script should be the same name as the lSP.
  require 'prettier'.setup({
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
end

return setup
