local actions = require('telescope.actions')
local trouble = require("trouble.providers.telescope")
local telescope = require('telescope')

vim.cmd [[
  " File
  nnoremap <C-p> <cmd>Telescope find_files<cr>
  nnoremap <leader>p <cmd>Telescope buffers<cr>
]]

telescope.setup{
  defaults = {
    layout_config = {
      horizontal = {
        preview_cutoff = 0,
      },
    },
    file_ignore_patterns = {
      "^%.lint%-todo/",
      "^%.git/",
      "^recordings/",
      "^node_modules/",
      "^bower_components/",
    },
    mappings = {
      -- Mapping <Esc> to quit in insert mode
      i = {
        ["<esc>"] = actions.close,
        ["<C-h>"] = "which_key",
        ["<c-t>"] = trouble.open_with_trouble,
      },
      n = {
        ["<C-h>"] = "which_key",
        ["<c-t>"] = trouble.open_with_trouble,
      },
    },
  },
  pickers = {
    find_files = {
      hidden = true
    },
    buffers = {
      sort_lastused = true,
    },
  },
  extensions = {
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = "smart_case", -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    },
  },
}

telescope.load_extension('fzf')
