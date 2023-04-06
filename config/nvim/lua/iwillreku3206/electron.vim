function OpenInElectron(url)
  lua vim.fn.jobstart('electron ' .. vim.api.nvim_eval('a:url'))
endfunction
