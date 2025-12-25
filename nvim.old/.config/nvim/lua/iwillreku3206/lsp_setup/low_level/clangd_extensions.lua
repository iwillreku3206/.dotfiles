local function setup(_, _, _)
  -- Setup the LSP here. The file name of the script should be the same name as the lSP.
  require("clangd_extensions").setup()
end

return setup
