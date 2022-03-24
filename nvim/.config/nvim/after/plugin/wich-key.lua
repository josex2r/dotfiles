local status_ok, wk = pcall(require, "which-key")

if not status_ok then
	require("utils.debug").log.error("Couldn't load plugin", "which-key.lua")
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

local harpoon_config = {
	name = "Harpoon",
	a = { "Add mark" },
	c = { "Clear all mark" },
	h = { "Telescope finder" },
	n = { "Next" },
	p = { "Prev" },
	r = { "Remove mark" },
	t = { "Toggle mark" },
}

local lsp_config = {
	name = "LSP",
	c = { "Commands" },
	d = { "<cmd>lua vim.lsp.set_log_level('debug')<CR>", "Debug (~/.cache/nvim/lsp.log)" },
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
	D = { "Document function" },
	e = { "EasyAlign" },
	f = { "Format" },
	k = { "Signature Help" },
	r = { "Buff Rename" },
	t = { "Symbols, Variables, Functions, ..." },
	q = { "Loclist" },
}

local annotation_config = {
	name = "LSP Code",
	c = { "Class" },
	f = { "Function" },
	F = { "File" },
	t = { "Type" },
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
	f = { "Search Window (Spectre)" },
	F = { "Search Current Word (Spectre)" },
	s = { "Search (Box)" },
	S = { "Search & Replace (Box)" },
}

local vim_config = {
	name = "Vim",
	c = { "Change Theme" },
	p = { "Select Project" },
	s = { "Toggle Darker Theme" },
}

local dap_config = {
	name = "Debugging (DAP)",
	b = { "Breakpoints" },
	c = { "Commands" },
	f = { "Frames" },
	m = { "Test Method" },
	h = { "Inspect" },
	M = { "Test Class" },
	u = { "UI" },
	v = { "Variables" },
	x = { "Configurations" },
}

local dap_run_config = {
	name = "Debugging (Playback)",
	["1"] = { "Continue" },
	["2"] = { "Step Over" },
	["3"] = { "step Into" },
	["4"] = { "Step Out" },
	h = { "Inspect" },
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
	a = { "LSP Symbols" },
	c = code_config,
	d = diagnostics_config,
	D = dashboard_config,
	f = files_config,
	g = git_config,
  h = harpoon_config,
	i = { "Ember Import" },
	l = lsp_config,
	n = annotation_config,
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
