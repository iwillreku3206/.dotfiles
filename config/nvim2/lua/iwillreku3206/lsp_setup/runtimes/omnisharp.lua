local function setup(lsp, capabilities, on_attach)
  local pid = vim.fn.getpid()
  local omnisharp_bin = "/home/rek/.cache/omnisharp-vim/omnisharp-roslyn/run"

  -- Setup the LSP here. The file name of the script should be the same name as the lSP.
  lsp.omnisharp.setup({
    on_attach = function(client, bufnr)
      local tokenModifiers = client.server_capabilities.semanticTokensProvider.legend.tokenModifiers
      for i, v in ipairs(tokenModifiers) do
        local tmp = string.gsub(v, ' ', '_')
        tokenModifiers[i] = string.gsub(tmp, '-_', '')
      end
      local tokenTypes = client.server_capabilities.semanticTokensProvider.legend.tokenTypes
      for i, v in ipairs(tokenTypes) do
        local tmp = string.gsub(v, ' ', '_')
        tokenTypes[i] = string.gsub(tmp, '-_', '')
      end
      on_attach(client, bufnr)
    end,
    capabilities = capabilities,
    cmd = { "omnisharp", "-lsp", "--hostPID", tostring(pid) },
    root_dir = lsp.util.root_pattern("*.csproj", "*.sln"),
    enable_editorconfig_support = true,
    enable_ms_build_load_projects_on_demand = false,
    enable_roslyn_analyzers = true,
    organize_imports_on_format = true,
    enable_import_completion = true,
    sdk_include_prereleases = false,
    analyze_open_documents_only = false,
  })
  --vim.cmd [[
  --  function! s:CBCodeFormat() abort
  --    noautocmd write
  --    set nomodified
  --  endfunction
  --  autocmd BufWritePre *.cs call OmniSharp#actions#format#Format(function('s:CBCodeFormat'))
  --]]
end

return setup
