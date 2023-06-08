local icons = require("config.icons")

local hide_in_width = function()
  return vim.fn.winwidth(0) > 80
end

-- cool function for progress
local progress = function()
  local current_line = vim.fn.line(".")
  local total_lines = vim.fn.line("$")
  local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
  local line_ratio = current_line / total_lines
  local index = math.ceil(line_ratio * #chars)

  return chars[index]
end

local disabled_filetypes = vim.o.laststatus == 3 and {} or { "dashboard", "lazy", "Outline", "alpha" }

local function fg(name)
  return function()
    ---@type {foreground?:number}?
    local hl = vim.api.nvim_get_hl_by_name(name, true)
    return hl and hl.foreground and { fg = string.format("#%06x", hl.foreground) }
  end
end

return {
  {
    "nvim-lualine/lualine.nvim",

    event = "VeryLazy",

    config = function()
      local lualine = require("lualine")
      local navic = require("nvim-navic")

      lualine.setup({
        options = {
          icons_enabled = true,
          theme = "auto",
          component_separators = { left = "|", right = "|" },
          section_separators = { left = "", right = "" },
          disabled_filetypes = disabled_filetypes,
          globalstatus = true,
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = {
            -- 'branch',
            {
              "diff",
              colored = false,
              symbols = require("config.icons").git,
              cond = hide_in_width,
            },
            {
              "diagnostics",
              symbols = {
                error = icons.diagnostics.Error,
                warn = icons.diagnostics.Warn,
                info = icons.diagnostics.Info,
                hint = icons.diagnostics.Hint,
              },
            },
          },
          lualine_c = {
            { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
            { "filename", path = 1, symbols = { modified = "  ", readonly = "", unnamed = "" } },
            { navic.get_location, cond = navic.is_available },
          },
          -- lualine_x = { "encoding", "fileformat", "filetype" },
          lualine_x = {
            {
              function()
                return require("noice").api.status.command.get()
              end,
              cond = function()
                return package.loaded["noice"] and require("noice").api.status.command.has()
              end,
              color = fg("Statement"),
            },
            {
              function()
                return require("noice").api.status.mode.get()
              end,
              cond = function()
                return package.loaded["noice"] and require("noice").api.status.mode.has()
              end,
              color = fg("Constant"),
            },
            {
              require("lazy.status").updates,
              cond = require("lazy.status").has_updates,
              color = fg("Special"),
            },
          },
          lualine_y = { progress },
          lualine_z = { "location" },
        },
        extensions = { "neo-tree" },
      })
    end,
  },

  -- lsp symbol navigation for lualine
  {
    "SmiteshP/nvim-navic",

    init = function()
      vim.g.navic_silence = true

      require("lazyvim.util").on_attach(function(client, buffer)
        require("nvim-navic").attach(client, buffer)
      end)
    end,

    opts = { separator = " ", highlight = true, depth_limit = 5 },
  },
}
