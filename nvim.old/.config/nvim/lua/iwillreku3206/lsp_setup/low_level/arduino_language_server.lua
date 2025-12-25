local function setup(lsp, capabilities, on_attach)
  -- Setup the LSP here. The file name of the script should be the same name as the lSP.
  local h = io.popen('/bin/bash -c "which clangd"', "r")

 lsp.arduino_language_server.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    cmd = { 'arduino-language-server', '-cli', '/usr/local/bin/arduino-cli', '--cli-config',
      '/Users/rek/Library/Arduino15/arduino-cli.yaml', '-clangd', h:read() }
  }
  )

  h = nil
end

return setup
