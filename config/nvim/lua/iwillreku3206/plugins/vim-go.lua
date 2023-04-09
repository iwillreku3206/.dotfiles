local function build()
  vim.cmd('GoInstallBinaries')
end

return {
  build = build
}
