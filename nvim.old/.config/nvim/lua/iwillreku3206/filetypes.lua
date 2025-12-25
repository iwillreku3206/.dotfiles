vim.filetype.add {
  extension = {
    astro = "astro",
  },
}
vim.filetype.add({ extension = { templ = "templ" } })
vim.cmd [[
au BufReadPost,BufNewFile *.css set syntax=css
au BufReadPost,BufNewFile *.pandoc set syntax=pandoc
au BufReadPost,BufNewFile *.md set syntax=markdown
au BufReadPost,BufNewFile *.md set filetype=markdown
au BufReadPost,BufNewFile *.templ set filetype=templ
autocmd BufWritePre *.tsx,*.ts,*.jsx,*.js EslintFixAll
]]
