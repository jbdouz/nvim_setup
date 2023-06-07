--[[ init.lua ]]

-- lua will also look for any files that are included in the /lua subdirectory
-- all code contained in this subfolder is part of the "runtimepath" and can be imported for use in Neovim with the command require('name-of-file')


-- IMPORTS
require('core.vars')      -- Variables
require('core.opts')      -- Options
require('core.keys')      -- Keymaps
require('core.plugins')      -- Plugins
require('core.plugin_config')
