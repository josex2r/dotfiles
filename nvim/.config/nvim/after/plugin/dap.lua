local status_ok, dap = pcall(require, "dap")

if not status_ok then
	return
end

local dapui = require("dapui")

-- Setup DAP UI
dapui.setup()

-- Auto open/close UI on debug
-- dap.listeners.after.event_initialized["dapui_config"] = function()
-- 	dapui.open()
-- end
--
-- dap.listeners.before.event_terminated["dapui_config"] = function()
-- 	dapui.close()
-- end
--
-- dap.listeners.before.event_exited["dapui_config"] = function()
-- 	dapui.close()
-- end

-- Remove statusline from UI
-- vim.cmd [[
--   autocmd FileType dapui_scopes set statusline=\
--   autocmd FileType dapui_breakpoints set statusline=\
--   autocmd FileType dapui_stacks set statusline=\
--   autocmd FileType dapui_watches set statusline=\
-- ]]
-- autocmd FileType dap-repl set statusline=\

-- Setup icons
vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DiagnosticError", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointCondition", { text = "●", texthl = "DiagnosticWarn", linehl = "", numhl = "" })
vim.fn.sign_define("DapLogPoint", { text = "●", texthl = "DiagnosticInfo", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "→", texthl = "DiagnosticHint", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointRejected", { text = "✕", texthl = "DiagnosticError", linehl = "", numhl = "" })

-- Autocomplete in REPL
vim.cmd([[
au FileType dap-repl lua require('dap.ext.autocompl').attach()
]])

-- Close floating on pressing "q|<ESC>"
vim.cmd([[
  autocmd FileType dap-float nnoremap <buffer><silent> q <cmd>close!<CR>
  autocmd FileType dap-float nnoremap <buffer><silent> <ESC> <cmd>close!<CR>
]])

-- DAP Python

-- cd ~
-- mkdir .virtualenvs
-- cd .virtualenvs
-- python -m venv debugpy
-- debugpy/bin/python -m pip install debugpy
require("dap-python").setup("~/.virtualenvs/debugpy/bin/python")
-- lua require('dap-python').test_runner = 'pytest' -- 'unittest' as default value

require("nvim-dap-virtual-text").setup({
	enabled = true, -- enable this plugin (the default)
	enabled_commands = true, -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
	highlight_changed_variables = true, -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
	highlight_new_as_changed = false, -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
	show_stop_reason = true, -- show stop reason when stopped for exceptions
	commented = false, -- prefix virtual text with comment string
	-- experimental features:
	virt_text_pos = "eol", -- position of virtual text, see `:h nvim_buf_set_extmark()`
	all_frames = false, -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
	virt_lines = false, -- show virtual lines instead of virtual text (will flicker!)
	virt_text_win_col = nil, -- position the virtual text at a fixed window column (starting from the first text column) ,
	-- e.g. 80 to position at column 80, see `:h nvim_buf_set_extmark()`
})

require("telescope").load_extension("dap")

-- Mappings
local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap("n", "<leader>xc", "<cmd>Telescope dap commands<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>xx", "<cmd>Telescope dap configurations<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>xb", "<cmd>Telescope dap list_breakpoints<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>xv", "<cmd>Telescope dap variables<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>xf", "<cmd>Telescope dap frames<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>xh", "<cmd>lua require('dap.ui.widgets').hover()<CR>", opts)

vim.api.nvim_set_keymap("n", "<leader>xm", '<cmd>lua require("dap-python").test_method()<CR>', opts)
vim.api.nvim_set_keymap("n", "<leader>xM", '<cmd>lua require("dap-python").test_class()<CR>', opts)
vim.api.nvim_set_keymap("v", "<leader>xd", '<cmd>lua require("dap-python").debug_selection()<CR>', opts)

vim.api.nvim_set_keymap("n", "<leader>xu", '<cmd>lua require("dapui").toggle()<CR>', opts)

vim.api.nvim_set_keymap("n", "<leader>z1", '<cmd>lua require("dap").continue()<CR>', opts)
vim.api.nvim_set_keymap("n", "<leader>z2", '<cmd>lua require("dap").step_over()<CR>', opts)
vim.api.nvim_set_keymap("n", "<leader>z3", '<cmd>lua require("dap").step_into()<CR>', opts)
vim.api.nvim_set_keymap("n", "<leader>z4", '<cmd>lua require("dap").step_out()<CR>', opts)
vim.api.nvim_set_keymap("n", "<leader>zz", '<cmd>lua require("dap").toggle_breakpoint()<CR>', opts)
vim.api.nvim_set_keymap("n", "<leader>zh", "<cmd>lua require('dap.ui.widgets').hover()<CR>", opts)
vim.api.nvim_set_keymap(
	"n",
	"<leader>zx",
	'<cmd>lua require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>',
	opts
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>zc",
	'<cmd>lua require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>',
	opts
)
vim.api.nvim_set_keymap("n", "<leader>zr", '<cmd>lua require("dap").repl.open()<CR>', opts)
vim.api.nvim_set_keymap("n", "<leader>zl", '<cmd>lua require("dap").run_last<CR>', opts)
