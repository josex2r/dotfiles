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

local registers_config = {
  name = "Registers",
  ['"'] = { "<cmd>Telescope neoclip<cr>", "Neooclip" },
  ['2'] = { "<cmd>Telescope neoclip unnamed<cr>", "Neooclip unnamed" },
}

local coc_config = {
  name = "CoC",
  a = { "<cmd>Telescope coc code_actions<cr>", "Code Actions" },
  c = { "<cmd>Telescope coc commands<cr>", "Code Commands" },
  d = { "<cmd>Telescope coc diagnostics<cr>", "Diagnostics" },
  f = { "<cmd>Telescope coc file_code_actions<cr>", "File Code Actions" },
  l = { "<cmd>Telescope coc line_code_actions<cr>", "Line Code Actions" },
  r = { "<cmd>Telescope coc references<cr>", "References" },
  s = { "<cmd>call coc#refresh()<cr>", "Refresh" },
  t = { "<cmd>CocCommand explorer --toggle --sources=file+<CR>", "File Tree" },
  w = { "<cmd>Telescope coc workspace_diagnostics<cr>", "Workspace Diagnostics" },
}

local dashboard_config = {
  name = "Dashboard",
  f = { "<cmd>DashboardFindFile<cr>", "Find File" },
  h = { "<cmd>DashboardFindHistory<cr>", "Find History" },
  j = { "<cmd>DashboardJumpMark<cr>", "Jump Mark" },
  l = { "<cmd>SessionLoad<cr>", "Load Session" },
  n = { "<cmd>DashboardNewFile<cr>", "New File" },
  s = { "<cmd>SessionSave<cr>", "Save Session" },
  w = { "<cmd>DashboardFindWord<cr>", "Find Word" },
}

local files_config = {
  name = "Files",
  b = { "<cmd>Telescope buffers<cr>", "Find Buffer" },
  f = { "<cmd>Telescope find_files<cr>", "Find File" },
  g = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
  h = { "<cmd>Telescope help_tags<cr>", "Help Tags" },
  r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
  t = { "<cmd>Telescope file_browser<cr>", "Workspace Tree View" },
}

local git_config = {
  name = "Git",
  b = { "<cmd>Git blame<CR>", "Blame File" },
  B = { "<cmd>lua require'gitsigns'.blame_line(true)<CR>", "Blame Line" },
  c = { "<cmd>Git commit<CR>", "Commit Changes" },
  d = { "<cmd>Git diff<CR>", "Diffview Index" },
  D = { "<cmd>DiffviewOpen<CR>", "Diffview Index" },
  e = { "<cmd>DiffviewClose<CR>", "Diffview Close" },
  m = { "<cmd>Git mergetool<CR>", "Mergetool" },
  p = { "<cmd>lua require'gitsigns'.preview_hunk()<CR>", "Preview Hunk" },
  r = { "<cmd>lua require'gitsigns'.reset_hunk()<CR>", "Reset Hunk" },
  R = { "<cmd>lua require'gitsigns'.reset_buffer()<CR>", "Reset Buffer" },
  s = { "<cmd>lua require'gitsigns'.stage_hunk()<CR>", 'Stage Hunk' },
  S = { "<cmd>lua require'gitsigns'.stage_buffer()<CR>", "Stage Buffer" },
  u = { "<cmd>lua require'gitsigns'.undo_stage_hunk()<CR>", 'Undo Stage Hunk' },
  U = { "<cmd>lua require'gitsigns'.reset_buffer_index()<CR>", "Reset Buffer Index" },
  w = { "<cmd>Telescope git_branches<cr>", "Branches" },
  x = { "<cmd>Telescope git_commits<cr>", "Commits" },
  y = { "<cmd>Telescope git_bcommits<cr>", "Buffer Commits" },
  z = { "<cmd>Telescope git_status<cr>", "Status" },
}

local git_visual_config = {
  name = "Git",
  b = { "<cmd>lua require'gitsigns'.stage_hunk({vim.fn.line('.'), vim.fn.line('v')})<CR>", "Stage Hunk" },
  r = { "<cmd>lua require'gitsigns'.reset_hunk({vim.fn.line('.'), vim.fn.line('v')})<CR>", "Reset Hunk" },
}

local lsp_config = {
  name = "LSP",
  c = { "<cmd>Telescope commands<cr>", "Commands" },
  f = { "<cmd>Telescope filetypes<cr>", "File Types" },
  k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
  m = { "<cmd>Telescope marks<cr>", "Marks" },
  p = { "<cmd>Telescope pickers<cr>", "Pickers" },
  q = { "<cmd>Telescope quickfix<cr>", "Quickfix" },
  t = { "<cmd>Telescope tags<cr>", "Tags" },
}

local search_config = {
  name = "Buffer Search",
  c = { "<cmd>HopChar1<cr>", "Jump to Char" },
  C = { "<cmd>HopChar2<cr>", "Jump to Chars" },
  f = { "<cmd>lua require('spectre').open_file_search()<cr>", "Search curr. File" },
  l = { "<cmd>HopLine<cr>", "Jump to Line" },
  p = { "<cmd>HopLine<cr>", "Jump to Line" },
  r = { "<cmd>HopPattern<cr>", "Jump to Regex" },
  s = { "<cmd>lua require('spectre').open()<cr>", "Search Window" },
  S = { "<cmd>lua require('spectre').open_visual({select_word=true})<cr>", "Search curr. Word" },
  w = { "<cmd>HopWord<cr>", "Jump to Word" },
}

local vim_config = {
  name = "Vim",
  i = { "<cmd>LspInstall<cr>", "Install LSP" },
  u = { "<cmd>LspUninstall<cr>", "Uninstall LSP" },
}

wk.register({
  ['"'] = registers_config,
  c = coc_config,
  d = dashboard_config,
  f = files_config,
  g = git_config,
  l = lsp_config,
  q = { '<cmd>CocCommand prettier.formatFile', "Prettier" },
  s = search_config,
  v = vim_config,
}, { prefix = "<leader>" })

wk.register({
  g = git_visual_config,
}, { mode = "v", prefix = "<leader>" })

wk.register(registers_config, { prefix = '"' })
wk.register(coc_config, { prefix = "<leader>c" })
wk.register(dashboard_config, { prefix = "<leader>d" })
wk.register(files_config, { prefix = "<leader>f" })
wk.register(git_config, { prefix = "<leader>g" })
wk.register(git_visual_config, { mode = "v", prefix = "<leader>g" })
wk.register(lsp_config, { prefix = "<leader>l" })
wk.register(search_config, { prefix = "<leader>s" })
wk.register(vim_config, { prefix = "<leader>v" })

