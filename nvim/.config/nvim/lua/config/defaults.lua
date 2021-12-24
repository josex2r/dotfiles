local M = {}

M.options = {
  leader = " ",
}

M.vim_options = {
  autoindent = true, -- copy indent from last line when starting new line
  backspace = "indent,eol,start",
  backup = false, -- creates a backup file
  clipboard = "unnamedplus", -- allows neovim to access the system clipboard
  cmdheight = 2, -- more space in the neovim command line for displaying messages
  colorcolumn = "99999", -- fixes indentline for now
  completeopt = { "menuone", "noselect" },
  conceallevel = 0, -- so that `` is visible in markdown files
  fileencoding = "utf-8", -- the encoding written to a file
  foldmethod = "manual", -- folding, set to "expr" for treesitter based folding
  foldexpr = "", -- set to "nvim_treesitter#foldexpr()" for treesitter based folding
  guifont = "monospace:h17", -- the font used in graphical neovim applications
  hidden = true, -- required to keep multiple buffers and open multiple buffers
  hlsearch = true, -- highlight all matches on previous search pattern
  history = 1000, -- increase history from 20 default to 1000
  ignorecase = true, -- ignore case in search patterns
  list = true, -- enable listchars
  mouse = "a", -- allow the mouse to be used in neovim
  pumheight = 10, -- pop up menu height
  showmode = false, -- we don't need to see things like -- INSERT -- anymore
  showtabline = 2, -- always show tabs
  smartcase = true, -- smart case
  smartindent = true, -- make indenting smarter again
  splitbelow = true, -- force all horizontal splits to go below current window
  splitright = true, -- force all vertical splits to go to the right of current window
  swapfile = false, -- creates a swapfile
  termguicolors = true, -- set term gui colors (most terminals support this)
  timeoutlen = 500, -- time to wait for a mapped sequence to complete (in milliseconds)
  title = true, -- set the title of window to the value of the titlestring
  -- opt.titlestring = "%<%F%=%l/%L - nvim" -- what the title of the window will be set to
  undodir = vim.fn.stdpath('config') .. '/undo', -- set an undo directory
  undofile = true, -- enable persistent undo
  updatetime = 300, -- faster completion
  writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  expandtab = true, -- convert tabs to spaces
  tabstop = 2, -- insert 2 spaces for a tab
  cursorline = true, -- highlight the current line
  number = true, -- set numbered lines
  relativenumber = false, -- set relative numbered lines
  numberwidth = 4, -- set number column width to 2 {default 4}
  signcolumn = "yes:2", -- always show the sign column, otherwise it would shift the text each time
  wrap = false, -- display lines as one long line
  spell = false,
  spelllang = "en",
  scrolloff = 8, -- start scrolling three lines before horizontal border of window
  sidescrolloff = 8,
  listchars = { tab = '→ ', eol = '↲', extends = '⟩', precedes = '⟨' },
  wildignore = {
    ".DS_STORE",
    "*.har",
    "*.jpg",
    "*.jpeg",
    "*.gif",
    "*.min.js",
    "*.png",
    "*/.git/*",
    "*/.svn/*",
    "*/cache/*",
    "*/build/*",
    "*/dist/*",
    "*/log/*",
    "*/recs/*",
    "*/recordings/*",
    "*/tmp/*",
  },
}

return M
