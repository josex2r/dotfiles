-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

--- Return to the last buffer
vim.keymap.set({ "n" }, "<leader><leader>", "<C-^>", { desc = "Goto prev buffer" })

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

vim.keymap.set("n", "<C-h>", move_left, { desc = "Go to left window", remap = true })
vim.keymap.set("n", "<C-Left>", move_left, { desc = "Go to left window", remap = true })
vim.keymap.set("n", "<C-k>", move_up, { desc = "Go to up window", remap = true })
vim.keymap.set("n", "<C-Up>", move_up, { desc = "Go to bottom window", remap = true })
vim.keymap.set("n", "<C-j>", move_down, { desc = "Go to bottom window", remap = true })
vim.keymap.set("n", "<C-Down>", move_down, { desc = "Go to bottom window", remap = true })
vim.keymap.set("n", "<C-l>", move_right, { desc = "Go to right window", remap = true })
vim.keymap.set("n", "<C-Right>", move_right, { desc = "Go to right window", remap = true })

-- Better code indent
vim.keymap.set("n", "<S-TAB>", "<l", { desc = "Reduce indent", remap = true })
vim.keymap.set("n", "<TAB>", ">l", { desc = "Increment indent", remap = true })
vim.keymap.set("v", "<S-TAB>", "<gv", { desc = "Reduce indent", remap = true })
vim.keymap.set("v", "<TAB>", ">gv", { desc = "Increment indent", remap = true })

-- Jump words
-- How to get the first char? Use CRTL+V and press the key in command mode
-- How to get the second char? Use CRTL+K and press the key in command mode
-- <Esc> means escape char (<Esc>b === ^[b)
--
-- <M-*> is the 'meta' key (ALT)
vim.keymap.set("n", "<M-f>", "<Esc>w", { desc = "Jump forward", remap = true })
vim.keymap.set("n", "<M-b>", "<Esc>b", { desc = "Jump backwards", remap = true })
vim.keymap.set("v", "<M-f>", "<S-Right>", { desc = "Jump forward", remap = true })
vim.keymap.set("v", "<M-b>", "<S-Left>", { desc = "Jump backwards", remap = true })
vim.keymap.set("i", "<M-f>", "<S-Right>", { desc = "Jump forward", remap = true })
vim.keymap.set("i", "<M-b>", "<S-Left>", { desc = "Jump backwards", remap = true })
vim.keymap.set("c", "<M-f>", "<S-Right>", { desc = "Jump forward", remap = true })
vim.keymap.set("c", "<M-b>", "<S-Left>", { desc = "Jump backwards", remap = true })
vim.keymap.set("o", "<M-f>", "<S-Right>", { desc = "Jump forward", remap = true })
vim.keymap.set("o", "<M-b>", "<S-Left>", { desc = "Jump backwards", remap = true })
