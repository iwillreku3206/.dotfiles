local function setup(lsp, capabilities, on_attach)
  -- Setup the LSP here. The file name of the script should be the same name as the lSP.
  local tw_highlight = require('tailwind-highlight')

  lsp.tailwindcss.setup({
    capabilities = capabilities,
    on_attach = function (client, bufnr)
      on_attach(client, bufnr)
          tw_highlight.setup(client, bufnr, {
            single_column = false,
            mode = 'background',
            debounce = 200,
          })

    end,
  })
end

return setup
