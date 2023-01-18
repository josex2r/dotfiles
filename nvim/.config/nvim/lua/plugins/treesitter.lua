return {
  --language highlight
  {
    "nvim-treesitter/nvim-treesitter",

    build = ":TSUpdate",

    event = "BufReadPost",

    dependencies = {
      { "nvim-treesitter/nvim-treesitter-textobjects" },
      -- Fix comments when multiple langs exists on same file
      { "JoosepAlviste/nvim-ts-context-commentstring" },
      -- Colorize brackets
      { "p00f/nvim-ts-rainbow" },
    },

    opts = {
      -- ensure_installed = "maintained",
      incremental_selection = { enable = true },
      autopairs = {
        enable = true,
      },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = true,
        disable = { "python" },
      },
      rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
        colors = {
          "#cc241d",
          "#b16286",
          "#d79921",
          "#689d6a",
          "#d65d0e",
          "#458588",
        },
      },
      matchup = {
        enable = true, -- mandatory, false will disable the whole extension
        include_match_words = true,
        disable = { "c", "ruby" }, -- optional, list of language that will be disabled
      },
      context_commentstring = {
        enable = true,
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
          keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
          },
        },
        move = {
          enable = true,
          set_jumps = true, -- whether to set jumps in the jumplist
          goto_next_start = {
            ["]m"] = "@function.outer",
            ["]]"] = "@class.outer",
          },
          goto_next_end = {
            ["]M"] = "@function.outer",
            ["]["] = "@class.outer",
          },
          goto_previous_start = {
            ["[m"] = "@function.outer",
            ["[["] = "@class.outer",
          },
          goto_previous_end = {
            ["[M"] = "@function.outer",
            ["[]"] = "@class.outer",
          },
        },
      },
    },

    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },

  -- highlight hex color codes
  {
    "norcalli/nvim-colorizer.lua",

    event = "BufReadPre",
    config = {
      filetypes = { "*", "!lazy" },
      buftype = { "*", "!prompt", "!nofile" },
      user_default_options = {
        RGB = true, -- #RGB hex codes
        RRGGBB = true, -- #RRGGBB hex codes
        names = false, -- "Name" codes like Blue
        RRGGBBAA = true, -- #RRGGBBAA hex codes
        AARRGGBB = false, -- 0xAARRGGBB hex codes
        rgb_fn = true, -- CSS rgb() and rgba() functions
        hsl_fn = true, -- CSS hsl() and hsla() functions
        css = false, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
        -- Available modes: foreground, background
        -- Available modes for `mode`: foreground, background,  virtualtext
        mode = "background", -- Set the display mode.
        virtualtext = "■",
      },
    },
  },
}

-- Folds
-- vim.cmd([[
-- set foldmethod=expr
-- set foldexpr=nvim_treesitter#foldexpr()
--
-- augroup fold
--   autocmd Syntax * normal zR
-- augroup END
-- ]])
