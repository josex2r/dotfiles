return {
  -- improved hls search using virtual line
  { "kevinhwang91/nvim-hlslens", config = true },

  -- completion
  {
    "nvim-cmp",
    event = "VeryLazy",
    opts = function(_, opts)
      local cmp = require("cmp")

      opts.window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      }
    end,
  },

  -- scrollbar
  {
    "petertriho/nvim-scrollbar",
    event = "BufReadPost",

    opts = {
      handle = {
        color = "#333840",
      },
      handlers = {
        diagnostic = true,
        search = true, -- Requires hlslens to be loaded
      },
    },

    init = function()
      require("scrollbar.handlers.search").setup()
    end,
  },

  -- Highly experimental plugin that completely replaces the UI for messages, cmdline and the popupmenu.
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      cmdline = {
        view = "cmdline",
      },
      routes = {
        {
          filter = {
            event = "msg_show",
            any = {
              { find = "%d+L, %d+B" },
              { find = "; after #%d+" },
              { find = "; before #%d+" },
            },
          },
          view = "mini",
        },
      },
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        inc_rename = false, -- enables an input dialog for inc-rename.nvim
        -- lsp_doc_border = false,
        lsp_doc_border = true,
      },
    },
  },

  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = function()
      local logo = [[
          ▀████▀▄▄              ▄█
            █▀    ▀▀▄▄▄▄▄    ▄▄▀▀█
	   ▄        █          ▀▀▀▀▄  ▄▀
   ▄▀ ▀▄      ▀▄              ▀▄▀
  ▄▀    █     █▀   ▄█▀▄      ▄█
  ▀▄     ▀▄  █     ▀██▀     ██▄█
   ▀▄    ▄▀ █   ▄██▄   ▄  ▄  ▀▀ █
    █  ▄▀  █    ▀██▀    ▀▀ ▀▀  ▄▀
   █   █  █      ▄▄           ▄▀
      ]]

      logo = string.rep("\n", 8) .. logo .. "\n\n"

      local opts = {
        theme = "doom",
        hide = {
          -- this is taken care of by lualine
          -- enabling this messes up the actual laststatus setting after loading a file
          statusline = false,
        },
        config = {
          header = vim.split(logo, "\n"),
          -- stylua: ignore
          center = {
            { action = "Telescope find_files",              desc = " Find file",       icon = " ", key = "f" },
            { action = "ene | startinsert",                 desc = " New file",        icon = " ", key = "n" },
            { action = "Telescope oldfiles",                desc = " Recent files",    icon = " ", key = "r" },
            { action = "Telescope live_grep",               desc = " Find text",       icon = " ", key = "g" },
            { action = "e $MYVIMRC",                        desc = " Config",          icon = " ", key = "c" },
            { action = 'lua require("persistence").load()', desc = " Restore Session", icon = " ", key = "s" },
            { action = "LazyExtras",                        desc = " Lazy Extras",     icon = " ", key = "e" },
            { action = "Lazy",                              desc = " Lazy",            icon = "󰒲 ", key = "l" },
            { action = "qa",                                desc = " Quit",            icon = " ", key = "q" },
          },
          footer = function()
            local stats = require("lazy").stats()
            local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
            return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
          end,
        },
      }

      for _, button in ipairs(opts.config.center) do
        button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
      end

      -- close Lazy and re-open when the dashboard is ready
      if vim.o.filetype == "lazy" then
        vim.cmd.close()
        vim.api.nvim_create_autocmd("User", {
          pattern = "DashboardLoaded",
          callback = function()
            require("lazy").show()
          end,
        })
      end

      return opts
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter-context",
    enabled = false,
  },
}
