return {
  {
    "iwillreku3206/markdown-preview-server.nvim",
    branch = "rewrite",
    dev = true,
    config = function()
      local binary = vim.fn.expand(
        "$HOME/Coding/rust/markdown-preview-server/target/debug/markdown-preview-server")
      local config = vim.fn.expand(
        "$HOME/Coding/rust/markdown-preview-server/test_cfg.toml")
      require("markdown-preview").setup({ binary = binary, config = config })
    end
  }
}
