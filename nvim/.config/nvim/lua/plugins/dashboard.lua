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

    dashboard.custom_center = {}

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
