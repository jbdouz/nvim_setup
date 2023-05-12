local neorg = require('neorg')

neorg.setup {
    load = {
        ["core.defaults"] = {},
        ['core.concealer'] = {},
        ['core.dirman'] = {
          config = {
            workspaces = {
              school = "~/jbdouz@gmail.com - Google Drive/My Drive/notes/school",
              extra_learning = "~/jbdouz@gmail.com - Google Drive/My Drive/notes/extra_learning",
              side_project = "~/jbdouz@gmail.com - Google Drive/My Drive/notes/side_project",
            },
          }
        }
    }
}
