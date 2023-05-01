vim.keymap.set('n', 'gg', ':LazyGit<CR>', { silent = true, noremap = true })
vim.keymap.set('n', 'tr', ':NvimTreeOpen<CR>', { silent = true, noremap = true })
vim.g.mapleader = ' '

local telescope_builtin = require('telescope.builtin')

vim.keymap.set('n', 'ff', telescope_builtin.find_files, {})
vim.keymap.set('n', 'fg', telescope_builtin.live_grep, {})
vim.keymap.set('n', 'fm', telescope_builtin.man_pages, {})
vim.keymap.set('n', 'fq', telescope_builtin.quickfix, {})
vim.keymap.set('n', 'fp', telescope_builtin.diagnostics, {})
vim.keymap.set('n', '<C-p>', telescope_builtin.commands, {})

vim.keymap.set('n', '<M-n>', ':tabe<CR>', { silent = true, noremap = true })
vim.keymap.set('n', '<M-1>', ':tabn 1<CR>', { silent = true, noremap = true })
vim.keymap.set('n', '<M-2>', ':tabn 2<CR>', { silent = true, noremap = true })
vim.keymap.set('n', '<M-3>', ':tabn 3<CR>', { silent = true, noremap = true })
vim.keymap.set('n', '<M-4>', ':tabn 4<CR>', { silent = true, noremap = true })
vim.keymap.set('n', '<M-5>', ':tabn 5<CR>', { silent = true, noremap = true })
vim.keymap.set('n', '<M-6>', ':tabn 6<CR>', { silent = true, noremap = true })
vim.keymap.set('n', '<M-7>', ':tabn 7<CR>', { silent = true, noremap = true })
vim.keymap.set('n', '<M-8>', ':tabn 8<CR>', { silent = true, noremap = true })
vim.keymap.set('n', '<M-9>', ':tabn 9<CR>', { silent = true, noremap = true })

vim.keymap.set('n', 'ms', ':MarkdownPreview<CR>', { silent = true, noremap = true })
vim.keymap.set('n', 'me', ':MarkdownPreviewStop<CR>', { silent = true, noremap = true })
