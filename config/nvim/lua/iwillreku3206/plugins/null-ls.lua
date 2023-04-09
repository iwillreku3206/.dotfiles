local function config()
  require 'null-ls'.setup({
    on_attach = function(client, bufnr)
      if client.server_capabilities.documentFormattingProvider then
        -- format on save
        vim.cmd("autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()")
      end
    end,
  })
end

return {
  config = config,
}
