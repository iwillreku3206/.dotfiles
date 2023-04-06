local function setup(lsp, capabilities, on_attach)
  -- Setup the LSP here. The file name of the script should be the same name as the lSP.
  lsp.omnisharp.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = { "omnisharp" },
    enable_editorconfig_support = true,
    enable_ms_build_load_projects_on_demand = false,
    enable_roslyn_analyzers = true,
    organize_imports_on_format = true,
    enable_import_completion = true,
    sdk_include_prereleases = false,
    analyze_open_documents_only = false,
  })
  vim.cmd [[
    function! s:CBCodeFormat() abort
      noautocmd write
      set nomodified
    endfunction
    autocmd BufWritePre *.cs call OmniSharp#actions#format#Format(function('s:CBCodeFormat'))
  ]]
end

return setup
