local neorg = require('neorg')

neorg.setup {
    load = {
        ["core.defaults"] = {},
        ['core.dirman'] = {
          config = {
            workspaces = {
              school = "~notes/school",
              side = "~/notes/side",
            }
          }
        }
    }
}
