local status_ok, dapui = pcall(require, "dapui")

if not status_ok then
	return
end

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
