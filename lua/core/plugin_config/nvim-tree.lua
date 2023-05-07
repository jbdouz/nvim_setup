vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])

require ("nvim-tree").setup()

vim.keymap.set('n', '<C-n>', ':NvimTreeFindFileToggle<CR>')
-- vim.keymap.set('n', '<C->', ':NvimTreeFocus<CR>')
-- vim.keymap.set('n', '<C-t>', ':')
