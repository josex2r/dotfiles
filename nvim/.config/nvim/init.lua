-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Custom
require("config.commands")

vim.cmd([[
  augroup pikachu_color
    autocmd FileType * highlight DashboardHeader ctermfg=3 guifg=#f6cf57
  augroup END
]])
