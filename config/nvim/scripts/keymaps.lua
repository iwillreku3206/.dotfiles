vim.keymap.set('n', '<C-g>', ':LazyGit<CR>', { silent = true, noremap = true })
vim.keymap.set('n', '<C-o>', ':NvimTreeOpen<CR>', { silent = true, noremap = true })

local telescope_builtin = require('telescope.builtin')
vim.keymap.set('n', 'ff', telescope_builtin.find_files, {})
vim.keymap.set('n', 'fg', telescope_builtin.live_grep, {})
vim.keymap.set('n', 'fm', telescope_builtin.man_pages, {})
vim.keymap.set('n', 'fq', telescope_builtin.quickfix, {})
vim.keymap.set('n', 'fp', telescope_builtin.diagnostics, {})

