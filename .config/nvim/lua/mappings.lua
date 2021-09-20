local generic_options = { noremap = false, silent = true }

local key_mapper = function(mode, key, result, options)
  options = optins or generic_options

  vim.api.nvim_set_keymap(
    mode,
    key,
    result,
    options
  )
end

-- Jump words
-- How to get the first char? Use CRTL+V and press the key in command mode
-- How to get the second char? Use CRTL+K and press the key in command mode
-- <Esc> means escape char (<Esc>b === ^[b)
--
-- :nmap - Display normal mode maps
-- :imap - Display insert mode maps
-- :vmap - Display visual and select mode maps
-- :smap - Display select mode maps
-- :xmap - Display visual mode maps
-- :cmap - Display command-line mode maps
-- :omap - Display operator pending mode maps
--
-- <M-*> is the 'meta' key (ALT)
-- key_mapper('n', '<M-f>', '<Esc>w')
-- key_mapper('n', '<M-b>', '<Esc>b')
key_mapper('v', '<M-f>', '<S-Right>')
key_mapper('v', '<M-b>', '<S-Left>')
key_mapper('i', '<M-f>', '<S-Right>')
key_mapper('i', '<M-b>', '<S-Left>')
key_mapper('c', '<M-f>', '<Esc>w')
key_mapper('c', '<M-b>', '<Esc>b')
key_mapper('o', '<M-f>', '<Esc>w')
key_mapper('o', '<M-b>', '<Esc>b')
key_mapper('c', '<M-f>', '<S-Right>', {  noremap = true, silent = true })
key_mapper('c', '<M-b>', '<S-Left>', { noremap = true, silent = true })

-- Move current lines up/down
key_mapper('n', '<M-j>', '<Esc>:m .+1<CR>==gi')
key_mapper('n', '<M-k>', '<Esc>:m .-2<CR>==gi')


-- if vim.api.bufwinnr(1) then
  key_mapper('n', '+', '<C-W>+')
  key_mapper('n', '-', '<C-W>-')
-- end

-- Copy & paste
-- Make y and p copy/paste to system clipboard
key_mapper('v', '<C-c>', '"+yi')
key_mapper('v', '<C-x>', '"+c')
key_mapper('v', '<C-v>', 'c<ESC>"+p')
key_mapper('i', '<C-v>', '<ESC>"+pa')

-- Sudo write (,W)
key_mapper('n', '<leader>w', '<Esc>:w<CR>')
-- key_mapper('', '<leader>W ', 'w !sudo tee %<CR>')

-- Better mark jumping (line + col) {{{
key_mapper('n', "'", '`')

-- Clear last search
key_mapper('n', '<leader>qs', '<Esc>:noh<CR>')

-- Search and replace word under cursor (,*) {{{
-- key_mapper('n', '<leader>*', '<Esc>:%s/\<<C-r><C-w>\>//<Left>')
-- key_mapper('v', '<leader>*', '"hy:%s/\V<C-r>h//<left>')

-- Join lines and restore cursor location (J) {{{
key_mapper('n', 'J', 'mjJ`j')

-- Return to the last buffer
key_mapper('n', '<Leader><Leader>', '<C-^>')

-- Quickfix window (,qq) (,qo) (,qj) (,qk) {{{
key_mapper('n', '<leader>qq', '<ESC>:cclose<CR>')
key_mapper('n', '<leader>qo', '<ESC>:copen<CR>')
key_mapper('n', '<leader>qj', '<ESC>:cnext<CR>')
key_mapper('n', '<leader>qk', '<ESC>:cprev<CR>')
key_mapper('n', '<leader>qc', '<ESC>:cc<CR>')

-- key_mapper('n', 'Mac OS X Terminal.app default Home and End
key_mapper('n', '<C-A>', '<Home>')
key_mapper('i', '<C-A>', '<Home>')
key_mapper('v', '<C-A>', '<Home>')
key_mapper('c', '<C-A>', '<Home>')
key_mapper('n', '<C-E>', '<End>')
key_mapper('i', '<C-E>', '<End>')
key_mapper('v', '<C-E>', '<End>')
key_mapper('c', '<C-E>', '<End>')

-- Fix page up and down {{{
key_mapper('n', '<PageUp>', '<C-U>')
key_mapper('n', '<PageDown>', '<C-D>')
key_mapper('i', '<PageUp>', '<C-O><C-U>')
key_mapper('i', '<PageDown>', '<C-O><C-D>')
