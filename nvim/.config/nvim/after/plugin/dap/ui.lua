local status_ok, dapui = pcall(require, "dapui")

if not status_ok then
	return
end

dapui.setup({
  layouts = {
    {
      elements = {
        'scopes',
        'breakpoints',
        'stacks',
        'watches',
      },
      size = 40,
      position = 'left',
    },
    {
      elements = {
        'repl',
        'console',
      },
      size = 10,
      position = 'bottom',
    },
  },
  floating = {
    max_height = nil, -- These can be integers or a float between 0 and 1.
    max_width = nil, -- Floats will be treated as percentage of your screen.
    border = "double", -- Border style. Can be "single", "double" or "rounded"
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
})

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
