local ultest_status, ultest = pcall(require, "ultest")

if not ultest_status then
	return
end

vim.g.ultest_use_pty = 1

vim.cmd([[
let test#python#pytest#options = "--color=yes"
let g:ultest_running_sign="§"
let g:ultest_running_text="§"
]])

-- vim.cmd([[
-- function! Autoinstall_pynvim()
--   let l:python3_neovim_path = substitute(system("python3 -c 'import pynvim; print(pynvim.__path__)' 2>/dev/null"), '\n\+$', '', '')
--   if empty(l:python3_neovim_path)
--     execute ("!python3 -m pip install pynvim")
--   endif
-- endfunction
--
-- call timer_start(0, { -> Autoinstall_pynvim() })
-- ]])

local builders = {
	python = function(cmd)
		-- The command can start with python command directly or an env manager
		local non_modules = { "python", "pipenv", "poetry" }
		-- Index of the python module to run the test.
		local module_index = 1
		if vim.tbl_contains(non_modules, cmd[1]) then
			module_index = 3
		end
		local module = cmd[module_index]

		-- Remaining elements are arguments to the module
		local args = vim.list_slice(cmd, module_index + 1)
		return {
			dap = {
				type = "python",
				request = "launch",
				module = module,
				args = args,
			},
		}
	end,
}

-- ultest.setup({ builders = builders })
