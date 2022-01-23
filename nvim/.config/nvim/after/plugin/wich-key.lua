local status_ok, wk = pcall(require, "which-key")

if not status_ok then
	return
end

wk.setup({
	enable = true,
	layout = {
		height = { min = 4, max = 15 }, -- min and max height of the columns
		width = { min = 20, max = 50 }, -- min and max width of the columns
		spacing = 3, -- spacing between columns
		align = "left", -- align columns left, center or right
	},
})

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
	r = { "References (LSP)" },
	s = { "Document (LSP)" },
	w = { "Workspace (LSP)" },
}

local files_config = {
	name = "Files",
	b = { "Find Buffer" },
	f = { "Find File" },
	g = { "Live Grep" },
	h = { "Help Tags" },
	r = { "Open Recent File" },
	w = { "Workspace Tree View" },
}

local git_config = {
	name = "Git",
	b = { "Blame Line" },
	B = { "Blame File" },
	c = { "Commit Changes" },
	d = { "Diffview Index" },
	e = { "Diffview Index" },
	E = { "Diffview Close" },
	m = { "Mergetool" },
	p = { "Preview Hunk" },
	r = { "Reset Hunk" },
	R = { "Reset Buffer" },
	s = { "Stage Hunk" },
	S = { "Stage Buffer" },
	u = { "Undo Stage Hunk" },
	U = { "Reset Buffer Index" },
	w = { "Branches" },
	x = { "Commits" },
	y = { "Buffer Commits" },
	z = { "Status" },
}

local git_visual_config = {
	name = "Git",
	b = { "Stage Hunk" },
	r = { "Reset Hunk" },
}

local lsp_config = {
	name = "LSP",
	c = { "Commands" },
	f = { "File Types" },
	i = { "<cmd>LspInstallInfo<cr>", "Install LSP Server" },
	I = { "<cmd>LspInfo<cr>", "Lsp Servers Info" },
	k = { "Keymaps" },
	m = { "Marks" },
	p = { "Pickers" },
	q = { "Quickfix" },
	t = { "Tags" },
}

local code_config = {
	name = "LSP Code",
	a = { "Code Action" },
	d = { "Buff Definitions" },
  e = { "EasyAlign" },
	f = { "Format" },
	k = { "Signature Help" },
	r = { "Buff Rename" },
	t = { "Symbols, Variables, Functions, ..." },
	q = { "Loclist" },
}

local packer_config = {
	name = "Packer",
	c = { "<cmd>PackerCompile<cr>", "Compile" },
	i = { "<cmd>PackerInstall<cr>", "Install" },
	s = { "<cmd>PackerSync<cr>", "Sync" },
	u = { "<cmd>PackerUpdate<cr>", "Update" },
}

local quickfix_config = {
	name = "Packer",
  k = { "Prev" },
	j = { "Next" },
	o = { "Open" },
	q = { "Close" },
}

local search_config = {
	name = "Buffer Search",
	c = { "<cmd>HopChar1<cr>", "Jump to Char" },
	C = { "<cmd>HopChar2<cr>", "Jump to Chars" },
	f = { "Search Window (Spectre)" },
	F = { "Search Current Word (Spectre)" },
	l = { "<cmd>HopLine<cr>", "Jump to Line" },
	p = { "<cmd>HopLine<cr>", "Jump to Line" },
	r = { "<cmd>HopPattern<cr>", "Jump to Regex" },
	s = { "Search (Box)" },
	S = { "Search & Replace (Box)" },
	w = { "<cmd>HopWord<cr>", "Jump to Word" },
}

local vim_config = {
	name = "Vim",
	c = { "Change Theme" },
	s = { "Toggle Darker Theme" },
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
	n = { "Find in Tree" },
  p = packer_config,
  q = quickfix_config,
	s = search_config,
  t = { "Toggle Tree" },
	v = vim_config,
  w = { "Save File" },
	x = dap_config,
	z = dap_run_config,
	["<space>"] = { "Go to previous File" },
}, { prefix = "<leader>" })

wk.register({
	d = dap_visual_config,
	g = git_visual_config,
	t = { "<cmd>lua vim.lsp.buf.range_formatting()<cr>", "Format Selected" },
}, { mode = "v", prefix = "<leader>" })
