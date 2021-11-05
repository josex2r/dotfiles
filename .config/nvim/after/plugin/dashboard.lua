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

