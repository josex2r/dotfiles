local g = vim.g

g.dashboard_disable_at_vimenter = 0
g.dashboard_disable_statusline = 1
g.dashboard_default_executive = "telescope"
g.dashboard_custom_header = {
    '          ▀████▀▄▄              ▄█',
    '            █▀    ▀▀▄▄▄▄▄    ▄▄▀▀█',
    '    ▄        █          ▀▀▀▀▄  ▄▀',
    '   ▄▀ ▀▄      ▀▄              ▀▄▀',
    '  ▄▀    █     █▀   ▄█▀▄      ▄█',
    '  ▀▄     ▀▄  █     ▀██▀     ██▄█',
    '   ▀▄    ▄▀ █   ▄██▄   ▄  ▄  ▀▀ █',
    '    █  ▄▀  █    ▀██▀    ▀▀ ▀▀  ▄▀',
    '   █   █  █      ▄▄           ▄▀'
}

 g.dashboard_custom_section = {
    a = { description = { "🔍 Find File                 SPC f f" }, command = "Telescope find_files" },
    b = { description = { "📂 Recents                   SPC f o" }, command = "Telescope oldfiles" },
    c = { description = { "👁️  Find Word                 SPC f w" }, command = "Telescope live_grep" },
    d = { description = { "🗄️  New File                  SPC f n" }, command = "DashboardNewFile" },
    e = { description = { "📖 Bookmarks                 SPC b m" }, command = "Telescope marks" },
    f = { description = { "🔄 Load Last Session         SPC l  " }, command = "SessionLoad" },
 }

g.dashboard_custom_footer = {
   "   ",
}

vim.api.nvim_set_keymap("n", "<leader>Df", "<cmd>DashboardFindFile<cr>",
  {silent = true, noremap = true}
)

vim.api.nvim_set_keymap("n", "<leader>Dh", "<cmd>DashboardFindHistory<cr>",
  {silent = true, noremap = true}
)

vim.api.nvim_set_keymap("n", "<leader>Dj", "<cmd>DashboardJumpMark<cr>",
  {silent = true, noremap = true}
)

vim.api.nvim_set_keymap("n", "<leader>Dl", "<cmd>SessionLoad<cr>",
  {silent = true, noremap = true}
)

vim.api.nvim_set_keymap("n", "<leader>Dn", "<cmd>DashboardNewFile<cr>",
  {silent = true, noremap = true}
)

vim.api.nvim_set_keymap("n", "<leader>Ds", "<cmd>SessionSave<cr>",
  {silent = true, noremap = true}
)

vim.api.nvim_set_keymap("n", "<leader>Dw", "<cmd>DashboardFindWord<cr>",
  {silent = true, noremap = true}
)

