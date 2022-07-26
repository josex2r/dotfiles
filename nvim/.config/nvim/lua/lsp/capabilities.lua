local cmp = require("cmp_nvim_lsp")

local capabilities = cmp.update_capabilities(vim.lsp.protocol.make_client_capabilities())

return capabilities
