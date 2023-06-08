-- Declared here instead of plugin definition to override "LazyNvim" defaults
local nvim_tmux_nav = require("nvim-tmux-navigation")

vim.keymap.set("n", "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft, { desc = "Go to left window", remap = true })
vim.keymap.set("n", "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown, { desc = "Go to lower window", remap = true })
vim.keymap.set("n", "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp, { desc = "Go to upper window", remap = true })
vim.keymap.set("n", "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight, { desc = "Go to right window", remap = true })
vim.keymap.set("n", "<C-Left>", nvim_tmux_nav.NvimTmuxNavigateLeft, { desc = "Go to left window", remap = true })
vim.keymap.set("n", "<C-Down>", nvim_tmux_nav.NvimTmuxNavigateDown, { desc = "Go to lower window", remap = true })
vim.keymap.set("n", "<C-Up>", nvim_tmux_nav.NvimTmuxNavigateUp, { desc = "Go to upper window", remap = true })
vim.keymap.set("n", "<C-Right>", nvim_tmux_nav.NvimTmuxNavigateRight, { desc = "Go to right window", remap = true })
vim.keymap.set("n", "<C-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive, { desc = "Go to last window", remap = true })
vim.keymap.set("n", "<C-Space>", nvim_tmux_nav.NvimTmuxNavigateNext, { desc = "Go to next window", remap = true })
