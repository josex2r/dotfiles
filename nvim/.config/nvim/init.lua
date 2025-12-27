-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Custom
require("config.commands")

vim.lsp.set_log_level("off")
-- vim.lsp.set_log_level("DEBUG")
