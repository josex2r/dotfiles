local actions = require('telescope.actions')
local previewers = require('telescope.previewers')
local Job = require('plenary.job')
-- local trouble = require("trouble.providers.telescope")

vim.cmd [[
  " File
  nnoremap <C-p> <cmd>Telescope find_files<cr>
  nnoremap <leader>p <cmd>Telescope buffers<cr>
]]

require('telescope').setup{
  defaults = {
    file_ignore_patterns = {
      "^.lint-todo/",
      "^node_modules/",
    },
    mappings = {
      -- Mapping <Esc> to quit in insert mode
      i = {
        ["<esc>"] = actions.close,
        -- ["<c-t>"] = trouble.open_with_trouble,
      },
      n = {
        -- ["<c-t>"] = trouble.open_with_trouble,
      },
    },
  },
  pickers = {
    find_files = {
      hidden = true
    },
    buffers = {
      sort_lastused = false,
    },
  }
}

require('telescope').load_extension('fzf')
require('telescope').load_extension('coc')
