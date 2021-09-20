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

wk.register({
  c = {
    name = "CoC",
    a = { "<cmd>Telescope coc code_actions<cr>", "Code Actions" },
    c = { "<cmd>Telescope coc commands<cr>", "Code Commands" },
    d = { "<cmd>Telescope coc diagnostics<cr>", "Diagnostics" },
    f = { "<cmd>Telescope coc file_code_actions<cr>", "File Code Actions" },
    l = { "<cmd>Telescope coc line_code_actions<cr>", "Line Code Actions" },
    r = { "<cmd>Telescope coc references<cr>", "References" },
    t = { "<cmd>CocCommand explorer --toggle --sources=file+<CR>", "File Tree" },
    w = { "<cmd>Telescope coc workspace_diagnostics<cr>", "Workspace Diagnostics" },
  },

  f = {
    name = "Files",
    b = { "<cmd>Telescope buffers<cr>", "Find Buffer" },
    f = { "<cmd>Telescope find_files<cr>", "Find File" },
    g = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
    h = { "<cmd>Telescope help_tags<cr>", "Help Tags" },
    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
    t = { "<cmd>Telescope file_browser<cr>", "Workspace Tree View" },
  },

  g = {
    name = "Git",
    b = { "<cmd>Telescope git_branches<cr>", "Branches" },
    c = { "<cmd>Telescope git_commits<cr>", "Commits" },
    d = { "<cmd>Telescope d<cr>", "Buffer Commits" },
    s = { "<cmd>Telescope git_status<cr>", "Status" },
  },

  v = {
    name = "Vim",
    c = { "<cmd>Telescope commands<cr>", "Commands" },
    c = { "<cmd>Telescope filetypes<cr>", "File Types" },
    k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
    m = { "<cmd>Telescope marks<cr>", "Marks" },
    p = { "<cmd>Telescope pickers<cr>", "Pickers" },
    q = { "<cmd>Telescope quickfix<cr>", "Quickfix" },
    t = { "<cmd>Telescope tags<cr>", "Tags" },
  },

}, { prefix = "<leader>" })

