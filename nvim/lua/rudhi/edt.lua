local api = vim.api
local set = vim.opt

set.nu = true
set.tabstop = 4
set.softtabstop = 4
set.expandtab = true
set.shiftwidth = 4
set.smartindent = true
set.wrap = false
set.swapfile = false
set.backup = false
set.hidden = false
set.laststatus = 2
set.smartcase = true
set.scrolloff = 8
set.hidden = true
set.encoding = 'UTF-8'


--move tabs
vim.api.nvim_set_keymap('n', '<C-F1>', ':lua vim.cmd("tabn 1")<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-F2>', ':lua vim.cmd("tabn 2")<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-F3>', ':lua vim.cmd("tabn 3")<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-F4>', ':lua vim.cmd("tabn 4")<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-F5>', ':lua vim.cmd("tabn 5")<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-F6>', ':lua vim.cmd("tabn 6")<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-F7>', ':lua vim.cmd("tabn 7")<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-F8>', ':lua vim.cmd("tabn 8")<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-F9>', ':lua vim.cmd("tabn 9")<CR>', { noremap = true, silent = true })
--clear search
vim.api.nvim_set_keymap('n', '<Leader>s', ':let @/ = ""<CR>', { noremap = true, silent = true })

