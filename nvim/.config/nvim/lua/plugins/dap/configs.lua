-- Launch or attach to a running Javascript/Typescript process
local jsOrTs = {
  {
    type = "node2",
    name = "Launch",
    request = "launch",
    program = "${file}",
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = "inspector",
    console = "integratedTerminal",
  },
  {
    type = "node2",
    name = "Attach",
    request = "attach",
    program = "${file}",
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = "inspector",
    console = "integratedTerminal",
  },
  {
    name = "Vitest Debug",
    type = "pwa-node",
    request = "launch",
    cwd = vim.fn.getcwd(),
    program = "${workspaceFolder}/node_modules/vitest/vitest.mjs",
    args = { "--threads", "false", "run", "${file}" },
    autoAttachChildProcesses = true,
    smartStep = true,
    console = "integratedTerminal",
    skipFiles = { "<node_internals>/**", "node_modules/**" },
  },
}

local chrome_debugger = {
  type = "pwa-chrome",
  request = "launch",
  name = "Chrome",
  webRoot = "${workspaceFolder}",
}

local function get_arguments()
  local co = coroutine.running()
  if co then
    return coroutine.create(function()
      local args = {}
      vim.ui.input({ prompt = "Args: " }, function(input)
        args = vim.split(input or "", " ")
      end)
      coroutine.resume(co, args)
    end)
  else
    local args = {}
    vim.ui.input({ prompt = "Args: " }, function(input)
      args = vim.split(input or "", " ")
    end)
    return args
  end
end

local python = {
  {
    type = "python",
    request = "launch",
    name = "launch with options",
    program = "${file}",
    python = function() end,
    pythonPath = function()
      local path
      for _, server in pairs(vim.lsp.buf_get_clients()) do
        path = vim.tbl_get(server, "config", "settings", "python", "pythonPath")
        if path then
          break
        end
      end
      path = vim.fn.input("Python path: ", path or "", "file")
      return path ~= "" and vim.fn.expand(path) or nil
    end,
    args = function()
      local args = {}
      local i = 1
      while true do
        local arg = vim.fn.input("Argument [" .. i .. "]: ")
        if arg == "" then
          break
        end
        args[i] = arg
        i = i + 1
      end
      return args
    end,
    justMyCode = function()
      return vim.fn.input("justMyCode? [y/n]: ") == "y"
    end,
    stopOnEntry = function()
      return vim.fn.input("justMyCode? [y/n]: ") == "y"
    end,
    console = "integratedTerminal",
  },
}

local go = {
  {
    type = "go",
    name = "Debug",
    request = "launch",
    program = "${file}",
  },
  {
    type = "go",
    name = "Debug (Arguments)",
    request = "launch",
    program = "${file}",
    args = get_arguments,
  },
  {
    type = "go",
    name = "Debug test (go.mod)",
    request = "launch",
    mode = "test",
    program = "./${relativeFileDirname}",
  },
  -- Build the binary (go build -gcflags=all="-N -l") and run it + pick it
  {
    type = "go",
    name = "Attach (Pick Process)",
    mode = "local",
    request = "attach",
    processId = require("plugins.dap.utils").pick_process,
  },
  {
    type = "go",
    name = "Attach (127.0.0.1:9080)",
    mode = "remote",
    request = "attach",
    port = "9080",
  },
}

return {
  setup = function(dap)
    dap.configurations = {
      javascript = jsOrTs,
      typescript = jsOrTs,
      javascriptreact = chrome_debugger,
      typescriptreact = chrome_debugger,
      vue = chrome_debugger,
      go = go,
      python = python,
    }
  end,
}
