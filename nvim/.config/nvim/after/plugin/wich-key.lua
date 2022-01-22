local wk = require("which-key")

wk.setup {
  enable = true,
  layout = {
    height = { min = 4, max = 15 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = "left", -- align columns left, center or right
  },
}

local dashboard_config = {
  name = "Dashboard",
  f = { "Find File" },
  h = { "Find History" },
  j = { "Jump Mark" },
  l = { "Load Session" },
  n = { "New File" },
  s = { "Save Session" },
  w = { "Find Word" },
}

local diagnostics_config = {
  name = "Diagnostics (Trouble)",
  d = { "Document" },
  l = { "Location List" },
  q = { "Quickfix" },
  r = { "References" },
  s = { "LSP" },
  w = { "Workspace" },
}

local files_config = {
  name = "Files",
  b = { "<cmd>Telescope buffers<cr>", "Find Buffer" },
  f = { "<cmd>Telescope find_files<cr>", "Find File" },
  g = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
  h = { "<cmd>Telescope help_tags<cr>", "Help Tags" },
  r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
  w = { "<cmd>Telescope file_browser<cr>", "Workspace Tree View" },
}

local git_config = {
  name = "Git",
  b = { "Blame Line" },
  B = { "<cmd>Git blame<CR>", "Blame" },
  c = { "<cmd>Git commit<CR>", "Commit Changes" },
  d = { "<cmd>Git diff<CR>", "Diffview Index" },
  e = { "<cmd>DiffviewOpen<CR>", "Diffview Index" },
  E = { "<cmd>DiffviewClose<CR>", "Diffview Close" },
  m = { "<cmd>Git mergetool<CR>", "Mergetool" },
  p = { "Preview Hunk" },
  r = { "Reset Hunk" },
  R = { "Reset Buffer" },
  s = { "Stage Hunk" },
  S = { "Stage Buffer" },
  u = { "Undo Stage Hunk" },
  U = { "Reset Buffer Index" },
  w = { "<cmd>Telescope git_branches<cr>", "Branches" },
  x = { "<cmd>Telescope git_commits<cr>", "Commits" },
  y = { "<cmd>Telescope git_bcommits<cr>", "Buffer Commits" },
  z = { "<cmd>Telescope git_status<cr>", "Status" },
}

local git_visual_config = {
  name = "Git",
  b = { "Stage Hunk" },
  r = { "Reset Hunk" },
}

local lsp_config = {
  name = "LSP",
  c = { "<cmd>Telescope commands<cr>", "Commands" },
  f = { "<cmd>Telescope filetypes<cr>", "File Types" },
  i = { "<cmd>LspInstallInfo<cr>", "Install LSP Server" },
  I = { "<cmd>LspInfo<cr>", "Lsp Servers Info" },
  k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
  m = { "<cmd>Telescope marks<cr>", "Marks" },
  p = { "<cmd>Telescope pickers<cr>", "Pickers" },
  q = { "<cmd>Telescope quickfix<cr>", "Quickfix" },
  t = { "<cmd>Telescope tags<cr>", "Tags" },
}

local code_config = {
  name = "LSP Code",
  a = { "Code Action" },
  d = { "Buff Definitions" },
  f = { "Format" },
  k = { "Signature Help" },
  r = { "Buff Rename" },
  q = { "Loclist" },
}

local search_config = {
  name = "Buffer Search",
  c = { "<cmd>HopChar1<cr>", "Jump to Char" },
  C = { "<cmd>HopChar2<cr>", "Jump to Chars" },
  -- f = { "<cmd>lua require('spectre').open_file_search()<cr>", "Search curr. File" },
  f = { "Search" },
  F = { "Search & Replace" },
  l = { "<cmd>HopLine<cr>", "Jump to Line" },
  p = { "<cmd>HopLine<cr>", "Jump to Line" },
  r = { "<cmd>HopPattern<cr>", "Jump to Regex" },
  s = { "<cmd>lua require('spectre').open()<cr>", "Search Window" },
  S = { "<cmd>lua require('spectre').open_visual({select_word=true})<cr>", "Search curr. Word" },
  w = { "<cmd>HopWord<cr>", "Jump to Word" },
}

local vim_config = {
  name = "Vim",
  i = { "<cmd>LspInstallInfo<cr>", "Install LSP" },
  u = { "<cmd>LspUninstall<cr>", "Uninstall LSP" },
}

local dap_config = {
  name = "Debugging (DAP)",
  b = { "Breakpoints" },
  c = { "Commands" },
  f = { "Frames" },
  m = { "Test Method" },
  M = { "Test Class" },
  u = { "UI" },
  v = { "Variables" },
  x = { "Configurations" },
}

local dap_run_config = {
  name = "Debugging (Playback)",
  a = { "Continue" },
  s = { "Step Over" },
  d = { "step Into" },
  f = { "Step Out" },
  z = { "Toggle Breakpoint" },
  x = { "Conditional Breakpoint" },
  c = { "Log Breakpoint" },
  r = { "REPL" },
  l = { "Run last" },
}

local dap_visual_config = {
  name = "Debugging (DAP)",
  d = { "Debug Selection" },
}

wk.register({
  a = { "Aerial" },
  c = code_config,
  d = diagnostics_config,
  D = dashboard_config,
  f = files_config,
  g = git_config,
  i = { "Ember Import" },
  l = lsp_config,
  s = search_config,
  v = vim_config,
  x = dap_config,
  z = dap_run_config,
}, { prefix = "<leader>" })

wk.register({
  d = dap_visual_config,
  g = git_visual_config,
  t = { '<cmd>lua vim.lsp.buf.range_formatting()<cr>', "Format Selected" },
}, { mode = "v", prefix = "<leader>" })
