return {
  {
    "nvim-telescope/telescope.nvim",

    dependencies = {
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },

    keys = {
      {
        "<C-p>",
        "<cmd>Telescope find_files<cr>",
        desc = "Find files",
      },
      {
        "<leader>p",
        "<cmd>Telescope buffers<cr>",
        desc = "Find buffers",
      },
      {
        "<leader>fg",
        "<cmd>Telescope live_grep<cr>",
        desc = "Live grep",
      },
      {
        "<leader>fh",
        "<cmd>Telescope help_tags<cr>",
        desc = "Help tags",
      },
      {
        "<leader>fo",
        "<cmd>Telescope oldfiles<cr>",
        desc = "Old files",
      },
      {
        "<leader>gw",
        "<cmd>Telescope git_branches<cr>",
        desc = "Git branches",
      },
      {
        "<leader>gx",
        "<cmd>Telescope git_commits<cr>",
        desc = "Git commits",
      },
      {
        "<leader>gz",
        "<cmd>Telescope git_status<cr>",
        desc = "Git status",
      },
      {
        "<leader>ct",
        "<cmd>Telescope treesitter<cr>",
        desc = "Treesitter symbols",
      },
      {
        "<leader>vc",
        "<cmd>Telescope colorscheme<cr>",
        desc = "Vim colorscheme",
      },
    },

    config = function()
      local telescope = require('telescope')
      local actions = require("telescope.actions")
      local trouble = require("trouble.providers.telescope")

      telescope.setup({
        defaults = {
          prompt_prefix = "  ",
          selection_caret = "  ",
          layout_config = {
            horizontal = {
              preview_cutoff = 0,
            },
          },
          preview = {
            -- filesize_hook = function(filepath, bufnr, opts)
            -- 	local max_bytes = 10000
            -- 	local cmd = { "head", "-c", max_bytes, filepath }
            -- 	require("telescope.previewers.utils").job_maker(cmd, bufnr, opts)
            -- end,
            filesize_hook = function(filepath, bufnr, opts)
              local path = require("plenary.path"):new(filepath)
              -- opts exposes winid
              local height = vim.api.nvim_win_get_height(opts.winid)
              local lines = vim.split(path:head(height), "[\r]?\n")
              vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, lines)
            end,
            timeout_hook = function(filepath, bufnr, opts)
              local cmd = { "echo", "timeout" }
              require("telescope.previewers.utils").job_maker(cmd, bufnr, opts)
            end,
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
            hidden = true,
            find_command = {
              "rg",
              "--files",
              "--hidden",
              "--glob",
              "!.git/*",
              "--glob",
              "!.lint-todo/*",
              "--glob",
              "!recs/*",
              "--glob",
              "!recordings/*",
              "--glob",
              "!node_modules/*",
              "--glob",
              "!bower_components/*",
              "--follow",
            },
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
      })

      telescope.load_extension("fzf")
    end,
  },
}
