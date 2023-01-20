local home = os.getenv('HOME')
local g = vim.g

-- Force Pikachu color to yellow
vim.cmd([[
augroup pikachu_color
  autocmd FileType dashboard highlight DashboardHeader ctermfg=3 guifg=#f6cf57
augroup END
]])

return {
  "glepnir/dashboard-nvim",

  init = function()
    local dashboard = require('dashboard')

    dashboard.custom_center = {
      {
        icon = "  ",
        desc = "Recently laset session                  ",
        shortcut = "SPC s l",
        action = "SessionLoad",
      },
      {
        icon = "  ",
        desc = "Recently opened files                   ",
        action = "DashboardFindHistory",
        shortcut = "SPC f h",
      },
      {
        icon = "  ",
        desc = "Find  File                              ",
        action = "Telescope find_files find_command=rg,--hidden,--files",
        shortcut = "SPC f f",
      },
      {
        icon = "  ",
        desc = "File Browser                            ",
        action = "Telescope file_browser",
        shortcut = "SPC f b",
      },
      {
        icon = "  ",
        desc = "Find  word                              ",
        aciton = "DashboardFindWord",
        shortcut = "SPC f w",
      },
      {
        icon = "  ",
        desc = "Open Personal dotfiles                  ",
        action = "Telescope dotfiles path=" .. home .. "/dotfiles",
        shortcut = "SPC f d",
      },
    }

    g.dashboard_disable_at_vimenter = 0
    g.dashboard_disable_statusline = 1
    g.dashboard_default_executive = "telescope"
    dashboard.custom_header = {
      "",
      "",
      "          ▀████▀▄▄              ▄█",
      "            █▀    ▀▀▄▄▄▄▄    ▄▄▀▀█",
      "    ▄        █          ▀▀▀▀▄  ▄▀",
      "   ▄▀ ▀▄      ▀▄              ▀▄▀",
      "  ▄▀    █     █▀   ▄█▀▄      ▄█",
      "  ▀▄     ▀▄  █     ▀██▀     ██▄█",
      "   ▀▄    ▄▀ █   ▄██▄   ▄  ▄  ▀▀ █",
      "    █  ▄▀  █    ▀██▀    ▀▀ ▀▀  ▄▀",
      "   █   █  █      ▄▄           ▄▀",
      "",
      "",
    }

    dashboard.custom_footer = {
      "   ",
    }
  end,
}
