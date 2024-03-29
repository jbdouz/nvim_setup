-- LEADER
-- These keybindings need to be defined before the first /
-- is called; otherwise, it will default to "\"

vim.g.mapleader = " "
vim.g.maplocalleader = ","
-- vim.o.runtimepath = vim.fn.stdpath('data') .. '/site/pack/*/start/*,' .. vim.o.runtimepath

-- [[ keys.lua ]]
local map = vim.api.nvim_set_keymap

-- remap the key used to leave insert mode
-- the function takes 4 pars
-- mode: insert mode, normal mode, command mode, visual mode
-- sequence of keys to press
-- command
-- options

map("i", "jk", "<ESC>", {}) 
-- "jk" to escape edit mode

map("n", "<leader>nh", ":nohl<CR>", {}) 
-- " nh" to clear search highlight

map("n", "<leader>+", "<C-a>", {})
map("n", "<leader>-", "<C-x>", {})
-- " +" / " -" to increment/decrement

map("n", "<leader>sv", "<C-w>v", {}) -- split window vertically
map("n", "<leader>sh", "<C-w>s", {}) -- split window horizontally
map("n", "<leader>se", "<C-w>=", {}) -- make split equal width
map("n", "<leader>sx", ":close<CR>", {}) -- close current split window

map("n", "<leader>to", ":tabnew<CR>", {}) -- open new tab
map("n", "<leader>tx", ":tabclose<CR>", {}) -- close current tab
map("n", "<leader>tn", ":tabn<CR>", {}) -- go to next tab
map("n", "<leader>tp", ":tabp<CR>", {}) -- go to previous tab

-- latex live review 
map("n",  "<Leader>p", ":LatexPreviewToggle<CR>", {})
map("n",  "<Leader>[", ":PrevLatexPreviewMode", {})
map("n",  "<Leader>]", ":NextLatexPreviewMode<CR>", {})

-- plugin keymaps

map("n", "<leader>sm", ":MaximizerToggle<CR>", {}) -- vim-maximizer

-- telescope
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", {})
map("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", {})
map("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", {})
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", {})
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", {})

-- auto bracket completion
map("i", "{", "{}<Esc>ha", {noremap = true})
map("i", "(", "()<Esc>ha", {noremap = true})
map("i", "[", "[]<Esc>ha", {noremap = true})
map("i", "\"", "\"\"<Esc>ha", {noremap = true})
map("i", "'", "''<Esc>ha", {noremap = true})
map("i", "`", "``<Esc>ha", {noremap = true})

-- markdown preview
map('n', '<leader>pv', '<Plug>MarkdownPreview', { noremap = false, silent = true })
map('n', '<leader>ps', '<Plug>MarkdownPreviewStop', { noremap = false, silent = true })
map('n', '<leader>pt', '<Plug>MarkdownPreviewToggle', { noremap = false, silent = true })



