return {
  {
    "iwillreku3206/markdown-preview-server.nvim",
    branch = "next",
    config = function()
      require("markdown-preview").setup {
        start_server = false,
      }
    end
  }
}
