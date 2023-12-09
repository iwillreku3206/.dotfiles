local function config()
  require 'nvim-treesitter.configs'.setup {
    ensure_installed = {
      "astro",
      "bash",
      "c",
      "c_sharp",
      "cmake",
      "cpp",
      "css",
      "dart",
      "diff",
      "dockerfile",
      "fish",
      "gdscript",
      "git_rebase",
      "gitattributes",
      "gitignore",
      "go",
      "godot_resource",
      "graphql",
      "html",
      "http",
      "http",
      "javascript",
      "jsdoc",
      "json",
      "json5",
      "jsonc",
      "jsonnet",
      "kotlin",
      "latex",
      "llvm",
      "lua",
      "make",
      "markdown",
      "markdown_inline",
      "php",
      "python",
      "regex",
      "rust",
      "scss",
      "sql",
      "svelte",
      "tsx",
      "typescript",
      "vim",
      "vue",
      "yaml"
    },
    auto_install = true,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
  }
end

local function build()
--   vim.cmd('TsUpdate')
end

return {
  config = config,
  build = build
}
