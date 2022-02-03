vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
vim.g.copilot_tab_fallback = ""
vim.g.copilot_filetypes = {
	TelescopePrompt = false,
}

-- Mappings
vim.cmd([[
  let g:copilot_no_tab_map = v:true
  imap <silent><script><expr> <C-g> copilot#Accept("\<CR>")
]])
