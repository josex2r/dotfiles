return {
  -- comments using "gcc"
  {
    "numToStr/Comment.nvim",

    config = function()
      require('Comment').setup({
        toggler = {
          line = "gcc",
          block = "gbc",
        },
        pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
      })
    end,
  },

  -- add/delete/replace surroundings of a sandwiched textobject
  "tpope/vim-surround",

  -- Read ".editorconfig" file
  "gpanders/editorconfig.nvim",

  -- Repeat everything using "."
	"tpope/vim-repeat",

  -- Clean terminal when running a vim shell commands
	-- "fcpg/vim-altscreen",

  -- A search panel for neovim.
	{
		"windwp/nvim-spectre",

		dependencies = {
      "nvim-lua/plenary.nvim",
    },

    keys = {
      {
        "<leader>sf",
        "<cmd>lua require('spectre').open_file_search()<cr>",
        desc = "Search in file",
      },
      {
        "<leader>sF",
        "<cmd>lua require('spectre').open_visual({ select_word=true })",
        desc = "Search current word",
      },
    },

    config = {
      highlight = {
        search = "Exception",
        replace = "Identifier",
      },
    },
	},

  -- Indentation guides
	{
    "lukas-reineke/indent-blankline.nvim",

    config = {
      space_char_blankline = " ",
      show_current_context = true,
      show_current_context_start = true,
      buftype_exclude = { "terminal" },
      --[[ filetype = { ]]
      --[[ 	"javascript", ]]
      --[[ 	"typescript", ]]
      --[[ 	"python", ]]
      --[[ 	"lua", ]]
      --[[ 	"json", ]]
      --[[ 	"yaml", ]]
      --[[ 	"conf", ]]
      --[[ 	"sh", ]]
      --[[ }, ]]
      filetype_exclude = {
        "lspinfo",
        "packer",
        "checkhealth",
        "help",
        "dashboard",
        "NvimTree",
        "lsp-installer",
        "terminal",
        "TelescopePrompt",
        "TelescopeResults",
        "log",
        "fugitive",
        "gitcommit",
        "vimwiki",
        "markdown",
        "txt",
        "vista",
        "git",
        "undotree",
        "",
      },
    },

    init = function()
      vim.opt.list = true
      vim.opt.listchars:append("space:⋅")
      vim.opt.listchars:append("eol:↴")
    end,
  },

  -- Better Quick Fix window
	"kevinhwang91/nvim-bqf",

  --

  {
    "simrat39/symbols-outline.nvim",

    keys = {
      {
        "<leader>a",
        "<cmd>SymbolsOutline<cr>",
        desc = "LSP Symbols",
      },
    },

    config = {
      highlight_hovered_item = true,
      show_guides = true,
      auto_preview = true,
      position = 'right',
      relative_width = true,
      width = 25,
      auto_close = false,
      show_numbers = false,
      show_relative_numbers = false,
      show_symbol_details = true,
      preview_bg_highlight = 'Pmenu',
      keymaps = { -- These keymaps can be a string or a table for multiple keys
          close = {"<Esc>", "q"},
          goto_location = "<Cr>",
          focus_location = "o",
          hover_symbol = "<C-space>",
          toggle_preview = "K",
          rename_symbol = "r",
          code_actions = "a",
      },
      lsp_blacklist = {},
      symbol_blacklist = {},
      symbols = {
          File = {icon = "", hl = "TSURI"},
          Module = {icon = "", hl = "TSNamespace"},
          Namespace = {icon = "", hl = "TSNamespace"},
          Package = {icon = "", hl = "TSNamespace"},
          Class = {icon = "𝓒", hl = "TSType"},
          Method = {icon = "ƒ", hl = "TSMethod"},
          Property = {icon = "", hl = "TSMethod"},
          Field = {icon = "", hl = "TSField"},
          Constructor = {icon = "", hl = "TSConstructor"},
          Enum = {icon = "ℰ", hl = "TSType"},
          Interface = {icon = "ﰮ", hl = "TSType"},
          Function = {icon = "", hl = "TSFunction"},
          Variable = {icon = "", hl = "TSConstant"},
          Constant = {icon = "", hl = "TSConstant"},
          String = {icon = "𝓐", hl = "TSString"},
          Number = {icon = "#", hl = "TSNumber"},
          Boolean = {icon = "⊨", hl = "TSBoolean"},
          Array = {icon = "", hl = "TSConstant"},
          Object = {icon = "⦿", hl = "TSType"},
          Key = {icon = "🔐", hl = "TSType"},
          Null = {icon = "NULL", hl = "TSType"},
          EnumMember = {icon = "", hl = "TSField"},
          Struct = {icon = "𝓢", hl = "TSType"},
          Event = {icon = "🗲", hl = "TSType"},
          Operator = {icon = "+", hl = "TSOperator"},
          TypeParameter = {icon = "𝙏", hl = "TSParameter"}
      }
    },
  },
}
