-- https://github.com/harrisoncramer/nvim/blob/main/lua/plugins/dap/init.lua
return {
	"rcarriga/nvim-dap-ui",

	dependencies = {
		"harrisoncramer/mason-nvim-dap.nvim",
		"mfussenegger/nvim-dap",
		"mxsdev/nvim-dap-vscode-js",
	},

	config = function()
		local adapters = require("plugins.dap.adapters")
		local configurations = require("plugins.dap.configs")
		local dap_utils = require("plugins.dap.utils")

		local mason_dap = require("mason-nvim-dap")
		local dap = require("dap")
		local ui = require("dapui")

		dap.set_log_level("TRACE")

		-- ╭──────────────────────────────────────────────────────────╮
		-- │ Debuggers                                                │
		-- ╰──────────────────────────────────────────────────────────╯
		-- We need the actual programs to connect to running instances of our code.
		-- Debuggers are installed via https://github.com/jayp0521/mason-nvim-dap.nvim,
		-- however that repo removed the VSCode debugger because Mason doesn't directly support
		-- it, so I forked it and added it back myself. The debugger requires a
		-- special adapter, seen in /lua/plugins/dap/adapters.lua
		mason_dap.setup({
			ensure_installed = { "node2", "js" },
		})

		-- ╭──────────────────────────────────────────────────────────╮
		-- │ Adapters                                                 │
		-- ╰──────────────────────────────────────────────────────────╯
		-- Neovim needs a debug adapter with which it can communicate. Neovim can either
		-- launch the debug adapter itself, or it can attach to an existing one.
		-- To tell Neovim if it should launch a debug adapter or connect to one, and if
		-- so, how, you need to configure them via the `dap.adapters` table.
		adapters.setup(dap)

		-- ╭──────────────────────────────────────────────────────────╮
		-- │ Configuration                                            │
		-- ╰──────────────────────────────────────────────────────────╯
		-- In addition to launching (possibly) and connecting to a debug adapter, Neovim
		-- needs to instruct the adapter itself how to launch and connect to the program
		-- that you are trying to debug (the debugee).
		configurations.setup(dap)

		-- ╭──────────────────────────────────────────────────────────╮
		-- │ Keybindings + UI                                         │
		-- ╰──────────────────────────────────────────────────────────╯
		vim.fn.sign_define("DapBreakpoint", { text = "🐞" })
		-- vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DiagnosticError", linehl = "", numhl = "" })
		vim.fn.sign_define(
			"DapBreakpointCondition",
			{ text = "●", texthl = "DiagnosticWarn", linehl = "", numhl = "" }
		)
		vim.fn.sign_define("DapLogPoint", { text = "●", texthl = "DiagnosticInfo", linehl = "", numhl = "" })
		vim.fn.sign_define("DapStopped", { text = "→", texthl = "DiagnosticHint", linehl = "", numhl = "" })
		vim.fn.sign_define(
			"DapBreakpointRejected",
			{ text = "✕", texthl = "DiagnosticError", linehl = "", numhl = "" }
		)

		vim.keymap.set("n", "<leader>zs", function()
			dap.continue()
			ui.toggle({})
			vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-w>=", false, true, true), "n", false)
		end, { desc = "Start debugging" })
		vim.keymap.set("n", "<leader>zl", require("dap.ui.widgets").hover, { desc = "Debug info" })
		vim.keymap.set("n", "<leader>zc", dap.continue, { desc = "Continue" })
		vim.keymap.set("n", "<leader>zr", dap_utils.load, { desc = "Restore Breakpoints" })
		vim.keymap.set("n", "<leader>zz", function()
			dap.toggle_breakpoint()
			dap_utils.save()
		end, { desc = "Toggle Breakpoint" })
		vim.keymap.set("n", "<leader>zn", dap.step_over, { desc = "Step Over" })
		vim.keymap.set("n", "<leader>zi", dap.step_into, { desc = "Step Into" })
		vim.keymap.set("n", "<leader>zo", dap.step_out, { desc = "Step Out" })
		vim.keymap.set("n", "<leader>zC", function()
			dap.clear_breakpoints()
			dap_utils.save()
		end, { desc = "Clear Breakpoints" })

		-- TODO: How to get current adapter config? Could restart with current arguments
		vim.keymap.set("n", "<leader>zr", function()
			dap.terminate()
			vim.defer_fn(function()
				dap.continue()
			end, 300)
		end, { desc = "Restart adapter" })

		vim.keymap.set("n", "<leader>ze", function()
			dap.clear_breakpoints()
			ui.toggle({})
			dap.terminate()
			vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-w>=", false, true, true), "n", false)
		end, { desc = "End debug session" })

		-- UI Settings
		ui.setup({
			icons = { expanded = "▾", collapsed = "▸" },
			mappings = {
				expand = { "<CR>", "<2-LeftMouse>" },
				open = "o",
				remove = "d",
				edit = "e",
				repl = "r",
				toggle = "t",
			},
			expand_lines = vim.fn.has("nvim-0.7"),
			layouts = {
				{
					elements = {
						"scopes",
					},
					size = 0.3,
					position = "right",
				},
				{
					elements = {
						"repl",
						"breakpoints",
					},
					size = 0.3,
					position = "bottom",
				},
			},
			floating = {
				-- max_height = nil,
				-- max_width = nil,
				border = "single",
				mappings = {
					close = { "q", "<Esc>" },
				},
			},
			windows = { indent = 1 },
			render = {
				max_type_length = nil,
			},
		})
	end,
}
