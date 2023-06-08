local Util = require("lazyvim.util")

return {

  -- file explorer
  {
    "nvim-neo-tree/neo-tree.nvim",

    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },

    cmd = "Neotree",

    branch = "v2.x",

    keys = {
      {
        "<leader>t",
        function()
          require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
        end,
        desc = "Explorer NeoTree (cwd)",
      },
      { "<leader>e", "<leader>fe", desc = "Explorer NeoTree (root dir)", remap = true },
      { "<leader>E", "<leader>fE", desc = "Explorer NeoTree (cwd)", remap = true },
    },

    opts = {
      filesystem = {
        bind_to_cwd = false,
        follow_current_file = true,
      },
    },
  },

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

    opts = {
      highlight = {
        search = "Exception",
        replace = "Identifier",
      },
    },
  },

  {
    "nvim-telescope/telescope.nvim",

    dependencies = {
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "nvim-lua/plenary.nvim",
    },

    keys = {
      { "<leader>,", "<cmd>Telescope buffers show_all_buffers=true<cr>", desc = "Switch Buffer" },
      { "<leader>/", Util.telescope("live_grep"), desc = "Live grep" },
      { "<leader>:", "<cmd>Telescope command_history<cr>", desc = "Command History" },

      { "<C-p>", "<cmd>Telescope find_files<cr>", desc = "Find files" },
      { "<leader>p", "<cmd>Telescope buffers<cr>", desc = "Find buffers" },
      -- find
      { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
      { "<leader>fG", Util.telescope("live_grep"), desc = "Live grep (cwd)" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
      { "<leader>ff", Util.telescope("files"), desc = "Find Files (root dir)" },
      { "<leader>fF", Util.telescope("files", { cwd = false }), desc = "Find Files (cwd)" },
      { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent" },
      -- search
      { "<leader>sa", "<cmd>Telescope autocommands<cr>", desc = "Auto Commands" },
      { "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buffer" },
      { "<leader>sc", "<cmd>Telescope command_history<cr>", desc = "Command History" },
      { "<leader>sC", "<cmd>Telescope commands<cr>", desc = "Commands" },
      { "<leader>sg", Util.telescope("live_grep"), desc = "Grep (root dir)" },
      { "<leader>sG", Util.telescope("live_grep", { cwd = false }), desc = "Grep (cwd)" },
      { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Help Pages" },
      { "<leader>sH", "<cmd>Telescope highlights<cr>", desc = "Search Highlight Groups" },
      { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Key Maps" },
      { "<leader>sM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
      { "<leader>sm", "<cmd>Telescope marks<cr>", desc = "Jump to Mark" },
      { "<leader>so", "<cmd>Telescope vim_options<cr>", desc = "Options" },
      { "<leader>st", "<cmd>Telescope builtin<cr>", desc = "Telescope" },
      { "<leader>sw", Util.telescope("grep_string"), desc = "Word (root dir)" },
      { "<leader>sW", Util.telescope("grep_string", { cwd = false }), desc = "Word (cwd)" },
      {
        "<leader>vc",
        Util.telescope("colorscheme", { enable_preview = true }),
        desc = "Colorscheme with preview",
      },
      {
        "<leader>ss",
        Util.telescope("lsp_document_symbols", {
          symbols = {
            "Class",
            "Function",
            "Method",
            "Constructor",
            "Interface",
            "Module",
            "Struct",
            "Trait",
            "Field",
            "Property",
          },
        }),
        desc = "Goto Symbol",
      },
    },

    opts = {
      defaults = {
        prompt_prefix = " ",
        selection_caret = " ",
        color_devicons = true,
        mappings = {
          i = {
            ["<c-t>"] = function(...)
              return require("trouble.providers.telescope").open_with_trouble(...)
            end,
            ["<C-i>"] = function()
              Util.telescope("find_files", { no_ignore = true })()
            end,
            ["<C-h>"] = function()
              Util.telescope("find_files", { hidden = true })()
            end,
            ["<C-Down>"] = function(...)
              return require("telescope.actions").cycle_history_next(...)
            end,
            ["<C-Up>"] = function(...)
              return require("telescope.actions").cycle_history_prev(...)
            end,
            ["<ESC>"] = function(...)
              return require("telescope.actions").close(...)
            end,
          },
        },
        preview = {
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
        -- file_ignore_patterns = {
        -- 	"^%.lint%-todo/",
        -- 	"^%.git/",
        -- 	"^recordings/",
        -- 	"^node_modules/",
        -- 	"^bower_components/",
        -- },
      },
    },

    config = function(plugin, opts)
      local telescope = require("telescope")

      telescope.setup(opts)

      telescope.load_extension("fzf")
    end,
  },

  {
    "folke/which-key.nvim",

    event = "VeryLazy",

    opts = {
      layout = {
        height = { min = 4, max = 15 }, -- min and max height of the columns
        width = { min = 20, max = 50 }, -- min and max width of the columns
        spacing = 3, -- spacing between columns
        align = "left", -- align columns left, center or right
      },
      plugins = { spelling = true },
    },

    init = function()
      local wk = require("which-key")

      wk.register({
        mode = { "n", "v" },
        ["g"] = { name = "+goto" },
        ["gz"] = { name = "+surround" },
        ["]"] = { name = "+next" },
        ["["] = { name = "+prev" },
        ["<leader><tab>"] = { name = "+tabs" },
        b = "+buffer",
        c = "+coding",
        f = "+files",
        g = "+git",
        h = "+harpoon",
        n = { name = ":noh", cmd = "<cmd>noh<cr>" },
        P = "Buffer picker",
        q = "+quickfix",
        s = "+search",
        u = "+toggle config",
        v = "+vim Config",
        w = { "Save File" },
        x = "+diagnostics",
        z = "+dap (debug)",
        ["<space>"] = "Go to prev Buffer",
      }, { prefix = "<leader>" })
    end,
  },

  -- references
  {
    "RRethy/vim-illuminate",
    event = "BufReadPost",
    opts = { delay = 200 },
    config = function(_, opts)
      require("illuminate").configure(opts)
    end,
    -- stylua: ignore
    keys = {
      { "]]", function() require("illuminate").goto_next_reference(false) end, desc = "Next Reference", },
      { "[[", function() require("illuminate").goto_prev_reference(false) end, desc = "Prev Reference" },
    },
  },

  -- buffer remove
  {
    "echasnovski/mini.bufremove",
    -- stylua: ignore
    keys = {
      { "<leader>bd", function() require("mini.bufremove").delete(0, false) end, desc = "Delete Buffer" },
      { "<leader>bD", function() require("mini.bufremove").delete(0, true) end, desc = "Delete Buffer (Force)" },
    },
  },
}
