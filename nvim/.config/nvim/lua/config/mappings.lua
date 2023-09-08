local keymap = vim.api.nvim_set_keymap

local opts = { noremap = true, silent = true }

--Remap leader key
keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Visual --
-- Stay in indent mode
keymap("n", "<S-TAB>", "<l", opts)
keymap("n", "<TAB>", ">l", opts)
keymap("v", "<S-TAB>", "<gv", opts)
keymap("v", "<TAB>", ">gv", opts)

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
