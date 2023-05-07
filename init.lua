--[[ init.lua ]]

-- lua will also look for any files that are included in the /lua subdirectory
-- all code contained in this subfolder is part of the "runtimepath" and can be imported for use in Neovim with the command require('name-of-file')

-- LEADER
-- These keybindings need to be defined before the first /
-- is called; otherwise, it will default to "\"
--
-- vim.g.mapleader = ","
-- vim.g.localleader = "\\"
-- vim.o.runtimepath = vim.fn.stdpath('data') .. '/site/pack/*/start/*,' .. vim.o.runtimepath

-- IMPORTS
require('core.vars')      -- Variables
require('core.opts')      -- Options
require('core.keys')      -- Keymaps
require('core.plugins')      -- Plugins
require('core.plugin_config')
