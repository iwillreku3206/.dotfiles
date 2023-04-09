local function config()
  
      require('lualine').setup {
        options = {
          theme = 'powerline_dark'
        }
      }
end

return {
  config = config
}
