vim.filetype.add {
  extension = {
    astro = "astro",
  },
}

vim.cmd [[
au BufReadPost,BufNewFile *.css set syntax=css
au BufReadPost,BufNewFile *.pandoc set syntax=pandoc
au BufReadPost,BufNewFile *.md set syntax=markdown
autocmd BufWritePre *.tsx,*.ts,*.jsx,*.js EslintFixAll
]]
