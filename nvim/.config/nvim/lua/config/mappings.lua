local M = {}

local generic_opts_any = { noremap = true, silent = true }

local generic_opts = {
  insert_mode = generic_opts_any,
  normal_mode = generic_opts_any,
  visual_mode = generic_opts_any,
  visual_block_mode = generic_opts_any,
  command_mode = generic_opts_any,
  term_mode = { silent = true },
}

local mode_adapters = {
  insert_mode = "i",
  normal_mode = "n",
  term_mode = "t",
  visual_mode = "v",
  visual_block_mode = "x",
  command_mode = "c",
}

-- Set key mappings individually
-- @param mode The keymap mode, can be one of the keys of mode_adapters
-- @param key The key of keymap
-- @param val Can be form as a mapping or tuple of mapping and user defined opt
function M.set_keymaps(mode, key, val)
  local opt = generic_opts[mode] and generic_opts[mode] or generic_opts_any
  if type(val) == "table" then
    opt = val[2]
    val = val[1]
  end
  vim.api.nvim_set_keymap(mode, key, val, opt)
end

-- Load key mappings for a given mode
-- @param mode The keymap mode, can be one of the keys of mode_adapters
-- @param keymaps The list of key mappings
function M.load_mode(mode, keymaps)
  mode = mode_adapters[mode] and mode_adapters[mode] or mode
  for k, v in pairs(keymaps) do
    M.set_keymaps(mode, k, v)
  end
end

-- Load key mappings for all provided modes
-- @param keymaps A list of key mappings for each mode
function M.load(keymaps)
  for mode, mapping in pairs(keymaps) do
    M.load_mode(mode, mapping)
  end
end

local keys = {
  insert_mode = {
    -- Move current line / block with Alt-j/k ala vscode.
    ["<A-j>"] = "<Esc>:m .+1<CR>==gi",
    -- Move current line / block with Alt-j/k ala vscode.
    ["<A-k>"] = "<Esc>:m .-2<CR>==gi",
    -- navigation
    ["<A-Up>"] = "<C-\\><C-N><C-w>k",
    ["<A-Down>"] = "<C-\\><C-N><C-w>j",
    ["<A-Left>"] = "<C-\\><C-N><C-w>h",
    ["<A-Right>"] = "<C-\\><C-N><C-w>l",
  },

  normal_mode = {
    -- Better window movement
    ["<C-h>"] = "<C-w>h",
    ["<C-j>"] = "<C-w>j",
    ["<C-k>"] = "<C-w>k",
    ["<C-l>"] = "<C-w>l",

    -- Resize with arrows
    ["<C-Up>"] = ":resize -2<CR>",
    ["<C-Down>"] = ":resize +2<CR>",
    ["<C-Left>"] = ":vertical resize -2<CR>",
    ["<C-Right>"] = ":vertical resize +2<CR>",

    -- Tab switch buffer
    ["<S-l>"] = ":BufferNext<CR>",
    ["<S-h>"] = ":BufferPrevious<CR>",

    -- Move current line / block with Alt-j/k a la vscode.
    ["<A-j>"] = ":m .+1<CR>==",
    ["<A-k>"] = ":m .-2<CR>==",

    -- QuickFix
    ["]q"] = ":cnext<CR>",
    ["[q"] = ":cprev<CR>",
    ["<C-q>"] = ":call QuickFixToggle()<CR>",
  },

  term_mode = {
    -- Terminal window navigation
    ["<C-h>"] = "<C-\\><C-N><C-w>h",
    ["<C-j>"] = "<C-\\><C-N><C-w>j",
    ["<C-k>"] = "<C-\\><C-N><C-w>k",
    ["<C-l>"] = "<C-\\><C-N><C-w>l",
  },

  visual_mode = {
    -- Better indenting
    ["<"] = "<gv",
    [">"] = ">gv",

    -- ["p"] = '"0p',
    -- ["P"] = '"0P',
  },

  visual_block_mode = {
    -- Move selected line / block of text in visual mode
    ["K"] = ":move '<-2<CR>gv-gv",
    ["J"] = ":move '>+1<CR>gv-gv",

    -- Move current line / block with Alt-j/k ala vscode.
    ["<A-j>"] = ":m '>+1<CR>gv-gv",
    ["<A-k>"] = ":m '<-2<CR>gv-gv",
  },

  command_mode = {
    -- navigate tab completion with <c-j> and <c-k>
    -- runs conditionally
    ["<C-j>"] = { 'pumvisible() ? "\\<C-n>" : "\\<C-j>"', { expr = true, noremap = true } },
    ["<C-k>"] = { 'pumvisible() ? "\\<C-p>" : "\\<C-k>"', { expr = true, noremap = true } },
  },
}

if vim.fn.has "mac" == 1 then
  keys.normal_mode["<A-Up>"] = keys.normal_mode["<C-Up>"]
  keys.normal_mode["<A-Down>"] = keys.normal_mode["<C-Down>"]
  keys.normal_mode["<A-Left>"] = keys.normal_mode["<C-Left>"]
  keys.normal_mode["<A-Right>"] = keys.normal_mode["<C-Right>"]
end

function M.init()
  vim.g.mapleader = " "
  M.load(keys)
end











local generic_options = { noremap = false, silent = true }

local key_mapper = function(mode, key, result, options)
  options = options or generic_options

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
-- key_mapper('v', '<C-v>', 'c<ESC>"+p')
-- key_mapper('i', '<C-v>', '<ESC>"+pa')

-- Sudo write (,W)
key_mapper('n', '<leader>w', '<Esc>:w<CR>')

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

return M
