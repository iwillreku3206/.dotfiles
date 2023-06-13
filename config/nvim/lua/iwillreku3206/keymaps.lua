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

vim.keymap.set('n', 'ms', ':MdPreview<CR>', { silent = true, noremap = true })
vim.keymap.set('n', 'me', ':MdPreviewStop<CR>', { silent = true, noremap = true })

vim.keymap.set('t', '<M-a>c', '<C-\\><C-n>:tabe<CR>', { silent = true, noremap = true })
vim.keymap.set('t', '<M-a>1', '<C-\\><C-n>:tabn 1<CR>', { silent = true, noremap = true })
vim.keymap.set('t', '<M-a>2', '<C-\\><C-n>:tabn 2<CR>', { silent = true, noremap = true })
vim.keymap.set('t', '<M-a>3', '<C-\\><C-n>:tabn 3<CR>', { silent = true, noremap = true })
vim.keymap.set('t', '<M-a>4', '<C-\\><C-n>:tabn 4<CR>', { silent = true, noremap = true })
vim.keymap.set('t', '<M-a>5', '<C-\\><C-n>:tabn 5<CR>', { silent = true, noremap = true })
vim.keymap.set('t', '<M-a>6', '<C-\\><C-n>:tabn 6<CR>', { silent = true, noremap = true })
vim.keymap.set('t', '<M-a>7', '<C-\\><C-n>:tabn 7<CR>', { silent = true, noremap = true })
vim.keymap.set('t', '<M-a>8', '<C-\\><C-n>:tabn 8<CR>', { silent = true, noremap = true })
vim.keymap.set('t', '<M-a>9', '<C-\\><C-n>:tabn 9<CR>', { silent = true, noremap = true })

vim.keymap.set('n', '<M-a>c', '<C-\\><C-n>:tabe<CR>', { silent = true, noremap = true })
vim.keymap.set('n', '<M-a>1', '<C-\\><C-n>:tabn 1<CR>', { silent = true, noremap = true })
vim.keymap.set('n', '<M-a>2', '<C-\\><C-n>:tabn 2<CR>', { silent = true, noremap = true })
vim.keymap.set('n', '<M-a>3', '<C-\\><C-n>:tabn 3<CR>', { silent = true, noremap = true })
vim.keymap.set('n', '<M-a>4', '<C-\\><C-n>:tabn 4<CR>', { silent = true, noremap = true })
vim.keymap.set('n', '<M-a>5', '<C-\\><C-n>:tabn 5<CR>', { silent = true, noremap = true })
vim.keymap.set('n', '<M-a>6', '<C-\\><C-n>:tabn 6<CR>', { silent = true, noremap = true })
vim.keymap.set('n', '<M-a>7', '<C-\\><C-n>:tabn 7<CR>', { silent = true, noremap = true })
vim.keymap.set('n', '<M-a>8', '<C-\\><C-n>:tabn 8<CR>', { silent = true, noremap = true })
vim.keymap.set('n', '<M-a>9', '<C-\\><C-n>:tabn 9<CR>', { silent = true, noremap = true })

vim.keymap.set('t', '<C-w>', '<C-\\><C-n><C-w>', { silent = true, noremap = true })
