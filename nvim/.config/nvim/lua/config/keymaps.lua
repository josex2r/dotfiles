-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = require("utils.keymap")
local map = keymap.map
local opts = { noremap = true, silent = true }

--- Return to the last buffer
map({ "n" }, "<leader><leader>", "<C-^>", { desc = "Goto prev buffer" })

-- Move to window using the <ctrl> hjkl keys
function move_left()
  require("nvim-tmux-navigation").NvimTmuxNavigateLeft()
end
function move_up()
  require("nvim-tmux-navigation").NvimTmuxNavigateUp()
end
function move_down()
  require("nvim-tmux-navigation").NvimTmuxNavigateDown()
end
function move_right()
  require("nvim-tmux-navigation").NvimTmuxNavigateRight()
end

map("n", "<C-h>", move_left, { desc = "Go to left window", remap = true })
map("n", "<C-Left>", move_left, { desc = "Go to left window", remap = true })
map("n", "<C-k>", move_up, { desc = "Go to up window", remap = true })
map("n", "<C-Up>", move_up, { desc = "Go to bottom window", remap = true })
map("n", "<C-j>", move_down, { desc = "Go to bottom window", remap = true })
map("n", "<C-Down>", move_down, { desc = "Go to bottom window", remap = true })
map("n", "<C-l>", move_right, { desc = "Go to right window", remap = true })
map("n", "<C-Right>", move_right, { desc = "Go to right window", remap = true })

-- Better code indent
map("n", "<S-TAB>", "<l", { desc = "Reduce indent", remap = true })
map("n", "<TAB>", ">l", { desc = "Increment indent", remap = true })
map("v", "<S-TAB>", "<gv", { desc = "Reduce indent", remap = true })
map("v", "<TAB>", ">gv", { desc = "Increment indent", remap = true })

-- Jump words
-- How to get the first char? Use CRTL+V and press the key in command mode
-- How to get the second char? Use CRTL+K and press the key in command mode
-- <Esc> means escape char (<Esc>b === ^[b)
--
-- <M-*> is the 'meta' key (ALT)
vim.api.nvim_set_keymap("n", "<M-f>", "<Esc>w", opts)
vim.api.nvim_set_keymap("n", "<M-b>", "<Esc>b", opts)
vim.api.nvim_set_keymap("v", "<M-f>", "<S-Right>", opts)
vim.api.nvim_set_keymap("v", "<M-b>", "<S-Left>", opts)
vim.api.nvim_set_keymap("i", "<M-f>", "<S-Right>", opts)
vim.api.nvim_set_keymap("i", "<M-b>", "<S-Left>", opts)
vim.api.nvim_set_keymap("c", "<M-f>", "<Esc>w", opts)
vim.api.nvim_set_keymap("c", "<M-b>", "<Esc>b", opts)
vim.api.nvim_set_keymap("o", "<M-f>", "<S-Right>", opts)
vim.api.nvim_set_keymap("o", "<M-b>", "<S-Left>", opts)
