local neorg = require('neorg')

neorg.setup {
    load = {
        ["core.defaults"] = {},
        ['core.concealer'] = {
            config = {
                icons = {
                    todo = {
                        uncertain = {
                            icon = "?",
                        }
                    }
                },
                icon_preset = "basic",
                folds = {
                    fdls = 2,
                }
            }
        },
        ['core.dirman'] = {
          config = {
            workspaces = {
              school = "~/jbdouz@gmail.com - Google Drive/My Drive/notes/school",
              extra_learning = "~/jbdouz@gmail.com - Google Drive/My Drive/notes/extra_learning",
              side_project = "~/jbdouz@gmail.com - Google Drive/My Drive/notes/side_project",
              coding_cheatsheet = "~/jbdouz@gmail.com - Google Drive/My Drive/notes/coding_cheatsheet",
            },
          }
        },
        ['core.highlights'] = {},
        ['core.keybinds'] = {},
        ['core.mode'] = {},
        ['core.neorgcmd'] = {},
        ['core.autocommands'] = {},
        ['core.integrations.treesitter'] = {},
        ['core.export'] = {
            config = {
                export_dir = {
                 "~/jbdouz@gmail.com - Google Drive/My Drive/notes/export_dir/html-export",
                 "~/jbdouz@gmail.com - Google Drive/My Drive/notes/export_dir/pdf-export",
                 "~/jbdouz@gmail.com - Google Drive/My Drive/notes/export_dir/md-export",
                }
            }
        },
    }
}
