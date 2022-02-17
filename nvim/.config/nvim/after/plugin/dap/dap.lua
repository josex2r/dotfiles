local os = require('os')
local status_ok, dap = pcall(require, "dap")

if not status_ok then
	return
end

dap.defaults.fallback.terminal_win_cmd = '80vsplit new'


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
