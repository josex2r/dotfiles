local keymap = vim.api.nvim_set_keymap

local opts = { noremap = true, silent = true }

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
-- keymap("n", "<C-Up>", ":resize -2<CR>", opts)
-- keymap("n", "<C-Down>", ":resize +2<CR>", opts)
-- keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
-- keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Visual --
-- Stay in indent mode
keymap("n", "<S-TAB>", "<l", opts)
keymap("n", "<TAB>", ">l", opts)
keymap("v", "<S-TAB>", "<gv", opts)
keymap("v", "<TAB>", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
-- keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
-- keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
-- keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
-- keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Jump words
-- How to get the first char? Use CRTL+V and press the key in command mode
-- How to get the second char? Use CRTL+K and press the key in command mode
-- <Esc> means escape char (<Esc>b === ^[b)
--
-- <M-*> is the 'meta' key (ALT)
keymap("n", "<M-f>", "<Esc>w", opts)
keymap("n", "<M-b>", "<Esc>b", opts)
keymap("v", "<M-f>", "<S-Right>", opts)
keymap("v", "<M-b>", "<S-Left>", opts)
keymap("i", "<M-f>", "<S-Right>", opts)
keymap("i", "<M-b>", "<S-Left>", opts)
keymap("c", "<M-f>", "<Esc>w", opts)
keymap("c", "<M-b>", "<Esc>b", opts)
keymap("o", "<M-f>", "<S-Right>", opts)
keymap("o", "<M-b>", "<S-Left>", opts)
vim.cmd([[
omap <M-f> <Esc>w
omap <M-b> <Esc>b
cnoremap <M-f> <S-Right>
cnoremap <M-b> <S-Left>
]])

-- Copy & paste {{{
-- Make y and p copy/paste to system clipboard
keymap("v", "<C-c>", '"+yi', opts)
keymap("v", "<C-x>", '"+c', opts)
-- vmap <C-v> c<ESC>"+p
-- imap <C-v> <ESC>"+pa

-- Fast saving file
keymap("n", "<leader>w", "<ESC>:w<CR>", opts)
keymap("n", "<leader>W", "<ESC>:w<CR>", opts)

-- Clear last search
keymap("n", "<leader>q", "<ESC>:noh<CR>", opts)

-- Return to the last buffer
keymap("n", "<leader><leader>", "<C-^>", opts)

-- Join lines and restore cursor location
keymap("n", "J", "mjJ`j", opts)

-- Fix page up and down
keymap("n", "<PageUp>", "<C-U>", opts)
keymap("n", "<PageDown>", "<C-D>", opts)
keymap("i", "<PageUp>", "<C-O><C-U>", opts)
keymap("i", "<PageDown>", "<C-O><C-D>", opts)

-- Faster split resizing
keymap("n", "+", "<C-W>+", opts)
keymap("n", "-", "<C-W>-", opts)

-- Quickfix navigation
keymap("n", "<leader>qq", "<ESC>:cclose<CR>", opts)
keymap("n", "<leader>qo", "<ESC>:copen<CR>", opts)
keymap("n", "<leader>qj", "<ESC>:cnext<CR>", opts)
keymap("n", "<leader>qk", "<ESC>:cprev<CR>", opts)
keymap("n", "<leader>qc", "<ESC>:cc<CR>", opts)
