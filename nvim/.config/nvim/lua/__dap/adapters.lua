local dap_vscode_ok, dap_vscode = pcall(require, "dap-vscode-js")
if not dap_vscode_ok then
  require("notify")("dap-vscode-js not installed!", "warning")
  return
end

return {
  setup = function(dap)
    dap.adapters.python = function(cb, config)
      if config.request == "attach" then
        ---@diagnostic disable-next-line: undefined-field
        local port = (config.connect or config).port
        ---@diagnostic disable-next-line: undefined-field
        local host = (config.connect or config).host or "127.0.0.1"
        cb({
          type = "server",
          port = assert(port, "`connect.port` is required for a python `attach` configuration"),
          host = host,
          enrich_config = enrich_config,
          options = {
            source_filetype = "python",
          },
        })
      else
        print(vim.inspect(config))
        cb({
          type = "executable",
          command = adapter_python_path,
          args = { "-m", "debugpy.adapter" },
          enrich_config = enrich_config,
          options = {
            source_filetype = "python",
          },
        })
      end
    end

    dap.adapters.node2 = {
      type = "executable",
      command = "node",
      args = { vim.fn.stdpath("data") .. "/mason/packages/node-debug2-adapter/out/src/nodeDebug.js" },
    }

    dap.adapters.go = {
      type = "server",
      port = "${port}",
      executable = {
        command = vim.fn.stdpath("data") .. "/mason/bin/dlv",
        args = { "dap", "-l", "127.0.0.1:${port}" },
      },
    }

    -- The VSCode Debugger requires a special setup
    dap_vscode.setup({
      adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" },
      debugger_path = vim.fn.stdpath("data") .. "/mason/bin/js-debug-adapter", -- Path to VSCode Debugger
      debugger_cmd = { "js-debug-adapter" },
    })
  end,
}
