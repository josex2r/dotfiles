local os = require("os")
local status_ok, dpython = pcall(require, "dap-python")

if not status_ok then
	return
end

local dap = require("dap")

-- cd ~
-- mkdir .virtualenvs
-- cd .virtualenvs
-- python -m venv debugpy
-- debugpy/bin/python -m pip install debugpy
local venv_path = os.getenv("VIRTUAL_ENV")
local python_path = venv_path and venv_path .. "/bin/python" or "~/.virtualenvs/debugpy/bin/python"

dpython.setup(python_path)

-- dpython.test_runner = 'pytest' -- 'unittest' as default value
